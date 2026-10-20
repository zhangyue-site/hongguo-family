import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';

import 'package:http/http.dart' as http;
import 'package:pointycastle/block/aes.dart';
import 'package:pointycastle/block/modes/ecb.dart';
import 'package:pointycastle/api.dart';

/// Direct media pipeline mirroring the native Android client: fetch the
/// episode media model, choose the best decodable track, download it and, for
/// CENC-protected samples, decrypt them into a plain MP4 that AVPlayer can
/// render. The public 360p website path stays available as a fallback.
class DirectMediaException implements Exception {
  const DirectMediaException(this.message, {this.retryable = false});
  final String message;
  final bool retryable;
  @override
  String toString() => message;
}

class DirectMedia {
  const DirectMedia({
    required this.file,
    required this.width,
    required this.height,
    required this.quality,
    required this.decrypted,
  });
  final File file;
  final int width, height, quality;
  final bool decrypted;
}

class MediaTrack {
  const MediaTrack({
    required this.url,
    required this.width,
    required this.height,
    required this.size,
    required this.codec,
    required this.quality,
    this.spadeKey = '',
  });
  final String url, codec, spadeKey;
  final int width, height, size, quality;
}

/// Result of one media-model response, already normalized.
class MediaModel {
  const MediaModel(this.tracks);
  final List<MediaTrack> tracks;

  static MediaModel parse(dynamic payload) {
    dynamic model = payload;
    if (model is String) {
      if (model.isEmpty) throw const DirectMediaException('媒体数据为空');
      if (model.length > 2 * 1024 * 1024) {
        throw const DirectMediaException('媒体数据过大');
      }
      try {
        model = jsonDecode(model);
      } on FormatException {
        try {
          model = jsonDecode(utf8.decode(base64.decode(model)));
        } catch (_) {
          throw const DirectMediaException('媒体数据格式异常');
        }
      }
    }
    if (model is! Map) throw const DirectMediaException('媒体数据格式异常');
    final list = model['video_list'];
    final rows = <dynamic>[];
    if (list is List) {
      rows.addAll(list);
    } else if (list is Map) {
      rows.addAll(list.values);
    } else {
      throw const DirectMediaException('媒体数据缺少轨道');
    }
    if (rows.length > 32) throw const DirectMediaException('媒体轨道过多');
    final tracks = <MediaTrack>[];
    for (final row in rows) {
      if (row is! Map) continue;
      final meta = row['video_meta'];
      // Nested video_meta values take precedence, matching the native reader.
      final m = meta is Map ? {...row, ...meta} : row;
      final url = '${m['main_url'] ?? ''}';
      final width = _int(m['vwidth'] ?? m['width']);
      final height = _int(m['vheight'] ?? m['height']);
      final size = _int(m['size']);
      if (url.isEmpty || width <= 0 || height <= 0 || size <= 0) continue;
      if (!url.startsWith('https://')) continue;
      final quality = RegExp(r'4:(\d{3,4})p').firstMatch('${m['gear_des_key']}')
          ?.group(1);
      final codec = '${m['codec_type'] ?? ''}'.toLowerCase();
      String? spade;
      final encrypt = row['encrypt_info'];
      if (encrypt is Map) {
        // The key envelope ships even for tracks the server marks encrypted;
        // keep whatever is present so choose() can filter later.
        spade = '${encrypt['spade_a'] ?? ''}';
      }
      tracks.add(MediaTrack(
        url: url,
        width: width,
        height: height,
        size: size,
        codec: codec,
        quality: int.tryParse(quality ?? '') ?? 0,
        spadeKey: spade ?? '${m['spade_a'] ?? ''}',
      ));
    }
    return MediaModel(tracks);
  }

  static int _int(dynamic v) => v is int ? v : int.tryParse('$v') ?? 0;

  /// Mirrors the Android MediaTrackPolicy: prefer AVC, then the smallest
  /// scored track at or below the ceiling.
  MediaTrack? choose({int ceiling = 1080,
      int budget = DirectMediaService.maxFileBytes}) {
    const maxSpan = {480: 854, 720: 1280, 1080: 1920};
    if (!maxSpan.containsKey(ceiling)) {
      throw ArgumentError.value(ceiling, 'ceiling');
    }
    MediaTrack? best;
    var bestScore = double.infinity;
    for (final t in tracks) {
      if (t.size > budget) continue;
      final mime = _mime(t.codec);
      if (mime == null) continue;
      final lo = min(t.width, t.height), hi = max(t.width, t.height);
      if (lo <= 0 || lo > ceiling || hi > maxSpan[ceiling]!) continue;
      final rank = lo >= 1080 ? 0 : lo >= 720 ? 1 : lo >= 480 ? 2 : 3;
      final score = rank * budget * 2.0 + t.size + (mime == 'avc' ? 0 : budget);
      if (score < bestScore) {
        bestScore = score;
        best = t;
      }
    }
    return best;
  }

  static String? _mime(String codec) {
    if (['h264', 'avc', 'avc1', 'video/avc'].contains(codec)) return 'avc';
    if (['bytevc1', 'hevc', 'h265', 'hev1', 'hvc1', 'video/hevc']
        .contains(codec)) {
      return 'hevc';
    }
    return null;
  }
}

/// Tracks whether the direct source worked at all, for user-visible hints.
class DirectMediaService {
  DirectMediaService({
    http.Client? client,
    Future<SharedPreferencesLike> Function()? store,
    Directory? cacheDir,
    int qualityCeiling = 1080,
    this.keepIntermediates = false,
  }) : _client = client ?? http.Client(),
       _store = store,
       _cacheDir = cacheDir,
       _ceiling = qualityCeiling;

  /// Keeps the downloaded encrypted file when decryption fails, so real
  /// content can be pulled from the device and analysed offline.
  final bool keepIntermediates;

  final http.Client _client;
  final Future<SharedPreferencesLike> Function()? _store;
  final Directory? _cacheDir;
  final int _ceiling;
  String? _deviceId, _iid;
  static const maxFileBytes = 256 * 1024 * 1024;
  static const _apiHost = 'api5-normal-sinfonlineb.fqnovel.com';
  static const _attempts = 4;
  static const _backoffs = [1200, 2000, 3200];

  /// Fetches, downloads and (when needed) decrypts one episode.
  Future<DirectMedia> prepare(
    String videoId, {
    Directory? cacheDir,
    void Function(int received, int total)? progress,
  }) async {
    await _loadIdentity();
    final model = await _fetchModel(videoId);
    final track = model.choose(ceiling: _ceiling);
    if (track == null) {
      throw const DirectMediaException('没有可播放的清晰度档位', retryable: true);
    }
    final dir = (cacheDir ?? _cacheDir)?.path;
    if (dir == null) throw const DirectMediaException('缺少媒体缓存目录');
    final slot = Directory('${Directory(dir).path}/slot');
    // Single-slot cache: the previous episode's files are no longer needed.
    if (await slot.exists()) {
      try {
        await slot.delete(recursive: true);
      } on FileSystemException catch (_) {
        // A stale slot never blocks playback; downloads overwrite it.
      }
    }
    await slot.create(recursive: true);
    final enc = File('${slot.path}/current.enc');
    final plain = File('${slot.path}/current.mp4');
    await _download(track, enc, progress);
    var working = enc;
    final encrypted = await hasEncryptedSamples(enc);
    if (encrypted) {
      if (track.spadeKey.isEmpty) {
        await _remove([enc]);
        throw const DirectMediaException('受保护片源缺少解密凭据', retryable: true);
      }
      final key = decodeMediaKeyEnvelope(track.spadeKey);
      if (key == null) {
        await _remove([enc]);
        throw const DirectMediaException('解密凭据无法解析', retryable: true);
      }
      try {
        await transform(enc, plain, key);
      } on DirectMediaException {
        if (!keepIntermediates) await _remove([enc]);
        rethrow;
      } catch (_) {
        await _remove([enc]);
        rethrow;
      }
      working = plain;
    } else if (!await renameFile(enc, plain)) {
      throw const DirectMediaException('片源落盘失败', retryable: true);
    }
    return DirectMedia(
      file: working,
      width: track.width,
      height: track.height,
      quality: track.quality,
      decrypted: encrypted,
    );
  }

  Future<void> _loadIdentity() async {
    if (_deviceId != null && _iid != null) return;
    final load = _store;
    if (load == null) {
      _deviceId = '1${_digits(18)}';
      _iid = '1${_digits(18)}';
      return;
    }
    final prefs = await load();
    _deviceId = await prefs.read('hg.dm.device_id');
    _iid = await prefs.read('hg.dm.iid');
    if (_deviceId == null || _iid == null) {
      _deviceId = '1${_digits(18)}';
      _iid = '1${_digits(18)}';
      await prefs.write('hg.dm.device_id', _deviceId!);
      await prefs.write('hg.dm.iid', _iid!);
    }
  }

  Future<MediaModel> _fetchModel(String videoId) async {
    if (!RegExp(r'^\d{8,24}$').hasMatch(videoId)) {
      throw const DirectMediaException('剧集编号无效');
    }
    final body = jsonEncode({
      'video_id': videoId,
      'content_type': 1,
      'biz_param': {'need_all_video_definition': true, 'video_platform': 3},
    });
    Object? last;
    for (var attempt = 0; attempt < _attempts; attempt++) {
      if (attempt > 0) {
        await Future<void>.delayed(
          Duration(milliseconds: _backoffs[min(attempt - 1, _backoffs.length - 1)]),
        );
      }
      try {
        return MediaModel.parse(await _post(videoId, body));
      } on DirectMediaException catch (e) {
        if (!e.retryable) rethrow;
        last = e;
      }
    }
    throw DirectMediaException(
      last is DirectMediaException ? last.message : '媒体服务暂不可用',
      retryable: true,
    );
  }

  Future<dynamic> _post(String videoId, String body) async {
    final query = {
      'aid': '8662',
      'app_name': 'novelread',
      'version_code': '73532',
      'version_name': '7.3.5.32',
      'manifest_version_code': '73532',
      'update_version_code': '73532',
      'channel': 'update_64',
      'device_platform': 'android',
      'os': 'android',
      'ssmix': 'a',
      'device_type': '25053RT47C',
      'device_brand': 'Redmi',
      'language': 'zh',
      'os_api': '36',
      'os_version': '16',
      'resolution': '1280*2772',
      'dpi': '520',
      'ac': 'wifi',
      'device_id': _deviceId ?? '',
      'iid': _iid ?? '',
      '_rticket': '${DateTime.now().millisecondsSinceEpoch}',
    };
    final uri = Uri.https(_apiHost, '/novel/player/video_model/v1/', query);
    try {
      final response = await _client
          .post(
            uri,
            headers: {
              'User-Agent': 'com.phoenix.read/73532 (Linux; U; Android 16; '
                  'zh_CN; 25053RT47C; Build/BP2A.250605.031.A3; '
                  'Cronet/TTNetVersion:04657795 2026-01-23 '
                  'QuicVersion:c67e9834 2025-09-08)',
              'Accept': 'application/json',
              'Content-Type': 'application/json; charset=utf-8',
              'x-xs-from-web': '0',
              'sdk-version': '2',
            },
            body: body,
          )
          .timeout(const Duration(seconds: 25));
      if (response.statusCode != 200) {
        throw DirectMediaException('媒体服务返回 ${response.statusCode}');
      }
      final text = response.body;
      if (text.trim().isEmpty) {
        // Risk control soft-rejects some requests with an empty 200 body;
        // retrying a moment later usually succeeds.
        throw const DirectMediaException('媒体服务暂时没有响应', retryable: true);
      }
      if (text.length > 2 * 1024 * 1024) {
        throw const DirectMediaException('媒体服务响应过大');
      }
      final obj = jsonDecode(text);
      if (obj is! Map || obj['code'] != 0) {
        throw const DirectMediaException('媒体服务返回异常');
      }
      final data = obj['data'];
      if (data is! Map || data['video_model'] == null) {
        throw const DirectMediaException('媒体服务缺少数据');
      }
      return data['video_model'];
    } on DirectMediaException {
      rethrow;
    } on TimeoutException {
      throw const DirectMediaException('媒体服务连接超时', retryable: true);
    } catch (_) {
      throw const DirectMediaException('网络连接失败', retryable: true);
    }
  }

  Future<void> _download(
    MediaTrack track,
    File target,
    void Function(int, int)? progress,
  ) async {
    final partial = File('${target.path}.partial');
    final sink = partial.openWrite();
    var received = 0;
    try {
      final request = http.Request('GET', Uri.parse(track.url));
      request.headers['User-Agent'] = 'HongguoTV/0.1';
      final response = await _client.send(request).timeout(
            const Duration(seconds: 30),
          );
      if (response.statusCode != 200) {
        throw DirectMediaException('片源返回 ${response.statusCode}');
      }
      final total = response.contentLength ?? track.size;
      if (total > DirectMediaService.maxFileBytes) {
        throw const DirectMediaException('片源超出大小预算');
      }
      await for (final chunk in response.stream) {
        received += chunk.length;
        if (received > DirectMediaService.maxFileBytes) {
          throw const DirectMediaException('片源超出大小预算');
        }
        sink.add(chunk);
        if (progress != null) progress(received, total);
      }
      await sink.flush();
      await sink.close();
      if (received < 32) {
        await _remove([partial]);
        throw const DirectMediaException('片源下载不完整', retryable: true);
      }
      if (total > 0 && received != total) {
        await _remove([partial]);
        throw const DirectMediaException('片源下载不完整', retryable: true);
      }
      if (!await partial.exists() || !await renameFile(partial, target)) {
        await _remove([partial]);
        throw const DirectMediaException('片源落盘失败', retryable: true);
      }
    } catch (e) {
      try {
        await sink.close();
      } on StateError catch (_) {
        // Already closed on the success path.
      }
      await _remove([partial, target]);
      if (e is DirectMediaException) rethrow;
      throw const DirectMediaException('片源下载失败', retryable: true);
    }
  }

  Future<void> _remove(List<File> files) async {
    for (final f in files) {
      await _removeFile(f);
    }
  }
}

/// Minimal subset of SharedPreferences used for the stable device identity,
/// so tests can inject an in-memory store.
abstract class SharedPreferencesLike {
  Future<String?> read(String key);
  Future<void> write(String key, String value);
}

String _digits(int count) {
  final rng = Random.secure();
  return List.generate(count, (_) => rng.nextInt(10)).join();
}

/// Port of the Android MediaKey envelope decoder: unwraps the obfuscated
/// `spade_a` value into the 16-byte AES key delivered with the media model.
Uint8List? decodeMediaKeyEnvelope(String envelope) {
  if (envelope.isEmpty || envelope.length > 2048) return null;
  final Uint8List data;
  try {
    data = base64.decode(envelope);
  } on FormatException {
    return null;
  }
  for (final variant in [0, 1]) {
    final key = _unwrapEnvelope(data, variant);
    if (key != null) return key;
  }
  return null;
}

int _hexVal(int b) {
  if (b >= 0x30 && b <= 0x39) return b - 0x30;
  if (b >= 0x61 && b <= 0x66) return b - 0x57;
  return -1;
}

int _popcount(int v) {
  var count = 0;
  while (v != 0) {
    count += v & 1;
    v >>= 1;
  }
  return count;
}

Uint8List? _unwrapEnvelope(Uint8List data, int variant) {
  final length = data.length;
  if (length < 3 || length > 512) return null;
  final keyLen = (((data[0] ^ data[1]) ^ data[2]) & 0xff) - 48;
  final tail = length - keyLen;
  final split = tail - 1;
  if (keyLen < 1 || split < 1 || split + 1 > length || tail < 2) return null;
  final tag = String.fromCharCodes(
    List.generate(keyLen, (p) => data[split] ^ data[tail - 2] ^ data[tail + p]),
  );
  if ('app_v2'.startsWith(tag) || 'web_v2'.startsWith(tag)) return null;
  final payload = Uint8List.sublistView(data, 1, split + 1);
  final out = Uint8List(payload.length);
  var i9 = 85, i10 = 250;
  for (var i = 0; i < payload.length; i++) {
    final v = payload[i] & 0xff;
    int i3, i4;
    if (i & 1 != 0) {
      i3 = i10;
      i4 = v;
    } else {
      i3 = v;
      i4 = i9;
      i9 = i10;
    }
    var shift = _popcount(i) + 21;
    if (variant == 0) shift = -shift;
    out[i] = (shift + (i9 ^ v)) & 0xff;
    i9 = i4;
    i10 = i3;
  }
  if (out.isEmpty) return null;
  final first = out[0] & 0xff;
  final nib = first >= 0x30 && first <= 0x39
      ? first - 0x30
      : first >= 0x61 && first <= 0x7a
          ? first - 0x57
          : -1;
  if (nib < 0) return null;
  if ((out.length - nib) - 1 != 32) return null;
  final key = Uint8List(16);
  for (var p = 0; p < 16; p++) {
    final hi = _hexVal(out[p * 2 + 1]);
    final lo = _hexVal(out[p * 2 + 2]);
    if (hi < 0 || lo < 0) return null;
    key[p] = ((hi << 4) | lo) & 0xff;
  }
  return key;
}

class _Box {
  _Box(this.start, this.data, this.end, this.type);
  final int start, data, end;
  final String type;
}

class _Reader {
  _Reader(this.file);
  final RandomAccessFile file;
  int position = 0;

  Future<void> seek(int p) async {
    await file.setPosition(p);
    position = p;
  }

  Future<int> u32() async {
    final b = await _take(4);
    return (b[0] << 24) | (b[1] << 16) | (b[2] << 8) | b[3];
  }

  Future<int> u64() async {
    final b = await _take(8);
    var v = 0;
    for (final x in b) {
      v = (v << 8) | x;
    }
    return v;
  }

  Future<String> four() async {
    final b = await _take(4);
    return String.fromCharCodes(b);
  }

  Future<Uint8List> _take(int n) async {
    final b = await file.read(n);
    if (b.length != n) throw const DirectMediaException('媒体元数据被截断');
    position += n;
    return Uint8List.fromList(b);
  }
}

Future<List<_Box>> _boxes(_Reader r, int start, int end) async {
  final result = <_Box>[];
  var p = start;
  while (p < end) {
    if (end - p < 8 || result.length > 20000) {
      throw const DirectMediaException('媒体元数据异常');
    }
    await r.seek(p);
    var size = await r.u32();
    final type = await r.four();
    var header = 8;
    if (size == 1) {
      size = await r.u64();
      header = 16;
    } else if (size == 0) {
      size = end - p;
    }
    if (size < header || size > end - p) {
      throw const DirectMediaException('媒体元数据异常');
    }
    result.add(_Box(p, p + header, p + size, type));
    p += size;
  }
  return result;
}

Future<_Box> _one(List<_Box> boxes, String type) async {
  _Box? found;
  for (final b in boxes) {
    if (b.type == type) {
      if (found != null) throw const DirectMediaException('媒体元数据重复');
      found = b;
    }
  }
  if (found == null) throw DirectMediaException('缺少 MP4 盒子 $type');
  return found;
}

_Box? _optional(List<_Box> boxes, String type) {
  for (final b in boxes) {
    if (b.type == type) return b;
  }
  return null;
}

Future<bool> hasEncryptedSamples(File file) async {
  final r = _Reader(await file.open());
  try {
    final moov = await _one(await _boxes(r, 0, await file.length()), 'moov');
    for (final trak in await _boxes(r, moov.data, moov.end)) {
      if (trak.type != 'trak') continue;
      final mdia = await _one(await _boxes(r, trak.data, trak.end), 'mdia');
      final minf = await _one(await _boxes(r, mdia.data, mdia.end), 'minf');
      final stbl = await _one(await _boxes(r, minf.data, minf.end), 'stbl');
      final stsd = await _one(await _boxes(r, stbl.data, stbl.end), 'stsd');
      for (final entry in await _boxes(r, stsd.data + 8, stsd.end)) {
        if (entry.type == 'encv' || entry.type == 'enca') return true;
      }
    }
    return false;
  } finally {
    await r.file.close();
  }
}

/// Decrypts CENC-protected samples in place on a copy of [source], patching
/// the container so plain decoders (AVPlayer) accept it. Port of the Android
/// Mp4SampleTransform.
Future<void> transform(File source, File target, Uint8List key) async {
  if (key.length != 16) throw ArgumentError.value(key, 'key');
  final partial = File('${target.path}.partial');
  if (await target.exists() || await partial.exists()) {
    throw const DirectMediaException('输出文件已存在');
  }
  try {
    final src = await source.open();
    final dst = await partial.open(mode: FileMode.write);
    try {
      final length = await source.length();
      if (length < 32 || length > DirectMediaService.maxFileBytes) {
        throw const DirectMediaException('媒体文件超出预算');
      }
      await src.setPosition(0);
      var copied = 0;
      final buffer = Uint8List(64 * 1024);
      while (copied < length) {
        final n = await src.readInto(buffer, 0, min(buffer.length, length - copied));
        if (n <= 0) throw const DirectMediaException('媒体文件被截断');
        await dst.writeFrom(buffer, 0, n);
        copied += n;
      }
      final stats = _Stats();
      final r = _Reader(dst);
      final top = await _boxes(r, 0, length);
      if (_optional(top, 'moof') != null) {
        throw const DirectMediaException('暂不支持分片媒体');
      }
      final moov = await _one(top, 'moov');
      if (moov.end - moov.start > 4 * 1024 * 1024) {
        throw const DirectMediaException('媒体元数据超出预算');
      }
      final mdats = top.where((b) => b.type == 'mdat').toList();
      if (mdats.isEmpty) throw const DirectMediaException('缺少媒体数据');
      var tracks = 0;
      for (final trak in await _boxes(r, moov.data, moov.end)) {
        if (trak.type != 'trak') continue;
        if (++tracks > 4) throw const DirectMediaException('媒体轨道过多');
        await _processTrack(r, dst, trak, mdats, key, stats);
      }
      if (stats.videoSamples == 0) {
        throw const DirectMediaException('没有可解密的媒体样本');
      }
      await dst.flush();
    } finally {
      await src.close();
      await dst.close();
    }
    if (!await renameFile(partial, target)) {
      await _removeFile(partial);
      throw const DirectMediaException('解密结果落盘失败');
    }
  } on DirectMediaException {
    await _removeFile(partial);
    rethrow;
  } catch (_) {
    await _removeFile(partial);
    throw const DirectMediaException('解密失败');
  }
}

class _Stats {
  int videoSamples = 0, audioSamples = 0;
}

Future<bool> renameFile(File from, File to) async {
  try {
    await from.rename(to.path);
    return true;
  } on FileSystemException {
    return false;
  }
}

Future<void> _removeFile(File f) async {
  if (await f.exists()) {
    try {
      await f.delete();
      // Best effort: leftover cache files are cleaned on the next slot use.
    } on FileSystemException catch (_) {}
  }
}

Future<void> _patchType(RandomAccessFile file, _Box box, String type) async {
  await file.setPosition(box.start + 4);
  await file.writeFrom(ascii.encode(type));
}

Future<void> _processTrack(
  _Reader r,
  RandomAccessFile dst,
  _Box trak,
  List<_Box> mdats,
  Uint8List key,
  _Stats stats,
) async {
  final mdia = await _one(await _boxes(r, trak.data, trak.end), 'mdia');
  final hdlr = await _one(await _boxes(r, mdia.data, mdia.end), 'hdlr');
  if (hdlr.end - hdlr.data < 12) throw const DirectMediaException('媒体处理器异常');
  await r.seek(hdlr.data + 8);
  final handler = await r.four();
  if (handler != 'vide' && handler != 'soun') return;
  final minf = await _one(await _boxes(r, mdia.data, mdia.end), 'minf');
  final stbl = await _one(await _boxes(r, minf.data, minf.end), 'stbl');
  final boxes = await _boxes(r, stbl.data, stbl.end);
  final stsd = await _one(boxes, 'stsd');
  await r.seek(stsd.data + 4);
  if (await r.u32() != 1) throw const DirectMediaException('不支持多描述媒体');
  final entries = await _boxes(r, stsd.data + 8, stsd.end);
  if (entries.length != 1) throw const DirectMediaException('媒体描述异常');
  final entry = entries.single;
  if (entry.type != 'encv' && entry.type != 'enca') return;
  final skip = handler == 'vide' ? 78 : 28;
  if (handler == 'soun') {
    await r.seek(entry.data + 8);
    final version = await r._take(2);
    if (version[0] != 0 || version[1] != 0) {
      throw const DirectMediaException('不支持音频描述版本');
    }
  }
  final inner = await _boxes(r, entry.data + skip, entry.end);
  final sinf = await _one(inner, 'sinf');
  final frma = await _one(await _boxes(r, sinf.data, sinf.end), 'frma');
  await r.seek(frma.data);
  final original = await r.four();
  if (!['avc1', 'hvc1', 'hev1', 'mp4a'].contains(original)) {
    throw const DirectMediaException('不支持的原始编码');
  }
  var lengthSize = 0;
  if (handler == 'vide') {
    final config = await _one(inner, original == 'avc1' ? 'avcC' : 'hvcC');
    await r.seek(config.data + (original == 'avc1' ? 4 : 21));
    final flag = await r._take(1);
    lengthSize = (flag[0] & 3) + 1;
  }
  final senc = await _one(boxes, 'senc');
  await r.seek(senc.data);
  if (await r.u32() != 0) throw const DirectMediaException('不支持的样本加密布局');
  final count = await r.u32();
  if (count < 1 || senc.end - r.position != 8 * count) {
    throw const DirectMediaException('不支持的 IV 表');
  }
  final baseIv = await r.u64();
  for (var i = 1; i < count; i++) {
    if (await r.u64() != baseIv + i) {
      throw const DirectMediaException('样本 IV 不连续');
    }
  }
  final stsz = await _one(boxes, 'stsz');
  await r.seek(stsz.data + 4);
  final fixed = await r.u32();
  final sampleCount = await r.u32();
  if (sampleCount < 1 || sampleCount > 100000 || sampleCount != count ||
      fixed > (1 << 24)) {
    throw const DirectMediaException('样本数量或大小异常');
  }
  final sizes = List<int>.filled(sampleCount, 0);
  for (var i = 0; i < sampleCount; i++) {
    final s = fixed == 0 ? await r.u32() : fixed;
    if (s < 1 || s > (1 << 24)) throw const DirectMediaException('样本大小异常');
    sizes[i] = s;
  }
  final co64 = _optional(boxes, 'co64');
  final stco = co64 ?? await _one(boxes, 'stco');
  await r.seek(stco.data + 4);
  final chunkCount = await _tableCount(r, stco, 4, 100000, co64 != null ? 8 : 4);
  final chunks = List<int>.filled(chunkCount, 0);
  for (var i = 0; i < chunkCount; i++) {
    chunks[i] = co64 != null ? await r.u64() : await r.u32();
  }
  final stsc = await _one(boxes, 'stsc');
  await r.seek(stsc.data + 4);
  final mapCount = await _tableCount(r, stsc, 4, 10000, 12);
  final mapFirst = List<int>.filled(mapCount, 0);
  final mapPer = List<int>.filled(mapCount, 0);
  for (var i = 0; i < mapCount; i++) {
    final first = await r.u32();
    final per = await r.u32();
    final desc = await r.u32();
    if (first < 1 || first > chunkCount || per < 1 || per > sampleCount ||
        desc != 1 ||
        (i == 0 ? first != 1 : first <= mapFirst[i - 1])) {
      throw const DirectMediaException('块映射异常');
    }
    mapFirst[i] = first;
    mapPer[i] = per;
  }
  final cipher = _CtrBlock(key);
  var sample = 0;
  for (var m = 0; m < mapCount && sample < sampleCount; m++) {
    final lastChunk = m + 1 < mapCount ? mapFirst[m + 1] - 1 : chunkCount;
    for (var c = mapFirst[m]; c <= lastChunk && sample < sampleCount; c++) {
      var offset = chunks[c - 1];
      for (var k = 0; k < mapPer[m] && sample < sampleCount; k++) {
        final size = sizes[sample];
        var inside = false;
        for (final mdat in mdats) {
          if (offset >= mdat.data && offset <= mdat.end - size) {
            inside = true;
            break;
          }
        }
        if (!inside) throw const DirectMediaException('样本超出媒体数据范围');
        final counter = Uint8List(16);
        var v = baseIv + sample;
        for (var p = 15; p >= 8; p--) {
          counter[p] = v & 0xff;
          v >>= 8;
        }
        await _decryptRange(dst, cipher, counter, offset, size);
        if (lengthSize > 0 && handler == 'vide') {
          await _validateNalu(dst, offset, size, lengthSize);
        }
        offset += size;
        sample++;
      }
    }
  }
  if (sample != sampleCount) throw const DirectMediaException('样本映射不完整');
  if (handler == 'vide') {
    stats.videoSamples += sample;
  } else {
    stats.audioSamples += sample;
  }
  await _patchType(dst, entry, original);
  await _patchType(dst, sinf, 'free');
  for (final b in boxes) {
    if (b.type == 'senc' || b.type == 'saiz' || b.type == 'saio') {
      await _patchType(dst, b, 'free');
    }
  }
}

Future<int> _tableCount(
  _Reader r,
  _Box box,
  int skip,
  int max,
  int width,
) async {
  final count = await r.u32();
  if (count < 1 || count > max || box.data + skip + 4 + width * count > box.end) {
    throw const DirectMediaException('媒体表越界');
  }
  return count;
}

Future<void> _decryptRange(
  RandomAccessFile file,
  _CtrBlock cipher,
  Uint8List counter,
  int offset,
  int size,
) async {
  const budget = 64 * 1024;
  final data = Uint8List(budget);
  await file.setPosition(offset);
  var done = 0;
  cipher.reset(counter);
  while (done < size) {
    final n = await file.readInto(data, 0, min(budget, size - done));
    if (n <= 0) throw const DirectMediaException('样本读取被截断');
    cipher.xor(data, n);
    await file.setPosition(offset + done);
    await file.writeFrom(data, 0, n);
    done += n;
  }
}

Future<void> _validateNalu(
  RandomAccessFile file,
  int offset,
  int size,
  int lengthSize,
) async {
  final end = offset + size;
  var p = offset;
  final buf = Uint8List(lengthSize);
  while (p < end) {
    await file.setPosition(p);
    final n = await file.readInto(buf, 0, lengthSize);
    if (n != lengthSize) throw const DirectMediaException('样本帧异常');
    var length = 0;
    for (final b in buf) {
      length = (length << 8) | b;
    }
    if (length < 1 || p + lengthSize + length > end) {
      throw const DirectMediaException('样本帧边界异常');
    }
    p += lengthSize + length;
  }
  if (p != end) throw const DirectMediaException('样本帧边界异常');
}

/// AES-128 CTR with a full-width big-endian counter block, matching the JVM's
/// AES/CTR/NoPadding semantics used by the native client.
class _CtrBlock {
  _CtrBlock(List<int> key) : _engine = ECBBlockCipher(AESEngine()) {
    _engine.init(true, KeyParameter(Uint8List.fromList(key)));
  }
  final ECBBlockCipher _engine;
  late Uint8List _counter;
  final Uint8List _keystream = Uint8List(16);
  int _used = 16;

  void reset(Uint8List counter) {
    _counter = Uint8List.fromList(counter);
    _used = 16;
  }

  void _nextKeystream() {
    _engine.processBlock(_counter, 0, _keystream, 0);
    var carry = 1;
    for (var p = 15; p >= 0; p--) {
      carry += _counter[p];
      _counter[p] = carry & 0xff;
      carry >>= 8;
    }
    _used = 0;
  }

  void xor(Uint8List data, int length) {
    for (var i = 0; i < length; i++) {
      if (_used == 16) _nextKeystream();
      data[i] ^= _keystream[_used++];
    }
  }
}
