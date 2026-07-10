part of 'vod_player_chat_replay_controller.dart';

extension _VodPlayerChatReplayFetchHelpers on VodPlayerChatReplayController {
  Future<void> _fetchChunkAround(
    int positionMs, {
    required bool replaceCachedMessages,
    bool isTailPrefetch = false,
    bool preferNextCursor = true,
  }) async {
    final revision = ++_fetchRevision;
    _isFetching = true;
    _isTailPrefetchInFlight = isTailPrefetch;
    _pendingSync.clear();

    if (!isTailPrefetch) {
      _emit(
        state.copyWith(
          phase: _cachedMessages.isEmpty
              ? VodPlayerChatReplayPhase.loading
              : state.phase,
          message: null,
        ),
      );
    }

    try {
      final previousVideoChatSize = isTailPrefetch
          ? VodPlayerChatReplayController._tailPrefetchPreviousVideoChatSize
          : VodPlayerChatReplayController._previousVideoChatSize;
      final videoChatPage = await fetchPage(
        videoNo: videoNo,
        playerMessageTime: _resolveRequestCursor(
          positionMs,
          preferNextCursor: preferNextCursor,
        ),
        previousVideoChatSize: previousVideoChatSize,
      );
      if (_isStale(revision)) {
        return;
      }

      _fetchRetryBackoff.clear();
      final page = playerChatMessagePageFromVideoChatPage(videoChatPage);
      _mergeFetchedMessages(
        page,
        replaceCachedMessages: replaceCachedMessages,
        coverageStartMs: _resolveFetchedCoverageStartMs(
          page,
          previousVideoChatSize: previousVideoChatSize,
        ),
      );
      _nextPlayerMessageTime = page.nextPlayerMessageTime;
      _trimRawCacheAroundPosition(_currentPlayerPositionMs ?? positionMs);

      if (!isTailPrefetch) {
        _emit(state.copyWith(phase: VodPlayerChatReplayPhase.ready));
      }
    } on Object {
      if (_isStale(revision)) {
        return;
      }

      _fetchRetryBackoff.recordFailure();
      if (isTailPrefetch) {
        return;
      }

      _emit(state.copyWith(phase: VodPlayerChatReplayPhase.error));
    } finally {
      if (!_isStale(revision)) {
        _isFetching = false;
        _isTailPrefetchInFlight = false;
        _replayPendingPosition();
      }
    }
  }

  int _resolveRequestCursor(
    int positionMs, {
    required bool preferNextCursor,
  }) {
    if (!preferNextCursor) {
      return positionMs;
    }

    final nextPlayerMessageTime = _nextPlayerMessageTime;
    final loadedRangeEndMs = _loadedRangeEndMs;
    if (loadedRangeEndMs != null &&
        nextPlayerMessageTime != null &&
        positionMs > loadedRangeEndMs &&
        positionMs - loadedRangeEndMs <=
            VodPlayerChatReplayController._tailPrefetchLeadTimeMs) {
      return nextPlayerMessageTime;
    }

    return positionMs;
  }

  void _maybePrefetchNextChunk({required int positionMs}) {
    final nextPlayerMessageTime = _nextPlayerMessageTime;
    final loadedRangeEndMs = _loadedRangeEndMs;
    if (nextPlayerMessageTime == null ||
        loadedRangeEndMs == null ||
        _isFetching ||
        _isTailPrefetchInFlight ||
        !_fetchRetryBackoff.canFetch() ||
        loadedRangeEndMs - positionMs >
            VodPlayerChatReplayController._tailPrefetchLeadTimeMs) {
      return;
    }

    unawaited(
      _fetchChunkAround(
        nextPlayerMessageTime,
        replaceCachedMessages: false,
        isTailPrefetch: true,
      ),
    );
  }

  bool _isStale(int revision) {
    return _isDisposed || revision != _fetchRevision;
  }

  void _replayPendingPosition() {
    if (_isDisposed) {
      return;
    }

    final pendingSync = _pendingSync.take();
    if (pendingSync == null) {
      return;
    }

    unawaited(
      syncToPosition(
        Duration(milliseconds: pendingSync.positionMs),
        force: pendingSync.force,
        forceReposition: pendingSync.forceReposition,
        preferNextCursor: pendingSync.preferNextCursor,
      ),
    );
  }
}
