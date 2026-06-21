import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/tv/input/input.dart';

void main() {
  test('accepts the first activation and throttles rapid repeats', () {
    var now = DateTime(2026);
    final guard = TvActivationGuard(clock: () => now);

    expect(guard.accept(), true);
    expect(guard.accept(), false);

    now = now.add(TvActivationGuard.defaultCooldown);

    expect(guard.accept(), true);
  });

  test('runs the action only when activation is accepted', () {
    var now = DateTime(2026);
    final guard = TvActivationGuard(clock: () => now);
    var count = 0;

    guard
      ..run(() => count += 1)
      ..run(() => count += 1);
    now = now.add(TvActivationGuard.defaultCooldown);
    guard.run(() => count += 1);

    expect(count, 2);
  });
}
