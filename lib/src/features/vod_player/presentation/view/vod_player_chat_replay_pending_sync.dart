final class VodPlayerChatReplayPendingSync {
  int? _positionMs;
  bool _force = false;
  bool _forceReposition = false;
  bool _preferNextCursor = true;

  void record({
    required int positionMs,
    required bool force,
    required bool forceReposition,
    required bool preferNextCursor,
  }) {
    _positionMs = positionMs;
    _force = _force || force;
    _forceReposition = _forceReposition || forceReposition;
    _preferNextCursor = _preferNextCursor && preferNextCursor;
  }

  VodPlayerChatReplayPendingSyncRequest? take() {
    final positionMs = _positionMs;
    if (positionMs == null) {
      return null;
    }

    final request = VodPlayerChatReplayPendingSyncRequest(
      positionMs: positionMs,
      force: _force,
      forceReposition: _forceReposition,
      preferNextCursor: _preferNextCursor,
    );
    clear();
    return request;
  }

  void clear() {
    _positionMs = null;
    _force = false;
    _forceReposition = false;
    _preferNextCursor = true;
  }
}

final class VodPlayerChatReplayPendingSyncRequest {
  const VodPlayerChatReplayPendingSyncRequest({
    required this.positionMs,
    required this.force,
    required this.forceReposition,
    required this.preferNextCursor,
  });

  final int positionMs;
  final bool force;
  final bool forceReposition;
  final bool preferNextCursor;
}
