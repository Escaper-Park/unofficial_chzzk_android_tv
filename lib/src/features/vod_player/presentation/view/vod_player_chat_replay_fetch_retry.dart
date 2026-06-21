import 'dart:math' as math;

final class VodPlayerChatReplayFetchRetryBackoff {
  VodPlayerChatReplayFetchRetryBackoff(this._clock);

  static const _initialDelay = Duration(seconds: 1);
  static const _maxDelay = Duration(seconds: 30);

  final DateTime Function() _clock;

  int _failureCount = 0;
  DateTime? _blockedUntil;

  bool canFetch() {
    final blockedUntil = _blockedUntil;
    return blockedUntil == null || !_clock().isBefore(blockedUntil);
  }

  void recordFailure() {
    _failureCount += 1;
    _blockedUntil = _clock().add(_nextDelay());
  }

  void clear() {
    _failureCount = 0;
    _blockedUntil = null;
  }

  Duration _nextDelay() {
    final multiplier = 1 << math.min(_failureCount - 1, 5);
    final milliseconds = math.min(
      _initialDelay.inMilliseconds * multiplier,
      _maxDelay.inMilliseconds,
    );
    return Duration(milliseconds: milliseconds);
  }
}
