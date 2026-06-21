import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/overlay_controls/overlay_controls.dart';

void main() {
  test('show exposes visibility until display duration elapses', () async {
    final controller = TvTimedVisibilityController(
      displayDuration: const Duration(milliseconds: 1),
    );
    final states = <bool>[];
    controller
      ..addListener(() => states.add(controller.isShowing))
      ..show();

    expect(controller.isShowing, isTrue);
    expect(states, [true]);

    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(controller.isShowing, isFalse);
    expect(states, [true, false]);

    controller.dispose();
  });

  test('hide clears visibility immediately', () {
    final controller =
        TvTimedVisibilityController(
            displayDuration: const Duration(seconds: 1),
          )
          ..show()
          ..hide();

    expect(controller.isShowing, isFalse);

    controller.dispose();
  });
}
