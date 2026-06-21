final class WatchTimeTracker {
  DateTime? _startedAt;
  Duration _accumulated = Duration.zero;

  Duration get accumulated => _accumulated;

  void start(DateTime currentTime) {
    _startedAt = currentTime;
  }

  void accumulateUntil(DateTime currentTime) {
    final startedAt = _startedAt;
    if (startedAt == null) {
      return;
    }

    _startedAt = currentTime;
    final delta = currentTime.difference(startedAt);
    if (delta.isNegative || delta == Duration.zero) {
      return;
    }

    _accumulated += delta;
  }

  void stop(DateTime currentTime) {
    accumulateUntil(currentTime);
    _startedAt = null;
  }

  Duration valueAt(DateTime currentTime) {
    final startedAt = _startedAt;
    if (startedAt == null) {
      return _accumulated;
    }

    final delta = currentTime.difference(startedAt);
    if (delta.isNegative || delta == Duration.zero) {
      return _accumulated;
    }

    return _accumulated + delta;
  }
}
