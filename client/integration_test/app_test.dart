import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_player/video_player.dart';
import 'package:hongguo_client/main.dart' as app;

void main() {
  final binding = IntegrationTestWidgetsFlutterBinding.ensureInitialized();
  testWidgets('real catalog, video, current episode, switch and return', (
    tester,
  ) async {
    Future<void> until(bool Function() condition, {int seconds = 70}) async {
      final end = DateTime.now().add(Duration(seconds: seconds));
      while (!condition() && DateTime.now().isBefore(end)) {
        await tester.pump(const Duration(milliseconds: 250));
        await Future<void>.delayed(const Duration(milliseconds: 250));
      }
      expect(condition(), isTrue, reason: 'Expected UI did not become ready');
    }

    await (await SharedPreferences.getInstance()).clear();
    await app.main();
    await tester.pump();
    const title = '王妈在顾家当保姆后全家只会搞笑了';
    await until(() => find.text(title).evaluate().isNotEmpty);
    await binding.takeScreenshot('ios-home');
    await tester.tap(find.text(title).first);
    await tester.pump(const Duration(milliseconds: 500));
    await until(() => find.text('立即播放').evaluate().isNotEmpty);
    await tester.tap(find.text('立即播放'));
    await tester.pump();
    await until(
      () => find.byType(VideoPlayer).evaluate().isNotEmpty,
      seconds: 100,
    );
    final first = tester
        .widget<VideoPlayer>(find.byType(VideoPlayer))
        .controller;
    await until(() => first.value.position.inMilliseconds > 1000);
    expect(first.value.duration.inSeconds, greaterThan(3));
    if (find.byTooltip('暂停').evaluate().isEmpty) {
      await tester.tap(find.byType(VideoPlayer));
      await tester.pump();
    }
    await tester.tap(find.byTooltip('暂停'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(first.value.isPlaying, isFalse);
    await binding.takeScreenshot('ios-player');
    await tester.tap(find.text('选集 · 1 / 86'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(find.text('当前集'), findsOneWidget);
    await binding.takeScreenshot('ios-episodes');
    await tester.tap(find.text('1'));
    await tester.pump(const Duration(milliseconds: 500));
    expect(
      identical(
        tester.widget<VideoPlayer>(find.byType(VideoPlayer)).controller,
        first,
      ),
      isTrue,
    );
    await tester.tap(find.text('选集 · 1 / 86'));
    await tester.pump(const Duration(milliseconds: 400));
    await tester.tap(find.text('2'));
    await tester.pump();
    await until(
      () =>
          find.byType(VideoPlayer).evaluate().isNotEmpty &&
          !identical(
            tester.widget<VideoPlayer>(find.byType(VideoPlayer)).controller,
            first,
          ),
      seconds: 100,
    );
    final second = tester
        .widget<VideoPlayer>(find.byType(VideoPlayer))
        .controller;
    await until(() => second.value.position.inMilliseconds > 500);
    if (find.byTooltip('返回').evaluate().isEmpty) {
      await tester.tap(find.byType(VideoPlayer));
      await tester.pump();
    }
    await tester.tap(find.byTooltip('返回'));
    await tester.pump(const Duration(milliseconds: 800));
    await until(() => find.text('继续观看').evaluate().isNotEmpty);
    expect(find.text('第 2 集 · 接着上次的故事'), findsOneWidget);
  });
}
