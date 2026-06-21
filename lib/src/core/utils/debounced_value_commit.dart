import 'dart:async';

final class DebouncedValueCommit<T> {
  DebouncedValueCommit({
    required this.delay,
    required this.onDebounceElapsed,
  });

  final Duration delay;
  final void Function() onDebounceElapsed;

  Timer? _timer;
  Object? _pendingValue = _empty;

  static const Object _empty = Object();

  bool get hasPendingValue => !identical(_pendingValue, _empty);

  void setPendingValue(T value) {
    _pendingValue = value;
    _cancelTimer();
  }

  void schedule() {
    if (!hasPendingValue) {
      return;
    }

    _cancelTimer();
    _timer = Timer(delay, _handleDebounceElapsed);
  }

  T takePendingValue() {
    if (!hasPendingValue) {
      throw StateError('No pending value to commit.');
    }

    _cancelTimer();
    final value = _pendingValue as T;
    _pendingValue = _empty;
    return value;
  }

  void clear() {
    _cancelTimer();
    _pendingValue = _empty;
  }

  void dispose() {
    clear();
  }

  void _handleDebounceElapsed() {
    _timer = null;
    onDebounceElapsed();
  }

  void _cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }
}
