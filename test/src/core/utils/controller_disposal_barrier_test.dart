import 'dart:async';

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/controller_disposal_barrier.dart';

void main() {
  test(
    'returns after the barrier timeout when disposal never completes',
    () async {
      final disposal = Completer<void>();
      final stopwatch = Stopwatch()..start();

      await waitForControllerDisposalBarrier(
        disposal.future,
        timeout: const Duration(milliseconds: 10),
      );

      expect(
        stopwatch.elapsed,
        greaterThanOrEqualTo(const Duration(milliseconds: 10)),
      );
      expect(stopwatch.elapsed, lessThan(const Duration(seconds: 1)));
    },
  );

  test('absorbs a disposal failure', () async {
    await expectLater(
      waitForControllerDisposalBarrier(
        Future<void>.error(StateError('failed')),
      ),
      completes,
    );
  });

  test('coordinator waits for all pending disposals', () async {
    final coordinator = ControllerDisposalCoordinator(
      timeout: const Duration(seconds: 1),
    );
    final first = Completer<void>();
    final second = Completer<void>();
    var waitCompleted = false;

    unawaited(coordinator.schedule(() => first.future));
    unawaited(coordinator.schedule(() => second.future));
    final wait = coordinator.waitForPending().whenComplete(() {
      waitCompleted = true;
    });

    first.complete();
    await Future<void>.delayed(Duration.zero);
    expect(waitCompleted, isFalse);

    second.complete();
    await wait;
    expect(waitCompleted, isTrue);
  });

  test('wait keeps disposals registered after its snapshot', () async {
    final coordinator = ControllerDisposalCoordinator(
      timeout: const Duration(seconds: 1),
    );
    final first = Completer<void>();
    final second = Completer<void>();

    unawaited(coordinator.schedule(() => first.future));
    final firstWait = coordinator.waitForPending();
    unawaited(coordinator.schedule(() => second.future));
    first.complete();
    await firstWait;

    var secondWaitCompleted = false;
    final secondWait = coordinator.waitForPending().whenComplete(() {
      secondWaitCompleted = true;
    });
    await Future<void>.delayed(Duration.zero);
    expect(secondWaitCompleted, isFalse);

    second.complete();
    await secondWait;
  });

  test('coordinator recovers from a disposal that never completes', () async {
    final coordinator = ControllerDisposalCoordinator(
      timeout: const Duration(milliseconds: 10),
    );
    final blocked = Completer<void>();
    var nextStarted = false;

    unawaited(coordinator.schedule(() => blocked.future));
    await coordinator.waitForPending();
    final nextDone = coordinator.schedule(() async => nextStarted = true);

    await nextDone;
    expect(nextStarted, isTrue);
    await expectLater(coordinator.waitForPending(), completes);
  });

  test('scheduled disposal is bounded without a later waiter', () async {
    final coordinator = ControllerDisposalCoordinator(
      timeout: const Duration(milliseconds: 10),
    );
    final blocked = Completer<void>();

    await expectLater(coordinator.schedule(() => blocked.future), completes);
  });

  test('disposing coordinator cancels an active timeout wait', () async {
    final coordinator = ControllerDisposalCoordinator(
      timeout: const Duration(seconds: 30),
    );
    final blocked = Completer<void>();
    unawaited(coordinator.schedule(() => blocked.future));

    final wait = coordinator.waitForPending();
    await Future<void>.delayed(Duration.zero);
    coordinator.dispose();

    await expectLater(wait, completes);
    await expectLater(coordinator.waitForPending(), completes);
  });
}
