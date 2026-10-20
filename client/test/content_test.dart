import 'dart:convert';
import 'dart:io';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:http/testing.dart';
import 'package:hongguo_client/data/content.dart';

String fixture(String name) =>
    File('test/fixtures/$name.html').readAsStringSync();
String page(Map<String, dynamic> data) =>
    '<script>window._ROUTER_DATA = ${jsonEncode({
      'loaderData': {'test': data},
    })};</script>';
void main() {
  test('real public search fixture parses comic drama rows', () {
    final rows = ContentService.parseSearch(fixture('search'), 'manju');
    expect(rows, isNotEmpty);
    expect(rows.every((s) => RegExp(r'^\d{8,24}$').hasMatch(s.id)), isTrue);
  });

  test('genre uses server category paths and Series survives persistence', () {
    expect(
      ContentService.categoryPath('short', '喜剧'),
      '/category/real-drama/comedy',
    );
    expect(
      ContentService.categoryPath('manju', '脑洞'),
      '/category/comic-drama/creative',
    );
    expect(
      ContentService.categoryPath('ai', '科幻'),
      '/category/ai-drama/sci-fi',
    );
    expect(
      () => ContentService.categoryPath('ai', '爱情'),
      throwsA(isA<ContentException>()),
    );
    final series = ContentService.parseBrowse(fixture('catalog')).first;
    expect(Series.fromJson(series.toJson()).toJson(), series.toJson());
  });

  test(
    'live public contract: catalogue, detail, first episode metadata',
    () async {
      final service = ContentService();
      try {
        final rows = await service.browse('short');
        expect(rows, isNotEmpty);
        final detail = await service.detail(
          const Series(
            id: '7694653385668037657',
            title: '王妈',
            cover: '',
            count: 86,
          ),
        );
        expect(detail.episodes.length, detail.series.count);
        expect(detail.episodes.where((e) => e.available), isNotEmpty);
        final url = await service.mediaURL(
          detail.series.id,
          detail.episodes.first,
        );
        expect(url.scheme, 'https');
      } finally {
        service.close();
      }
    },
    skip: !const bool.fromEnvironment('LIVE_CONTENT'),
    timeout: const Timeout(Duration(minutes: 2)),
  );

  test(
    'real detail includes all 86 episodes and only 3 publicly accessible',
    () {
      final detail = ContentService.parseDetail(fixture('detail'));
      expect(detail.series.title, '王妈在顾家当保姆后全家只会搞笑了');
      expect(detail.episodes.length, 86);
      expect(detail.episodes.where((e) => e.available).length, 3);
      expect(detail.episodes[3].available, false);
      expect(detail.episodes.last.number, 86);
    },
  );
  test('real catalogue parses series and HTTPS cover', () {
    final rows = ContentService.parseBrowse(fixture('catalog'));
    expect(rows.length, 2);
    expect(rows.first.count, 86);
    expect(rows.first.cover, startsWith('https://'));
  });
  test(
    'malformed page reports explicit errors; escaped braces remain valid',
    () {
      expect(
        () => ContentService.routerData('<html>offline</html>'),
        throwsA(isA<ContentException>()),
      );
      expect(
        () => ContentService.routerData('_ROUTER_DATA = {'),
        throwsA(isA<ContentException>()),
      );
      expect(
        ContentService.routerData(
          page({'text': 'abc } " [ xyz'}),
        )['loaderData']['test']['text'],
        'abc } " [ xyz',
      );
    },
  );
  test('search excludes wrong genre, invalid IDs and insecure artwork', () {
    final html = page({
      'searchList': [
        {
          'video_data': {
            'series_id': '7694653385668037657',
            'series_title': '喜剧',
            'genre': 203,
            'series_cover': 'http://example.com/a',
          },
        },
        {
          'video_data': {
            'series_id': '7694653385668037658',
            'series_title': '漫剧',
            'genre': 205,
          },
        },
        {
          'video_data': {
            'series_id': '../../secret',
            'series_title': 'bad',
            'genre': 203,
          },
        },
      ],
    });
    final rows = ContentService.parseSearch(html);
    expect(rows.map((s) => s.title), ['喜剧']);
    expect(rows.first.cover, '');
  });
  test('restricted episode never makes a network request', () async {
    final service = ContentService(
      client: MockClient((_) async {
        fail('Restricted episode must not request playback');
      }),
    );
    await expectLater(
      service.mediaURL(
        '7694653385668037657',
        const Episode(number: 4, id: '7694655231191174169', available: false),
      ),
      throwsA(isA<ContentException>()),
    );
    service.close();
  });
  test('play URL requires matching public player metadata', () async {
    final service = ContentService(
      client: MockClient((request) async {
        expect(request.url.scheme, 'https');
        expect(
          request.url.path,
          '/player/7694653385668037657/7694655440692448281',
        );
        return http.Response(fixture('player'), 200);
      }),
    );
    final url = await service.mediaURL(
      '7694653385668037657',
      const Episode(number: 1, id: '7694655440692448281', available: true),
    );
    expect(
      url.toString(),
      'https://hongguoduanju.com/video/public/7694655440692448281/360p.mp4',
    );
    service.close();
  });
  test('prefers the highest advertised playable public quality', () async {
    const sid = '7694653385668037657';
    const vid = '7694655440692448281';
    final html =
        '${fixture('player')}<video src="/video/public/$vid/720p.mp4"></video>'
        '<video src="/video/public/$vid/1080p.mp4"></video>';
    final service = ContentService(
      client: MockClient((request) async {
        if (request.url.path.startsWith('/player/')) {
          return http.Response(html, 200);
        }
        expect(request.url.path, '/video/public/$vid/1080p.mp4');
        expect(request.headers['Range'], 'bytes=0-1023');
        return http.Response.bytes(
          [0, 0, 0, 24, 102, 116, 121, 112, 105, 115, 111, 109],
          206,
          headers: {'content-type': 'video/mp4'},
        );
      }),
    );
    try {
      final url = await service.mediaURL(
        sid,
        const Episode(number: 1, id: vid, available: true),
      );
      expect(url.path, '/video/public/$vid/1080p.mp4');
    } finally {
      service.close();
    }
  });
  test(
    'unavailable advertised HD falls back to next advertised quality',
    () async {
      const sid = '7694653385668037657';
      const vid = '7694655440692448281';
      final html =
          '${fixture('player')}<video src="/video/public/$vid/720p.mp4"></video>'
          '<video src="/video/public/$vid/1080p.mp4"></video>';
      final attempted = <String>[];
      final service = ContentService(
        client: MockClient((request) async {
          if (request.url.path.startsWith('/player/')) {
            return http.Response(html, 200);
          }
          attempted.add(request.url.path);
          if (request.url.path.endsWith('/1080p.mp4')) {
            return http.Response('not found', 404);
          }
          return http.Response.bytes(
            [0, 0, 0, 24, 102, 116, 121, 112, 105, 115, 111, 109],
            206,
            headers: {'content-type': 'video/mp4'},
          );
        }),
      );
      try {
        final url = await service.mediaURL(
          sid,
          const Episode(number: 1, id: vid, available: true),
        );
        expect(url.path, '/video/public/$vid/720p.mp4');
        expect(attempted, contains('/video/public/$vid/1080p.mp4'));
      } finally {
        service.close();
      }
    },
  );
  test('metadata denying public access is respected', () async {
    final service = ContentService(
      client: MockClient(
        (_) async => http.Response(
          page({
            'publicVideoSeo': {'available': false},
          }),
          200,
        ),
      ),
    );
    await expectLater(
      service.mediaURL(
        '7694653385668037657',
        const Episode(number: 1, id: '7694655440692448281', available: true),
      ),
      throwsA(isA<ContentException>()),
    );
    service.close();
  });
  test(
    'HTTP error, oversize response, and unknown page fail explicitly',
    () async {
      for (final response in [
        http.Response('offline', 503),
        http.Response('x', 200, headers: {'content-length': '9999999'}),
        http.Response('<html>changed</html>', 200),
      ]) {
        final service = ContentService(
          client: MockClient((_) async => response),
        );
        await expectLater(
          service.browse('short'),
          throwsA(isA<ContentException>()),
        );
        service.close();
      }
    },
  );
}
