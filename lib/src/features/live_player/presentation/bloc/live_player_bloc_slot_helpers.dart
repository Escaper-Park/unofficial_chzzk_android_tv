part of 'live_player_bloc.dart';

extension _LivePlayerBlocSlotHelpers on LivePlayerBloc {
  void _emitActiveSlot(
    Emitter<LivePlayerState> emit,
    LivePlayerSlotState slot,
  ) {
    _emitSlot(emit, slot.copyWith(slotId: state.activeSlotId));
  }

  bool _emitActiveSlotSelection(
    Emitter<LivePlayerState> emit,
    String slotId, {
    bool clearPendingReplacement = false,
  }) {
    final slot = state.slotById(slotId);
    if (slot == null || state.activeSlotId == slotId) {
      return false;
    }

    emit(
      state.copyWith(
        activeSlotId: slotId,
        audibleSlotIds: _audibleSlotIdsForActiveSelection(slotId),
        activeSlotHighlightSerial: state.isMultiview
            ? state.activeSlotHighlightSerial + 1
            : state.activeSlotHighlightSerial,
        pendingReplacementLive: clearPendingReplacement
            ? null
            : state.pendingReplacementLive,
        channelMyInfo: state.channelMyInfo?.channelId == slot.channelId
            ? state.channelMyInfo
            : null,
      ),
    );
    return true;
  }

  Set<String> _audibleSlotIdsForActiveSelection(String slotId) {
    if (!state.isMultiview) {
      return state.audibleSlotIds;
    }

    final audibleSlotIds = state.effectiveAudibleSlotIds;
    if (audibleSlotIds.length >= 2) {
      return audibleSlotIds;
    }

    if (audibleSlotIds.isEmpty) {
      return const <String>{};
    }

    return {slotId};
  }

  Future<bool> _selectExistingLiveSlot(
    Emitter<LivePlayerState> emit,
    Live live, {
    bool clearPendingReplacement = false,
  }) async {
    final slot = _slotForLive(live);
    if (slot == null) {
      return false;
    }

    if (!state.isMultiview || state.activeSlotId == slot.slotId) {
      if (clearPendingReplacement && state.pendingReplacementLive != null) {
        emit(state.copyWith(pendingReplacementLive: null));
      }
      return true;
    }

    final changed = _emitActiveSlotSelection(
      emit,
      slot.slotId,
      clearPendingReplacement: clearPendingReplacement,
    );
    if (changed) {
      await _refreshPipRolePlaybackSources(emit);
    }
    return true;
  }

  LivePlayerSlotState? _slotForLive(Live live) {
    for (final slot in state.slots) {
      if (_slotMatchesLive(slot, live)) {
        return slot;
      }
    }

    return null;
  }

  bool _slotMatchesLive(LivePlayerSlotState slot, Live live) {
    final slotChannelId = slot.channelId;
    final liveChannelId = live.channel?.channelId;
    if (slotChannelId != null && liveChannelId != null) {
      return slotChannelId == liveChannelId;
    }

    final slotLiveId = slot.liveId;
    return slotLiveId != null && slotLiveId == live.liveId;
  }

  void _emitSlot(
    Emitter<LivePlayerState> emit,
    LivePlayerSlotState slot,
  ) {
    emit(
      state.copyWith(
        slots: [
          for (final current in state.slots)
            current.slotId == slot.slotId ? slot : current,
        ],
      ),
    );
  }

  void _emitEndedSlot(
    Emitter<LivePlayerState> emit,
    LivePlayerSlotState slot, {
    LiveDetail? detail,
    LiveStatus? liveStatus,
  }) {
    _endedStatusChecks.clear(slot.slotId);
    _emitSlot(
      emit,
      slot.copyWith(
        status: LivePlayerSlotStatus.ended,
        detail: detail ?? slot.detail,
        liveStatus: liveStatus ?? slot.liveStatus,
        playbackUri: null,
        failureReason: null,
      ),
    );
  }

  Future<bool> _handleEndedStatusCheck(
    Emitter<LivePlayerState> emit, {
    required LivePlayerSlotState slot,
    LiveStatus? liveStatus,
  }) async {
    final result = _endedStatusChecks.evaluate(
      slotId: slot.slotId,
      playbackUri: slot.playbackUri,
      liveStatus: liveStatus,
    );

    switch (result.action) {
      case LivePlayerEndedStatusCheckAction.none:
        return false;
      case LivePlayerEndedStatusCheckAction.markEnded:
        _emitEndedSlot(emit, slot, liveStatus: result.liveStatus);
        return true;
      case LivePlayerEndedStatusCheckAction.reloadTarget:
        final channelId = slot.channelId;
        if (channelId == null) {
          return true;
        }

        await _loadTarget(
          emit,
          LivePlayerInitialTarget(
            channelId: channelId,
            liveId: slot.liveId,
            title: slot.fallbackTitle,
            thumbnailImageUrl: slot.fallbackThumbnailImageUrl,
          ),
          slotId: slot.slotId,
        );
        return true;
      case LivePlayerEndedStatusCheckAction.keepWaiting:
        final liveStatus = result.liveStatus;
        if (liveStatus != null) {
          _emitSlot(emit, slot.copyWith(liveStatus: liveStatus));
        }
        return true;
    }
  }

  LivePlayerSlotState _slotAsPrimary(LivePlayerSlotState slot) {
    return slot.copyWith(slotId: _primarySlotId);
  }

  void _emitFeedback(
    Emitter<LivePlayerState> emit,
    LivePlayerFeedbackType feedbackType,
  ) {
    emit(
      state.copyWith(
        feedbackType: feedbackType,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _onFeedbackCleared(
    _FeedbackCleared event,
    Emitter<LivePlayerState> emit,
  ) {
    if (state.feedbackSerial != event.serial) {
      return;
    }

    emit(state.copyWith(feedbackType: null));
  }

  bool _isActiveSlotChannel(String slotId, String channelId) {
    final currentSlot = state.slotById(slotId);
    return currentSlot != null && currentSlot.channelId == channelId;
  }
}
