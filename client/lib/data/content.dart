import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

class ContentException implements Exception {
  const ContentException(this.message);
  final String message;
  @override
  String toString() => message;
}

class Series {
  const Series({
    required this.id,
    required this.title,
    required this.cover,
    required this.count,
    this.intro = '',
    this.tags = const [],
    this.mode = 'short',
  });
  factory Series.fromJson(Map<String, dynamic> json) => Series(
    id: '${json['id'] ?? ''}',
    title: '${json['title'] ?? ''}',
    cover: '${json['cover'] ?? ''}',
    count: int.tryParse('${json['count']}') ?? 0,
    intro: '${json['intro'] ?? ''}',
    mode: '${json['mode'] ?? 'short'}',
    tags: (json['tags'] is List ? json['tags'] as List : const [])
        .whereType<String>()
        .toList(),
  );
  Map<String, dynamic> toJson() => {
    'id': id,
    'title': title,
    'cover': cover,
    'count': count,
    'intro': intro,
    'tags': tags,
    'mode': mode,
  };
  final String id, title, cover, intro, mode;
  final int count;
  final List<String> tags;
}

class Episode {
  const Episode({
    required this.number,
    required this.id,
    required this.available,
  });
  final int number;
  final String id;
  final bool available;
}

class Detail {
  const Detail({required this.series, required this.episodes});
  final Series series;
  final List<Episode> episodes;
}

/// Reads only the public website. Restricted episodes remain visible but locked.
class ContentService {
  ContentService({http.Client? client}) : _client = client ?? http.Client();
  final http.Client _client;
  static const maxBytes = 4 * 1024 * 1024;
  static const timeout = Duration(seconds: 25);
  static final _id = RegExp(r'^\d{8,24}$');
  static String normalizeMode(String mode) => switch (mode) {
    'manju' || 'comic' || 'comic-drama' => 'manju',
    'ai' || 'ai-drama' => 'ai',
    _ => 'short',
  };
  static String category(String mode) => switch (normalizeMode(mode)) {
    'manju' => 'comic-drama',
    'ai' => 'ai-drama',
    _ => 'real-drama',
  };
  void close() => _client.close();

  Future<String> _get(Uri uri) async {
    if (uri.scheme != 'https' || uri.host != 'hongguoduanju.com') {
      throw const ContentException('内容地址不受支持');
    }
    try {
      return await (() async {
        final request = http.Request('GET', uri)..followRedirects = false;
        request.headers['User-Agent'] = 'HongguoFamily/0.9.0';
        final response = await _client.send(request);
        if (response.statusCode != 200) {
          throw ContentException('内容服务暂不可用（${response.statusCode}）');
        }
        if ((response.contentLength ?? 0) > maxBytes) {
          throw const ContentException('内容响应过大');
        }
        final bytes = <int>[];
        await for (final chunk in response.stream) {
          if (bytes.length + chunk.length > maxBytes) {
            throw const ContentException('内容响应过大');
          }
          bytes.addAll(chunk);
        }
        return utf8.decode(bytes);
      })().timeout(timeout);
    } on TimeoutException {
      throw const ContentException('连接超时，请稍后重试');
    } on ContentException {
      rethrow;
    } catch (_) {
      throw const ContentException('网络连接失败，请稍后重试');
    }
  }

  static const realGenres = {
    '爱情': 'romance',
    '年代': 'period',
    '逆袭': 'comeback',
    '传奇': 'legend',
    '成长': 'growth',
    '家庭': 'family',
    '家族': 'clan',
    '萌宝': 'cute-kids',
    '悬疑': 'suspense',
    '惊悚': 'thriller',
    '恐怖': 'horror',
    '志怪': 'supernatural',
    '古装': 'costume',
    '玄幻': 'fantasy',
    '奇幻': 'wonder',
    '都市': 'urban',
    '青春': 'youth',
    '喜剧': 'comedy',
    '科幻': 'sci-fi',
    '灾难': 'disaster',
    '动作冒险': 'action-adventure',
    '战争': 'war',
    '综艺': 'variety',
    '剧情': 'drama',
  };
  static const animationGenres = {
    '脑洞': 'creative',
    '玄幻': 'fantasy',
    '剧情': 'drama',
    '末世': 'apocalypse',
    '豪门': 'wealthy-family',
    '奇幻': 'wonder',
    '科幻': 'sci-fi',
    '冒险': 'adventure',
  };
  static String categoryPath(String mode, String genre) {
    final base = '/category/${category(mode)}';
    if (genre.isEmpty || genre == '全部' || genre == '推荐') return base;
    final genres = normalizeMode(mode) == 'short'
        ? realGenres
        : animationGenres;
    final path = genres[genre];
    if (path == null) throw const ContentException('不支持的剧场分类');
    return '$base/$path';
  }

  Future<List<Series>> browse(String mode, [String genre = '全部']) async =>
      parseBrowse(
        await _get(Uri.https('hongguoduanju.com', categoryPath(mode, genre))),
        mode,
      );

  Future<List<Series>> search(String query, [String mode = 'short']) async {
    final q = query.trim();
    if (q.isEmpty) return browse(mode);
    if (q.length > 100) throw const ContentException('搜索词请控制在100字以内');
    // Public search does not expose a stable AI genre identifier.
    if (normalizeMode(mode) == 'ai') {
      return (await browse(mode))
          .where(
            (s) =>
                s.title.contains(q) ||
                s.intro.contains(q) ||
                s.tags.any((t) => t.contains(q)),
          )
          .toList();
    }
    Future<List<Series>> fetch(String term) async => parseSearch(
      await _get(
        Uri(
          scheme: 'https',
          host: 'hongguoduanju.com',
          pathSegments: ['search', term],
        ),
      ),
      mode,
    );
    final rows = await fetch(q);
    if (rows.isNotEmpty) return rows;
    // The public index can omit Arabic year shorthand. Retry its Chinese
    // spelling only when the original query has no supported video results.
    const digits = '零一二三四五六七八九';
    final alternate = q.replaceAllMapped(
      RegExp(r'[0-9]'),
      (match) => digits[int.parse(match[0]!)],
    );
    return alternate == q ? rows : fetch(alternate);
  }

  Future<Detail> detail(Series series) async {
    _validateId(series.id);
    return parseDetail(
      await _get(
        Uri.https('hongguoduanju.com', '/detail', {'series_id': series.id}),
      ),
      series.mode,
    );
  }

  Future<Uri> mediaURL(String seriesId, Episode episode) async {
    _validateId(seriesId);
    _validateId(episode.id);
    if (!episode.available) throw const ContentException('本集未开放公开播放，请前往官方平台观看');
    final html = await _get(
      Uri.https('hongguoduanju.com', '/player/$seriesId/${episode.id}'),
    );
    final page = _page(routerData(html), 'publicVideoSeo');
    final seo = page['publicVideoSeo'];
    if (seo is! Map ||
        seo['available'] != true ||
        seo['seriesId']?.toString() != seriesId ||
        seo['itemId']?.toString() != episode.id) {
      throw const ContentException('本集未开放公开播放，请前往官方平台观看');
    }
    final advertised = <int, Uri>{};
    // Use only source-advertised public URLs, never invent an HD path or
    // treat native encrypted tracks as clear MP4s.
    final pattern = RegExp(
      r'''["'\s](?:https://hongguoduanju\.com)?(/video/public/(\d{8,24})/(\d{3,4})p\.mp4)(?=["'\s<>\\]|$)''',
    );
    for (final match in pattern.allMatches(html.replaceAll(r'\/', '/'))) {
      if (match.group(2) != episode.id) continue;
      final quality = int.parse(match.group(3)!);
      if (quality < 144 || quality > 4320) continue;
      advertised[quality] = Uri.https('hongguoduanju.com', match.group(1)!);
    }
    if (advertised.isEmpty) {
      throw const ContentException('来源未提供可直接播放的视频地址');
    }
    final qualities = advertised.keys.toList()..sort((a, b) => b.compareTo(a));
    for (final quality in qualities.take(qualities.length - 1)) {
      final candidate = advertised[quality]!;
      if (await _publicVideoResponds(candidate)) return candidate;
    }
    return advertised[qualities.last]!;
  }

  Future<bool> _publicVideoResponds(Uri uri) async {
    try {
      return await (() async {
        final request = http.Request('GET', uri)..followRedirects = false;
        request.headers['Range'] = 'bytes=0-1023';
        request.headers['User-Agent'] = 'HongguoFamily/0.9.0';
        final response = await _client.send(request);
        final valid =
            (response.statusCode == 200 || response.statusCode == 206) &&
            (response.headers['content-type'] ?? '').split(';').first.trim() ==
                'video/mp4';
        if (!valid) {
          await response.stream.listen((_) {}).cancel();
          return false;
        }
        final bytes = <int>[];
        await for (final chunk in response.stream) {
          bytes.addAll(chunk.take(1024 - bytes.length));
          if (bytes.length >= 32) break;
        }
        return String.fromCharCodes(bytes).contains('ftyp');
      })().timeout(const Duration(seconds: 6));
    } catch (_) {
      return false;
    }
  }

  static void _validateId(String id) {
    if (!_id.hasMatch(id)) throw const ContentException('剧集编号无效');
  }

  /// Extract balanced JSON, respecting quoted strings and escaped braces.
  static Map<String, dynamic> routerData(String html) {
    final marker = RegExp(r'(?:window\.)?_ROUTER_DATA\s*=\s*').firstMatch(html);
    if (marker == null) throw const ContentException('内容格式已变化，请更新应用');
    final start = marker.end;
    var depth = 0, quoted = false, escaped = false;
    for (var i = start; i < html.length; i++) {
      final c = html[i];
      if (quoted) {
        if (escaped) {
          escaped = false;
        } else if (c == r'\') {
          escaped = true;
        } else if (c == '"') {
          quoted = false;
        }
      } else if (c == '"') {
        quoted = true;
      } else if (c == '{' || c == '[') {
        depth++;
      } else if (c == '}' || c == ']') {
        depth--;
        if (depth == 0) {
          try {
            final value = jsonDecode(html.substring(start, i + 1));
            if (value is Map<String, dynamic>) return value;
          } catch (_) {
            break;
          }
        }
      }
    }
    throw const ContentException('内容数据不完整，请稍后重试');
  }

  static Map<String, dynamic> _page(Map<String, dynamic> root, String key) {
    final loaders = root['loaderData'];
    if (loaders is Map) {
      for (final value in loaders.values) {
        if (value is Map<String, dynamic> && value.containsKey(key)) {
          if (value['isSuccess'] == false) {
            throw const ContentException('内容服务暂不可用');
          }
          return value;
        }
      }
    }
    throw const ContentException('内容格式已变化，请更新应用');
  }

  static Series? _series(dynamic raw, String mode, {bool search = false}) {
    if (raw is! Map) return null;
    final id = '${raw['series_id'] ?? ''}';
    final title = '${raw[search ? 'series_title' : 'series_name'] ?? ''}';
    if (!_id.hasMatch(id) || title.isEmpty) return null;
    final cover = Uri.tryParse('${raw['series_cover'] ?? ''}');
    final safeCover = cover?.scheme == 'https' ? cover.toString() : '';
    final count = int.tryParse('${raw['episode_cnt']}') ?? 0;
    return Series(
      id: id,
      title: title,
      cover: safeCover,
      count: count,
      intro: '${raw['series_intro'] ?? ''}',
      mode: normalizeMode(mode),
      tags: (raw['tags'] is List ? raw['tags'] as List : const [])
          .whereType<String>()
          .toList(),
    );
  }

  static List<Series> parseBrowse(String html, [String mode = 'short']) {
    final rows = _page(routerData(html), 'recommendList')['recommendList'];
    if (rows is! List) throw const ContentException('剧场数据不完整');
    return _unique(rows.map((r) => _series(r, mode)));
  }

  static List<Series> parseSearch(String html, [String mode = 'short']) {
    final rows = _page(routerData(html), 'searchList')['searchList'];
    if (rows is! List) throw const ContentException('搜索数据不完整');
    final expected = normalizeMode(mode) == 'manju' ? '205' : '203';
    return _unique(
      rows.map((r) {
        final v = r is Map ? r['video_data'] : null;
        if (v is! Map) return null;
        final genre = '${v['genre']}';
        if (mode == 'all') {
          if (genre != '203' && genre != '205') return null;
          return _series(v, genre == '205' ? 'manju' : 'short', search: true);
        }
        if (genre != expected) return null;
        return _series(v, mode, search: true);
      }),
    );
  }

  static List<Series> _unique(Iterable<Series?> items) {
    final result = <String, Series>{};
    for (final item in items) {
      if (item != null) result[item.id] = item;
    }
    return result.values.toList();
  }

  static Detail parseDetail(String html, [String mode = 'short']) {
    final raw = _page(routerData(html), 'seriesDetail')['seriesDetail'];
    final series = _series(raw, mode);
    if (series == null || raw is! Map || raw['vid_list'] is! List) {
      throw const ContentException('剧集数据不完整');
    }
    final ids = raw['vid_list'] as List;
    final accessible = int.tryParse('${raw['accessible_episode_cnt']}') ?? 0;
    final episodes = <Episode>[];
    for (var i = 0; i < ids.length; i++) {
      final id = '${ids[i]}';
      if (!_id.hasMatch(id)) throw const ContentException('剧集编号无效');
      episodes.add(Episode(number: i + 1, id: id, available: i < accessible));
    }
    if (episodes.isEmpty || episodes.length != series.count) {
      throw const ContentException('剧集列表不完整，请稍后重试');
    }
    return Detail(series: series, episodes: episodes);
  }
}
