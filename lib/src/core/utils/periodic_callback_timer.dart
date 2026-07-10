import 'dart:async';

final class PeriodicCallbackTimer {
  Timer? _timer;
  var _disposed = false;

  bool get isRunning => _timer != null;

  void start({
    required Duration interval,
    required void Function() onTick,
  }) {
    if (_disposed) {
      return;
    }

    stop();
    _timer = Timer.periodic(interval, (_) => onTick());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    if (_disposed) {
      return;
    }

    _disposed = true;
    stop();
  }
}
