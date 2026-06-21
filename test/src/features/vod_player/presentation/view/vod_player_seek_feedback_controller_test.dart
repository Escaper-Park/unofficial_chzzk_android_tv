import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_seek_feedback_controller.dart';

void main() {
  test('show exposes seek feedback until display duration elapses', () async {
    final controller = VodPlayerSeekFeedbackController(
      displayDuration: const Duration(milliseconds: 1),
    )..show(forward: true, position: const Duration(seconds: 12));

    expect(controller.feedback?.forward, isTrue);
    expect(controller.feedback?.position, const Duration(seconds: 12));

    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(controller.feedback, isNull);

    controller.dispose();
  });

  test('clear removes feedback immediately', () {
    final controller =
        VodPlayerSeekFeedbackController(
            displayDuration: const Duration(seconds: 1),
          )
          ..show(forward: false, position: const Duration(seconds: 7))
          ..clear();

    expect(controller.feedback, isNull);

    controller.dispose();
  });
}
