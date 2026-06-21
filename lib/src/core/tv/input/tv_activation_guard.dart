import 'package:flutter/foundation.dart';

typedef TvActivationClock = DateTime Function();

final class TvActivationGuard {
  TvActivationGuard({
    this.cooldown = defaultCooldown,
    TvActivationClock? clock,
  }) : _clock = clock ?? DateTime.now;

  static const defaultCooldown = Duration(milliseconds: 600);

  final Duration cooldown;
  final TvActivationClock _clock;
  DateTime? _lastAcceptedAt;

  bool accept() {
    final now = _clock();
    final lastAcceptedAt = _lastAcceptedAt;

    if (lastAcceptedAt != null && now.difference(lastAcceptedAt) < cooldown) {
      return false;
    }

    _lastAcceptedAt = now;
    return true;
  }

  void run(VoidCallback action) {
    if (accept()) {
      action();
    }
  }
}
