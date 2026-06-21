import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/ui/components/snackbars/tv_snackbar_feedback_controller.dart';

void main() {
  testWidgets('showMessage publishes and clears the latest message', (
    tester,
  ) async {
    final controller = TvSnackbarFeedbackController();
    final messages = <String?>[];

    controller
      ..showMessage(
        message: 'first',
        duration: const Duration(seconds: 1),
        onMessageChanged: messages.add,
      )
      ..showMessage(
        message: 'second',
        duration: const Duration(seconds: 1),
        onMessageChanged: messages.add,
      );

    expect(messages, ['first', 'second']);

    await tester.pump(const Duration(milliseconds: 999));
    expect(messages, ['first', 'second']);

    await tester.pump(const Duration(milliseconds: 1));
    expect(messages, ['first', 'second', null]);

    controller.dispose();
  });

  testWidgets('schedule clears the latest visible serial after the duration', (
    tester,
  ) async {
    final controller = TvSnackbarFeedbackController();
    final clearedSerials = <int>[];

    controller
      ..schedule(
        serial: 1,
        visible: true,
        duration: const Duration(seconds: 1),
        onElapsed: clearedSerials.add,
      )
      ..schedule(
        serial: 2,
        visible: true,
        duration: const Duration(seconds: 1),
        onElapsed: clearedSerials.add,
      );

    await tester.pump(const Duration(milliseconds: 999));
    expect(clearedSerials, isEmpty);

    await tester.pump(const Duration(milliseconds: 1));
    expect(clearedSerials, [2]);

    controller.dispose();
  });

  testWidgets('cancel prevents the pending clear callback', (tester) async {
    final controller = TvSnackbarFeedbackController();
    final clearedSerials = <int>[];

    controller
      ..schedule(
        serial: 1,
        visible: true,
        duration: const Duration(seconds: 1),
        onElapsed: clearedSerials.add,
      )
      ..cancel();
    await tester.pump(const Duration(seconds: 1));

    expect(clearedSerials, isEmpty);
    controller.dispose();
  });
}
