import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/player_shared/presentation/overlay_controls/overlay_controls.dart';

void main() {
  test('dismissModal closes modal and increments dismiss serial', () {
    var notifications = 0;
    final controller =
        TvPlayerOverlayAutoHideController(
            displayDuration: const Duration(seconds: 1),
          )
          ..addListener(() => notifications += 1)
          ..setModalVisible(visible: true)
          ..dismissModal();

    expect(controller.modalOpen, isFalse);
    expect(controller.modalDismissSerial, 1);
    expect(notifications, 2);

    controller.dispose();
  });

  test('restart does not arm timeout while a modal is open', () async {
    final controller = TvPlayerOverlayAutoHideController(
      displayDuration: const Duration(milliseconds: 1),
    );
    var timeoutCount = 0;

    controller
      ..setModalVisible(visible: true)
      ..restart(() => timeoutCount += 1);
    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(timeoutCount, 0);

    controller
      ..setModalVisible(visible: false)
      ..restart(() => timeoutCount += 1);
    await Future<void>.delayed(const Duration(milliseconds: 5));

    expect(timeoutCount, 1);

    controller.dispose();
  });
}
