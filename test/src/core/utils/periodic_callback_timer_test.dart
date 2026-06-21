import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/utils.dart';

void main() {
  test('start ticks at the given interval', () async {
    final timer = PeriodicCallbackTimer();
    addTearDown(timer.dispose);
    var tickCount = 0;

    timer.start(
      interval: const Duration(milliseconds: 5),
      onTick: () => tickCount += 1,
    );
    await Future<void>.delayed(const Duration(milliseconds: 16));

    expect(tickCount, greaterThanOrEqualTo(2));
    expect(timer.isRunning, isTrue);
  });

  test('start cancels the previous timer', () async {
    final timer = PeriodicCallbackTimer();
    addTearDown(timer.dispose);
    var firstTickCount = 0;
    var secondTickCount = 0;

    timer
      ..start(
        interval: const Duration(milliseconds: 5),
        onTick: () => firstTickCount += 1,
      )
      ..start(
        interval: const Duration(milliseconds: 5),
        onTick: () => secondTickCount += 1,
      );
    await Future<void>.delayed(const Duration(milliseconds: 16));

    expect(firstTickCount, 0);
    expect(secondTickCount, greaterThanOrEqualTo(2));
  });

  test('stop cancels pending ticks', () async {
    final timer = PeriodicCallbackTimer();
    var tickCount = 0;

    timer
      ..start(
        interval: const Duration(milliseconds: 5),
        onTick: () => tickCount += 1,
      )
      ..stop();
    await Future<void>.delayed(const Duration(milliseconds: 16));

    expect(tickCount, 0);
    expect(timer.isRunning, isFalse);
  });
}
