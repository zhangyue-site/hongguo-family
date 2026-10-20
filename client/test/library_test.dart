import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:hongguo_client/data/library.dart';
import 'package:hongguo_client/data/content.dart';

void main() {
  test(
    'favorites and playback progress survive a new library instance',
    () async {
      SharedPreferences.setMockInitialValues({});
      final p = await SharedPreferences.getInstance();
      final a = Library(p);
      const s = Series(
        id: '7694653385668037657',
        title: '测试短剧',
        cover: 'https://example.com/a.jpg',
        count: 86,
      );
      await a.toggle(s);
      await a.save(s, 2, 25000);
      final restored = Library(p);
      expect(restored.contains(s.id), isTrue);
      expect(restored.progress(s.id)?.episode, 2);
      expect(restored.progress(s.id)?.positionMs, 25000);
      await restored.save(s, 0, 10);
      expect(restored.progress(s.id)?.episode, 2);
    },
  );
}
