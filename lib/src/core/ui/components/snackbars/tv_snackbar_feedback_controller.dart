import 'dart:async';

import 'tv_snackbar_design.dart';

final class TvSnackbarFeedbackController {
  Timer? _timer;

  void showMessage({
    required String message,
    required void Function(String? message) onMessageChanged,
    Duration duration = TvSnackbarDesign.duration,
  }) {
    cancel();
    onMessageChanged(message);
    _timer = Timer(duration, () {
      _timer = null;
      onMessageChanged(null);
    });
  }

  void schedule({
    required int serial,
    required bool visible,
    required void Function(int serial) onElapsed,
    Duration duration = TvSnackbarDesign.duration,
  }) {
    cancel();
    if (!visible) {
      return;
    }

    _timer = Timer(duration, () {
      _timer = null;
      onElapsed(serial);
    });
  }

  void cancel() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    cancel();
  }
}
