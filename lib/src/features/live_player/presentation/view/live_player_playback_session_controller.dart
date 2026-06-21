final class LivePlayerPlaybackSessionHandle {
  const LivePlayerPlaybackSessionHandle(this._suspend);

  final void Function() _suspend;

  void suspend() {
    _suspend();
  }
}

final class LivePlayerPlaybackSessionController {
  final Set<LivePlayerPlaybackSessionHandle> _handles = {};
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

  void dispose() {
    if (_disposed) {
      return;
    }

    _disposed = true;
    _handles.clear();
  }
}
