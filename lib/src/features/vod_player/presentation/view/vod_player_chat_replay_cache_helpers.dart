part of 'vod_player_chat_replay_controller.dart';

extension _VodPlayerChatReplayCacheHelpers on VodPlayerChatReplayController {
  bool _isBeforeCachedCoverage(int positionMs) {
    final loadedRangeStartMs = _loadedRangeStartMs;
    if (loadedRangeStartMs == null) {
      return false;
    }

    return positionMs < (_cacheCoverageStartMs ?? loadedRangeStartMs);
  }

  bool _canReuseCache(int positionMs) {
    if (_cachedMessages.isEmpty) {
      if (_emptyCacheTerminal) {
        return true;
      }

      final emptyCacheValidUntilMs = _emptyCacheValidUntilMs;
      return emptyCacheValidUntilMs != null &&
          positionMs < emptyCacheValidUntilMs;
    }

    final loadedRangeStartMs = _loadedRangeStartMs;
    final loadedRangeEndMs = _loadedRangeEndMs;
    if (loadedRangeStartMs == null || loadedRangeEndMs == null) {
      return false;
    }

    final cacheCoverageStartMs = _cacheCoverageStartMs ?? loadedRangeStartMs;
    if (positionMs < cacheCoverageStartMs) {
      return false;
    }

    if (positionMs < loadedRangeStartMs) {
      return true;
    }

    if (positionMs <= loadedRangeEndMs) {
      return true;
    }

    return _nextPlayerMessageTime == null;
  }

  void _mergeFetchedMessages(
    PlayerChatMessagePage page, {
    required bool replaceCachedMessages,
    required int? coverageStartMs,
  }) {
    if (replaceCachedMessages) {
      _nextVisibleMessageIndex = 0;
      _emojiRegistry.clear();
    }

    final mergedMessages = <PlayerChatMessage>[
      if (!replaceCachedMessages) ..._cachedMessages,
      ...page.previousMessages,
      ...page.messages,
    ];
    if (mergedMessages.isEmpty) {
      _cachedMessages.clear();
      _nextVisibleMessageIndex = 0;
      _cacheCoverageStartMs = null;
      _emptyCacheValidUntilMs = page.nextPlayerMessageTime;
      _emptyCacheTerminal = page.nextPlayerMessageTime == null;
      return;
    }

    _emptyCacheValidUntilMs = null;
    _emptyCacheTerminal = false;

    final seenIds = <String>{};
    final dedupedMessages = <PlayerChatMessage>[];
    for (final message in mergedMessages) {
      if (!seenIds.add(message.id)) {
        continue;
      }

      dedupedMessages.add(message);
    }

    dedupedMessages.sort((left, right) {
      final playerTimeCompare = vodChatReplayMessagePositionMs(
        left,
      ).compareTo(vodChatReplayMessagePositionMs(right));
      if (playerTimeCompare != 0) {
        return playerTimeCompare;
      }

      return left.messageTime.compareTo(right.messageTime);
    });

    _cachedMessages
      ..clear()
      ..addAll(_emojiRegistry.resolveMessages(dedupedMessages));
    if (replaceCachedMessages) {
      _cacheCoverageStartMs = coverageStartMs;
    } else if (coverageStartMs != null) {
      _cacheCoverageStartMs = _cacheCoverageStartMs == null
          ? coverageStartMs
          : math.min(_cacheCoverageStartMs!, coverageStartMs);
    }
  }

  int? _resolveFetchedCoverageStartMs(
    PlayerChatMessagePage page, {
    required int? previousVideoChatSize,
  }) {
    if (page.previousMessages.isNotEmpty) {
      return vodChatReplayMessagePositionMs(page.previousMessages.first);
    }

    if (previousVideoChatSize != null) {
      return 0;
    }

    if (page.messages.isNotEmpty) {
      return vodChatReplayMessagePositionMs(page.messages.first);
    }

    return null;
  }

  void _applyCachedPosition(int positionMs, {required bool forceReposition}) {
    _trimRawCacheAroundPosition(positionMs);

    if (_cachedMessages.isEmpty) {
      _clearPendingVisibleMessages();
      _emit(
        state.copyWith(
          phase: VodPlayerChatReplayPhase.ready,
          messages: const <PlayerChatMessage>[],
          message: null,
        ),
      );
      return;
    }

    final dueExclusive = upperBoundVodChatReplayMessagesByPosition(
      _cachedMessages,
      positionMs,
    );
    if (forceReposition) {
      _clearPendingVisibleMessages();
      _nextVisibleMessageIndex = dueExclusive;
      _emit(
        state.copyWith(
          phase: VodPlayerChatReplayPhase.ready,
          messages: trimVodChatReplayVisibleMessages(
            _cachedMessages.sublist(0, dueExclusive),
          ),
          message: null,
        ),
      );
      return;
    }

    if (dueExclusive <= _nextVisibleMessageIndex) {
      return;
    }

    final dueMessages = _cachedMessages.sublist(
      _nextVisibleMessageIndex,
      dueExclusive,
    );
    _nextVisibleMessageIndex = dueExclusive;
    _queueVisibleMessages(dueMessages);
  }

  void _trimRawCacheAroundPosition(int positionMs) {
    if (_cachedMessages.length <= 1) {
      return;
    }

    final earliestRetainedTimeMs = math.max(
      0,
      positionMs - VodPlayerChatReplayController._rawCachePastWindowMs,
    );
    var retainStart = math.min(
      lowerBoundVodChatReplayMessagesByPosition(
        _cachedMessages,
        earliestRetainedTimeMs,
      ),
      _cachedMessages.length - 1,
    );
    var retainEnd = _cachedMessages.length;
    if (retainEnd - retainStart >
        VodPlayerChatReplayController._rawCacheMessageLimit) {
      final dueExclusive = upperBoundVodChatReplayMessagesByPosition(
        _cachedMessages,
        positionMs,
      ).clamp(retainStart, retainEnd).toInt();
      final latestStart =
          retainEnd - VodPlayerChatReplayController._rawCacheMessageLimit;
      retainStart = math.min(
        math.max(
          retainStart,
          dueExclusive -
              VodPlayerChatReplayController._rawCachePastMessageBudget,
        ),
        latestStart,
      );
      retainEnd =
          retainStart + VodPlayerChatReplayController._rawCacheMessageLimit;
    }

    if (retainStart <= 0 && retainEnd >= _cachedMessages.length) {
      return;
    }

    if (retainEnd < _cachedMessages.length) {
      final firstTrimmedFutureMs = vodChatReplayMessagePositionMs(
        _cachedMessages[retainEnd],
      );
      final nextPlayerMessageTime = _nextPlayerMessageTime;
      _nextPlayerMessageTime = nextPlayerMessageTime == null
          ? firstTrimmedFutureMs
          : math.min(nextPlayerMessageTime, firstTrimmedFutureMs);
      _cachedMessages.removeRange(retainEnd, _cachedMessages.length);
    }
    if (retainStart > 0) {
      _cachedMessages.removeRange(0, retainStart);
    }
    _nextVisibleMessageIndex = math.max(
      0,
      math.min(_nextVisibleMessageIndex, retainEnd) - retainStart,
    );
    final cacheCoverageStartMs = _cacheCoverageStartMs;
    if (cacheCoverageStartMs != null && _cachedMessages.isNotEmpty) {
      _cacheCoverageStartMs = math.max(
        cacheCoverageStartMs,
        vodChatReplayMessagePositionMs(_cachedMessages.first),
      );
    }
  }

  void _clearReplayCache({required bool clearEmojiRegistry}) {
    _fetchRevision += 1;
    _isFetching = false;
    _isTailPrefetchInFlight = false;
    _clearPendingVisibleMessages();
    _cachedMessages.clear();
    _pendingSync.clear();
    _nextVisibleMessageIndex = 0;
    _nextPlayerMessageTime = null;
    _cacheCoverageStartMs = null;
    _emptyCacheValidUntilMs = null;
    _emptyCacheTerminal = false;
    _fetchRetryBackoff.clear();
    if (clearEmojiRegistry) {
      _emojiRegistry.clear();
    }
  }

  int? get _loadedRangeStartMs {
    return _cachedMessages.isEmpty
        ? null
        : vodChatReplayMessagePositionMs(_cachedMessages.first);
  }

  int? get _loadedRangeEndMs {
    return _cachedMessages.isEmpty
        ? null
        : vodChatReplayMessagePositionMs(_cachedMessages.last);
  }
}
