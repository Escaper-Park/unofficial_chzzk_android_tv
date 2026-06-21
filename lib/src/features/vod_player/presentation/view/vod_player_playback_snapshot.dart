import 'package:flutter/foundation.dart';

final class VodPlayerPlaybackSnapshot {
  const VodPlayerPlaybackSnapshot({
    this.position = Duration.zero,
    this.duration = Duration.zero,
  });

  final Duration position;
  final Duration duration;

  double progress({required int fallbackDurationSeconds}) {
    final totalMilliseconds = duration > Duration.zero
        ? duration.inMilliseconds
        : fallbackDurationSeconds * Duration.millisecondsPerSecond;
    if (totalMilliseconds <= 0) {
      return 0;
    }

    return (position.inMilliseconds / totalMilliseconds).clamp(0, 1).toDouble();
  }
}

typedef VodPlayerPlaybackSnapshotListenable =
    ValueListenable<VodPlayerPlaybackSnapshot>;
