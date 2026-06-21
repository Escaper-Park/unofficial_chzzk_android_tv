import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/utils.dart';

void main() {
  test('accumulates positive running time', () {
    final tracker = WatchTimeTracker();
    final startedAt = DateTime(2026);

    tracker.start(startedAt);

    expect(
      tracker.valueAt(startedAt.add(const Duration(seconds: 5))),
      const Duration(seconds: 5),
    );

    tracker.accumulateUntil(startedAt.add(const Duration(seconds: 5)));

    expect(tracker.accumulated, const Duration(seconds: 5));
    expect(
      tracker.valueAt(startedAt.add(const Duration(seconds: 7))),
      const Duration(seconds: 7),
    );
  });

  test('stops without counting paused time', () {
    final tracker = WatchTimeTracker();
    final startedAt = DateTime(2026);

    tracker
      ..start(startedAt)
      ..stop(startedAt.add(const Duration(seconds: 5)));

    expect(tracker.accumulated, const Duration(seconds: 5));
    expect(
      tracker.valueAt(startedAt.add(const Duration(minutes: 1))),
      const Duration(seconds: 5),
    );
  });

  test('ignores zero and backward deltas', () {
    final tracker = WatchTimeTracker();
    final startedAt = DateTime(2026, 1, 1, 0, 0, 10);

    tracker
      ..start(startedAt)
      ..accumulateUntil(startedAt)
      ..accumulateUntil(startedAt.subtract(const Duration(seconds: 1)));

    expect(tracker.accumulated, Duration.zero);
  });
}
