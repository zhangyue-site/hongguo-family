import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hongguo_client/data/content.dart';
import 'package:hongguo_client/data/library.dart';
import 'package:hongguo_client/ui/home.dart';
import 'package:hongguo_client/ui/player_page.dart';

class DelayedService extends ContentService {
  final completion = Completer<Detail>();
  static const series = Series(
    id: '7694653385668037657',
    title: '取消测试',
    cover: '',
    count: 1,
  );
  @override
  Future<List<Series>> browse(String mode, [String genre = '全部']) async => [
    series,
  ];
  @override
  Future<Detail> detail(Series series) => completion.future;
}

void main() {
  testWidgets(
    'cancelled load never opens a player when response races dismissal',
    (tester) async {
      tester.view.physicalSize = const Size(390,844);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);
    SharedPreferences.setMockInitialValues({});
      final library = Library(await SharedPreferences.getInstance());
      final service = DelayedService();
      await tester.pumpWidget(
        MaterialApp(
          home: HomePage(library: library, service: service),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.text('取消测试'));
      await tester.pumpAndSettle();
      await tester.tap(find.text('立即播放'));
      await tester.pump(const Duration(milliseconds: 100));
      await tester.tap(find.text('取消'));
      await tester.pump(const Duration(milliseconds: 10));
      service.completion.complete(
        const Detail(
          series: DelayedService.series,
          episodes: [
            Episode(number: 1, id: '7694655440692448281', available: true),
          ],
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(HomePage), findsOneWidget);
      expect(find.byType(PlayerPage), findsNothing);
      expect(tester.takeException(), isNull);
    },
  );
}
