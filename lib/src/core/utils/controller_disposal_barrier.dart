import 'dart:async';

const controllerDisposalBarrierTimeout = Duration(seconds: 3);

/// Serializes release of scarce native decoders and surfaces across preview,
/// live, and VOD routes. Completed or timed-out entries remove themselves, so
/// keeping this coordinator for the process lifetime does not retain players.
final mediaControllerDisposalCoordinator = ControllerDisposalCoordinator();

/// Waits briefly for a native player to release scarce decoder and surface
/// resources without allowing a broken platform disposal to poison every
/// later player in the same session.
Future<void> waitForControllerDisposalBarrier(
  Future<void> disposal, {
  Duration timeout = controllerDisposalBarrierTimeout,
}) {
  return _ControllerDisposalBarrier(disposal, timeout).future;
}

/// Tracks native controller disposals so the next controller can wait for all
/// scarce decoder and surface resources. Each scheduled cleanup is bounded so
/// a final hung preview/controller cannot stay retained until another player
/// happens to start.
final class ControllerDisposalCoordinator {
  ControllerDisposalCoordinator({
    this.timeout = controllerDisposalBarrierTimeout,
  });

  final Duration timeout;
  final Set<Future<void>> _pending = <Future<void>>{};
  final Set<_ControllerDisposalBarrier> _waits = <_ControllerDisposalBarrier>{};
  var _disposed = false;

  Future<void> waitForPending() async {
    if (_disposed) {
      return;
    }

    final snapshot = _pending.toList(growable: false);
    if (snapshot.isEmpty) {
      return;
    }

    final wait = _ControllerDisposalBarrier(
      Future.wait<void>(snapshot).then<void>((_) {}),
      timeout,
    );
    _waits.add(wait);
    try {
      await wait.future;
    } finally {
      _waits.remove(wait);
      // A platform disposal that never completes must not poison every later
      // player in this session after the bounded wait expires.
      _pending.removeAll(snapshot);
    }
  }

  Future<void> schedule(Future<void> Function() dispose) {
    Future<void> disposal;
    try {
      disposal = dispose();
    } on Object {
      return Future<void>.value();
    }

    final guardedDisposal = disposal.catchError((Object _) {});
    if (_disposed) {
      unawaited(guardedDisposal);
      return Future<void>.value();
    }

    final disposalWait = _ControllerDisposalBarrier(guardedDisposal, timeout);
    _waits.add(disposalWait);
    final pending = disposalWait.future;
    _pending.add(pending);
    unawaited(
      pending.whenComplete(() {
        _waits.remove(disposalWait);
        _pending.remove(pending);
      }),
    );
    return pending;
  }

  void dispose() {
    if (_disposed) {
      return;
    }

    _disposed = true;
    for (final wait in _waits.toList(growable: false)) {
      wait.cancel();
    }
    _waits.clear();
    _pending.clear();
  }
}

final class _ControllerDisposalBarrier {
  _ControllerDisposalBarrier(Future<void> disposal, Duration timeout) {
    unawaited(
      disposal.then<void>(
        (_) => _finish(),
        onError: (Object _, StackTrace _) => _finish(),
      ),
    );
    scheduleMicrotask(() {
      if (!_settled) {
        _timer = Timer(timeout, _finish);
      }
    });
  }

  final Completer<void> _result = Completer<void>();
  Timer? _timer;
  var _settled = false;

  Future<void> get future => _result.future;

  void cancel() {
    _finish();
  }

  void _finish() {
    if (_settled) {
      return;
    }

    _settled = true;
    _timer?.cancel();
    _result.complete();
  }
}
