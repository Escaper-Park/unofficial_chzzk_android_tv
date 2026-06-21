final class VodPlayerWatchEventSeekHold {
  VodPlayerWatchEventSeekHold({
    required this.settleDelay,
    DateTime Function()? currentTime,
  }) : _currentTime = currentTime ?? DateTime.now;

  final Duration settleDelay;
  final DateTime Function() _currentTime;
  DateTime? _resumeAt;

  bool get isHeld {
    final resumeAt = _resumeAt;
    if (resumeAt == null) {
      return false;
    }

    if (_currentTime().isBefore(resumeAt)) {
      return true;
    }

    _resumeAt = null;
    return false;
  }

  void hold() {
    _resumeAt = _currentTime().add(settleDelay);
  }

  void clear() {
    _resumeAt = null;
  }
}
