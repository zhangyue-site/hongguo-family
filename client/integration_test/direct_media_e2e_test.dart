import 'dart:io';

import 'package:flutter_test/flutter_test.dart';
import 'package:hongguo_client/data/direct_media.dart';
import 'package:integration_test/integration_test.dart';
import 'package:video_player/video_player.dart';

/// Real-device media verification: fetch the episode media model, download
/// and decrypt it, then decode through AVPlayer. Uses the 重生八五 series
/// (public preview 3, 100 episodes) the same way the shipped app will.
void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  final service = DirectMediaService(keepIntermediates: true);

  Future<void> playAndAssert(DirectMedia media, String label) async {
    final controller = VideoPlayerController.file(media.file);
    await controller.initialize();
    expect(controller.value.duration, greaterThan(const Duration(seconds: 10)),
        reason: '$label must decode to a real duration');
    // ignore: avoid_print
    print('[e2e] $label size=${media.file.lengthSync()} '
        'decoded=${controller.value.size} dur=${controller.value.duration}');
    await controller.play();
    await Future<void>.delayed(const Duration(seconds: 4));
    expect(controller.value.position, greaterThan(const Duration(seconds: 1)),
        reason: '$label must advance while playing');
    expect(controller.value.size.width, greaterThanOrEqualTo(360),
        reason: '$label must report a real decoded width');
    await controller.dispose();
  }

  testWidgets('episode 1 plays in HD through the direct path', (tester) async {
    final media = await service.prepare(
      '7694745928447577112',
      cacheDir: await Directory.systemTemp.createTemp('hg-e2e'),
    );
    expect(media.decrypted, isTrue, reason: 'direct tracks ship CENC-encrypted');
    expect(media.width, greaterThanOrEqualTo(720),
        reason: 'the chosen track should be HD, not the 360p preview');
    await playAndAssert(media, 'ep1');
  }, timeout: const Timeout(Duration(minutes: 6)));

  testWidgets('episodes beyond the preview are attempted', (tester) async {
    final results = <String, String>{};
    for (final entry in {
      'ep4': '7694746001218751512',
      'ep100': '7694745886760373272',
    }.entries) {
      try {
        final media = await service.prepare(
          entry.value,
          cacheDir: await Directory.systemTemp.createTemp('hg-e2e'),
        );
        await playAndAssert(media, entry.key);
        results[entry.key] =
            'OK ${media.width}x${media.height} decrypted=${media.decrypted}';
      } catch (e) {
        results[entry.key] = 'UNAVAILABLE: $e';
        // Diagnostics stay on disk for offline analysis when decryption
        // fails on real content.
        final slot = Directory(
            '${(await Directory.systemTemp.createTemp('hg-e2e')).path}/slot');
        // ignore: avoid_print
        print('[e2e] $entry.key slot=${slot.path} exists=${await slot.exists()}');
      }
    }
    // ignore: avoid_print
    print('[e2e] beyond-preview results: $results');
    expect(results.values, everyElement(isNot(contains('UNAVAILABLE'))),
        reason: 'full-episode access is the goal; failures must be visible');
  }, timeout: const Timeout(Duration(minutes: 12)));
}
