import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hongguo_client/data/content.dart';
import 'package:hongguo_client/ui/episode_sheet.dart';

void main() {
  const series = Series(id: '123456789', title: '测试短剧', cover: '', count: 3);
  const detail = Detail(
    series: series,
    episodes: [
      Episode(number: 1, id: '123456781', available: true),
      Episode(number: 2, id: '123456782', available: true),
      Episode(number: 3, id: '123456783', available: false),
    ],
  );
  Future<void> open(WidgetTester t, ValueChanged<int?> result) async {
    await t.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(
            builder: (c) => TextButton(
              onPressed: () async {
                result(
                  await showEpisodeSheet(
                    c,
                    detail: detail,
                    selected: 2,
                    playing: true,
                  ),
                );
              },
              child: const Text('open'),
            ),
          ),
        ),
      ),
    );
    await t.tap(find.text('open'));
    await t.pumpAndSettle();
  }

  testWidgets(
    'marks current and returns same episode for caller to close without replay',
    (t) async {
      int? selected;
      await open(t, (n) => selected = n);
      expect(find.text('播放中'), findsOneWidget);
      await t.tap(find.text('2'));
      await t.pumpAndSettle();
      expect(selected, 2);
      expect(find.text('播放中'), findsNothing);
    },
  );
  testWidgets('every episode is selectable, including beyond the preview', (
    t,
  ) async {
    int? selected;
    await open(t, (n) => selected = n);
    await t.tap(find.text('3'));
    await t.pumpAndSettle();
    expect(selected, 3);
    expect(find.text('播放中'), findsNothing);
  });
}
