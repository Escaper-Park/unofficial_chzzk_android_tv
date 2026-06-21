import 'dart:async';

final class PeriodicCallbackTimer {
  Timer? _timer;

  bool get isRunning => _timer != null;

  void start({
    required Duration interval,
    required void Function() onTick,
  }) {
    stop();
    _timer = Timer.periodic(interval, (_) => onTick());
  }

  void stop() {
    _timer?.cancel();
    _timer = null;
  }

  void dispose() {
    stop();
  }
}
