import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:flutter_test/flutter_test.dart';
import 'package:hongguo_client/data/direct_media.dart';

void main() {
  group('media key envelope', () {
    // Real envelope captured from a video_model response (kid
    // 6ac93aa7f8818b021ebce36a0002ebeb, cenc-aes-ctr).
    const envelope = 'rLwi9lq6EfZBjg/JRpkW0EaaCNZGmDvUdZkO5HKePeVGqA6Xlw==';
    test('decodes a real spade_a envelope to a 16-byte key', () {
      final key = decodeMediaKeyEnvelope(envelope);
      expect(key, isNotNull);
      expect(key!.length, 16);
      expect(key, _hexBytes('a4a6458b701981747567e456cecb6ba7'));
    });
    test('rejects junk envelopes', () {
      expect(decodeMediaKeyEnvelope(''), isNull);
      expect(decodeMediaKeyEnvelope('!!!not-base64!!!'), isNull);
      expect(decodeMediaKeyEnvelope(base64.encode([1, 2, 3])), isNull);
    });
  });

  group('media model parsing', () {
    final track = {
      'main_url': 'https://cdn.example.com/video/360p.mp4',
      'codec_type': 'bytevc1',
      'size': 1024,
      'gear_des_key': '0:MP4|1:encrypt|2:h265_hvc1|4:360p|5:normal',
      'vwidth': 1920,
      'vheight': 1080,
      'encrypt_info': {
        'encrypt': true,
        'kid': '6ac93aa7f8818b021ebce36a0002ebeb',
        'spade_a': 'rLwi9lq6EfZBjg/JRpkW0EaaCNZGmDvUdZkO5HKePeVGqA6Xlw==',
        'encryption_method': 'cenc-aes-ctr',
      },
    };
    test('parses object-shaped video_list and nested video_meta', () {
      final model = MediaModel.parse({
        'video_list': {
          'a': {
            ...track,
            'video_meta': {'vwidth': 1280, 'vheight': 720, 'size': 2048},
          },
        },
      });
      expect(model.tracks, hasLength(1));
      expect(model.tracks.first.width, 1280);
      expect(model.tracks.first.height, 720);
      expect(model.tracks.first.size, 2048);
      expect(model.tracks.first.spadeKey, isNotEmpty);
    });
    test('parses base64-wrapped string video_model', () {
      final payload = jsonEncode({
        'video_list': [track],
      });
      final model = MediaModel.parse(base64.encode(utf8.encode(payload)));
      expect(model.tracks, hasLength(1));
      expect(model.tracks.first.quality, 360);
    });
    test('drops tracks without https urls or sizes', () {
      final model = MediaModel.parse({
        'video_list': [
          {...track, 'main_url': 'http://insecure/x.mp4'},
          {...track, 'size': 0},
          track,
        ],
      });
      expect(model.tracks, hasLength(1));
    });
    test('choose prefers avc and respects the ceiling', () {
      MediaTrack mk(int w, int h, String codec, int size) => MediaTrack(
            url: 'https://cdn.example.com/track$w-$h-$codec.mp4',
            width: w,
            height: h,
            size: size,
            codec: codec,
            quality: h,
          );
      final model = MediaModel([
        mk(1920, 1080, 'bytevc1', 900),
        mk(1920, 1080, 'h264', 1000),
        mk(3840, 2160, 'h264', 10),
        mk(640, 360, 'h264', 100),
      ]);
      expect(model.choose(ceiling: 1080)!.codec, 'h264');
      expect(model.choose(ceiling: 720)!.quality, 360);
      final tiny = MediaModel([mk(640, 360, 'bytevc1', 100)]);
      expect(tiny.choose(ceiling: 1080), isNotNull);
      expect(MediaModel([]).choose(), isNull);
    });
  });

  group('mp4 CENC transform', () {
    // Independent AES-128-CTR keystreams for key
    // 2b7e151628aed2a6abf7158809cf4f3c (openssl, NIST SP 800-38A F.5.1 key
    // vector). The initial counter block places baseIv<<64 in the high half;
    // following blocks increment the full 128-bit integer (JVM AES/CTR).
    final keystreamSample0 = _hexBytes(
      '7df76b0c1ab899b33e42f047b91b546f'
      '57127d4034b1bebfaef466b9c7726fc6'
      '973f2ef34879e2027f1734303ff21f89',
    );
    final keystreamSample1 = _hexBytes(
      'dc0a3bc38609c26f6f2a63a39cf7ee93'
      'c5eb9614bd235873ff3771254315047c'
      'a419361ef995e1af798b107a35090358',
    );
    final key = _hexBytes('2b7e151628aed2a6abf7158809cf4f3c');
    // Two NALU-framed units per sample: [len=16][payload], twice = 40 bytes.
    final plainSample = Uint8List(40);
    plainSample[3] = 16;
    plainSample[4] = 0x67;
    plainSample[23] = 16;
    plainSample[24] = 0x68;

    Uint8List encrypt(Uint8List plain, Uint8List keystream) {
      final out = Uint8List(plain.length);
      for (var i = 0; i < plain.length; i++) {
        out[i] = plain[i] ^ keystream[i];
      }
      return out;
    }

    test('decrypts a synthetic encrypted track into plain samples', () async {
      final cipher = <int>[...encrypt(plainSample, keystreamSample0), ...encrypt(plainSample, keystreamSample1)];
      final mp4 = _EncryptedMp4Builder(cipher: Uint8List.fromList(cipher)).build();
      final dir = await Directory.systemTemp.createTemp('hgtransform');
      final enc = File('${dir.path}/a.enc')..writeAsBytesSync(mp4);
      final out = File('${dir.path}/a.mp4');
      expect(await hasEncryptedSamples(enc), isTrue);
      await transform(enc, out, key);
      expect(await hasEncryptedSamples(out), isFalse);
      final bytes = out.readAsBytesSync();
      var found = -1;
      for (var i = 0; i + plainSample.length <= bytes.length; i++) {
        var match = true;
        for (var n = 0; n < plainSample.length; n++) {
          if (bytes[i + n] != plainSample[n]) {
            match = false;
            break;
          }
        }
        if (match) {
          found = i;
          break;
        }
      }
      expect(found, greaterThan(0), reason: 'decrypted samples must appear');
      await dir.delete(recursive: true);
    });

    test('rejects wrong keys and leaves no output behind', () async {
      final mp4 = _EncryptedMp4Builder(cipher: encrypt(plainSample, keystreamSample0)).build();
      final dir = await Directory.systemTemp.createTemp('hgtransform');
      final enc = File('${dir.path}/b.enc')..writeAsBytesSync(mp4);
      final out = File('${dir.path}/b.mp4');
      await expectLater(transform(enc, out, Uint8List(16)), throwsException);
      expect(out.existsSync(), isFalse);
      await dir.delete(recursive: true);
    });

    test('plain containers report no encrypted samples', () async {
      final mp4 = _EncryptedMp4Builder(
        cipher: plainSample,
        encrypted: false,
      ).build();
      final dir = await Directory.systemTemp.createTemp('hgtransform');
      final plain = File('${dir.path}/c.mp4')..writeAsBytesSync(mp4);
      expect(await hasEncryptedSamples(plain), isFalse);
      await dir.delete(recursive: true);
    });
  });
}

Uint8List _hexBytes(String hex) {
  final out = Uint8List(hex.length ~/ 2);
  for (var i = 0; i < out.length; i++) {
    out[i] = int.parse(hex.substring(i * 2, i * 2 + 2), radix: 16);
  }
  return out;
}

/// Minimal progressive MP4 with one video track. When [encrypted] the sample
/// entry is encv+sinf+frma and a senc box carries the IV table; otherwise a
/// plain avc1 entry.
class _EncryptedMp4Builder {
  _EncryptedMp4Builder({required this.cipher, this.encrypted = true});
  final Uint8List cipher;
  final bool encrypted;

  List<int> build() {
    // [cipher] holds [sampleCount] consecutive encrypted samples.
    final sampleSize = cipher.length ~/ 2;
    final sampleCount = 2;

    List<int> entry;
    List<int> senc;
    if (encrypted) {
      final avcC = [
        ..._box('avcC', [1, 66, 0, 30, 0xff, 0xe0, 0, 0, 0, 0]),
      ];
      final sinf = _box(
        'sinf',
        _box('frma', _ascii('avc1')) +
            _box('schm', [..._u32(0), ..._u32(0), ..._u32(0)]),
      );
      entry = _box(
        'encv',
        [
          ..._pad(6),
          ..._u16(1),
          ..._pad(16),
          ..._u16(0),
          ..._u16(0),
          ..._u32(0),
          ..._u32(0),
          ..._pad(4),
          ..._u16(1),
          ..._pad(32),
          ..._u16(0x18),
          ..._u16(0xffff),
        ] +
            avcC +
            sinf,
      );
      senc = _box('senc', [
        ..._u32(0),
        ..._u32(sampleCount),
        ..._u64(0),
        ..._u64(1),
      ]);
    } else {
      entry = _box(
        'avc1',
        [
          ..._pad(6),
          ..._u16(1),
          ..._pad(16),
          ..._u16(0),
          ..._u16(0),
          ..._u32(0),
          ..._u32(0),
          ..._pad(4),
          ..._u16(1),
          ..._pad(32),
          ..._u16(0x18),
          ..._u16(0xffff),
        ] +
            _box('avcC', [1, 66, 0, 30, 0xff, 0xe0, 0, 0, 0, 0]),
      );
      senc = const [];
    }
    final stsd = _box('stsd', [..._u32(0), ..._u32(1), ...entry]);
    final stsz = _box('stsz',
        [..._u32(0), ..._u32(encrypted ? sampleSize : 0), ..._u32(sampleCount)]);
    final stsc = _box('stsc',
        [..._u32(0), ..._u32(1), ..._u32(1), ..._u32(sampleCount), ..._u32(1)]);
    final hdlr = _box('hdlr',
        [..._u32(0), ..._u32(0), ..._ascii('vide'), ..._pad(12), ..._u32(0)]);

    // Compute the chunk offset: ftyp + moov + mdat header. Sizes of the
    // enclosing boxes do not depend on the chunk offset value width, so a
    // first pass with a placeholder yields the correct positions.
    var stco = _box('stco', [..._u32(0), ..._u32(1), ..._u32(0)]);
    var stbl = _box('stbl', [...stsd, ...senc, ...stsz, ...stsc, ...stco]);
    var minf = _box('minf', stbl);
    var mdia = _box('mdia', [...hdlr, ...minf]);
    var trak = _box('trak', mdia);
    var moov = _box('moov', trak);
    var chunkOffset =
        _box('ftyp', _ascii('isomisom')).length + moov.length + 8;
    stco = _box('stco', [..._u32(0), ..._u32(1), ..._u32(chunkOffset)]);
    stbl = _box('stbl', [...stsd, ...senc, ...stsz, ...stsc, ...stco]);
    minf = _box('minf', stbl);
    mdia = _box('mdia', [...hdlr, ...minf]);
    trak = _box('trak', mdia);
    moov = _box('moov', trak);

    final payload = <int>[...cipher];
    final mdat = [..._u32(8 + payload.length), ..._ascii('mdat')];
    final head = [
      ..._box('ftyp', _ascii('isomisom')),
      ...moov,
      ...mdat,
    ];
    return Uint8List.fromList([...head, ...payload]);
  }

  static List<int> _box(String type, List<int> body) => [
        ..._u32(8 + body.length),
        ..._ascii(type),
        ...body,
      ];
  static List<int> _pad(int n) => List.filled(n, 0);
  static List<int> _ascii(String s) => s.codeUnits;
  static List<int> _u16(int v) => [(v >> 8) & 0xff, v & 0xff];
  static List<int> _u32(int v) =>
      [(v >> 24) & 0xff, (v >> 16) & 0xff, (v >> 8) & 0xff, v & 0xff];
  static List<int> _u64(int v) => [..._u32(0), ..._u32(v)];
}
