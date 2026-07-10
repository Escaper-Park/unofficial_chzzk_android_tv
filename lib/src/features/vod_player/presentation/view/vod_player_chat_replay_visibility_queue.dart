part of 'vod_player_chat_replay_controller.dart';

extension _VodPlayerChatReplayVisibilityQueue on VodPlayerChatReplayController {
  void _queueVisibleMessages(List<PlayerChatMessage> dueMessages) {
    if (dueMessages.isEmpty) {
      return;
    }

    if (!state.isVisible || playerChatAppendInterval <= Duration.zero) {
      _emit(
        state.copyWith(
          phase: VodPlayerChatReplayPhase.ready,
          messages: mergeVodChatReplayVisibleMessages(
            currentMessages: state.messages,
            dueMessages: dueMessages,
          ),
          message: null,
        ),
      );
      return;
    }

    final shouldAppendFirstImmediately =
        state.messages.isEmpty && _pendingVisibleMessages.isEmpty;
    _pendingVisibleMessages.addAll(dueMessages);
    if (shouldAppendFirstImmediately) {
      _appendNextVisibleMessage();
    }
    _scheduleNextVisibleMessage();
  }

  void _scheduleNextVisibleMessage() {
    if (_isDisposed ||
        _isSuspended ||
        !state.isVisible ||
        _pendingVisibleMessages.isEmpty) {
      return;
    }

    final interval = playerChatAppendIntervalForPendingCount(
      _pendingVisibleMessages.length,
    );
    if (_visibleMessageAppendTimer != null) {
      if ((_visibleMessageAppendTimerInterval ?? playerChatAppendInterval) <=
          interval) {
        return;
      }

      _visibleMessageAppendTimer?.cancel();
      _visibleMessageAppendTimer = null;
      _visibleMessageAppendTimerInterval = null;
    }

    _visibleMessageAppendTimerInterval = interval;
    _visibleMessageAppendTimer = Timer(interval, () {
      _visibleMessageAppendTimer = null;
      _visibleMessageAppendTimerInterval = null;
      _appendNextVisibleMessage();
      _scheduleNextVisibleMessage();
    });
  }

  void _appendNextVisibleMessage() {
    if (_isDisposed ||
        _isSuspended ||
        !state.isVisible ||
        _pendingVisibleMessages.isEmpty) {
      return;
    }

    final appendCount = playerChatAppendBatchSizeForPendingCount(
      _pendingVisibleMessages.length,
    );
    final nextMessages = <PlayerChatMessage>[];
    for (
      var index = 0;
      index < appendCount && _pendingVisibleMessages.isNotEmpty;
      index += 1
    ) {
      nextMessages.add(_pendingVisibleMessages.removeFirst());
    }
    _emit(
      state.copyWith(
        phase: VodPlayerChatReplayPhase.ready,
        messages: mergeVodChatReplayVisibleMessages(
          currentMessages: state.messages,
          dueMessages: nextMessages,
        ),
        message: null,
      ),
    );
  }

  void _rollbackPendingVisibleMessages() {
    final firstPendingMessage = _pendingVisibleMessages.isEmpty
        ? null
        : _pendingVisibleMessages.first;
    if (firstPendingMessage != null) {
      final firstPendingIndex = _cachedMessages.indexWhere(
        (message) => message.id == firstPendingMessage.id,
      );
      if (firstPendingIndex >= 0) {
        _nextVisibleMessageIndex = math.min(
          _nextVisibleMessageIndex,
          firstPendingIndex,
        );
      }
    }

    _clearPendingVisibleMessages();
  }

  void _clearPendingVisibleMessages() {
    _visibleMessageAppendTimer?.cancel();
    _visibleMessageAppendTimer = null;
    _visibleMessageAppendTimerInterval = null;
    _pendingVisibleMessages.clear();
  }
}
