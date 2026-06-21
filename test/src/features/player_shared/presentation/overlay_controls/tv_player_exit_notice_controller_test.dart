import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/overlay_controls/overlay_controls.dart';

void main() {
  test('show exposes notice until display duration elapses', () async {
    final controller = TvPlayerExitNoticeController(
      displayDuration: const Duration(milliseconds: 1),
    )..show();

    expect(controller.isShowing, isTrue);

    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(controller.isShowing, isFalse);

    controller.dispose();
  });

  test('hide clears notice immediately', () {
    final controller =
        TvPlayerExitNoticeController(
            displayDuration: const Duration(seconds: 1),
          )
          ..show()
          ..hide();

    expect(controller.isShowing, isFalse);

    controller.dispose();
  });
}
