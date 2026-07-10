import '../../../../core/utils/controller_disposal_barrier.dart';

final class LivePlayerPlaybackSessionHandle {
  const LivePlayerPlaybackSessionHandle(this._suspend);

  final void Function() _suspend;

  void suspend() {
    _suspend();
  }
}

final class LivePlayerPlaybackSessionController {
  final Set<LivePlayerPlaybackSessionHandle> _handles = {};
  final ControllerDisposalCoordinator _controllerDisposals =
      mediaControllerDisposalCoordinator;
  var _suspended = false;
  var _disposed = false;

  void register(LivePlayerPlaybackSessionHandle handle) {
    if (_disposed || _suspended) {
      handle.suspend();
    }

    if (_disposed) {
      return;
    }

    _handles.add(handle);
  }

  void unregister(LivePlayerPlaybackSessionHandle handle) {
    _handles.remove(handle);
  }

  void suspendAll() {
    _suspended = true;
    for (final handle in _handles.toList(growable: false)) {
      handle.suspend();
    }
  }

  Future<void> waitForControllerDisposals() {
    return _controllerDisposals.waitForPending();
  }

  Future<void> scheduleControllerDisposal(
    Future<void> Function() dispose,
  ) {
    return _controllerDisposals.schedule(dispose);
  }

  void dispose() {
    if (_disposed) {
      return;
    }

    _disposed = true;
    _handles.clear();
  }
}
