part of 'live_player_bloc.dart';

extension _LivePlayerBlocBrowseSelectionHelpers on LivePlayerBloc {
  Future<void> _onBrowseLiveSelected(
    _BrowseLiveSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.isMultiview) {
      _beginMultiviewPlaybackTransition();
    }
    if (state.isMultiview && _slotForLive(event.live) != null) {
      _emitFeedback(emit, LivePlayerFeedbackType.multiviewLiveAlreadyAdded);
      return;
    }

    if (await _selectExistingLiveSlot(emit, event.live)) {
      return;
    }

    final channelId = event.live.channel?.channelId;
    if (channelId == null) {
      return;
    }

    final target = LivePlayerInitialTarget(
      channelId: channelId,
      liveId: event.live.liveId,
      title: event.live.title,
      thumbnailImageUrl:
          event.live.thumbnailImageUrl ?? event.live.defaultThumbnailImageUrl,
    );

    if (state.isMultiview) {
      if (!state.canAddMultiviewSlot) {
        emit(state.copyWith(pendingReplacementLive: event.live));
        return;
      }

      final slotId = _nextGeneratedSlotId();
      emit(
        state.copyWith(
          slots: [
            ...state.slots,
            LivePlayerSlotState(slotId: slotId),
          ],
          audibleSlotIds: state.effectiveAudibleSlotIds,
        ),
      );
      await _loadTarget(emit, target, slotId: slotId);
      return;
    }

    await _loadTarget(emit, target);
  }

  void _onBrowseReplacementClosed(
    _BrowseReplacementClosed event,
    Emitter<LivePlayerState> emit,
  ) {
    emit(state.copyWith(pendingReplacementLive: null));
  }

  Future<void> _onBrowseReplacementSlotSelected(
    _BrowseReplacementSlotSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.isMultiview) {
      _beginMultiviewPlaybackTransition();
    }
    final live = state.pendingReplacementLive;
    final channelId = live?.channel?.channelId;
    if (live == null ||
        channelId == null ||
        !state.isMultiview ||
        state.slotById(event.slotId) == null) {
      return;
    }
    if (await _selectExistingLiveSlot(
      emit,
      live,
      clearPendingReplacement: true,
    )) {
      return;
    }

    final target = LivePlayerInitialTarget(
      channelId: channelId,
      liveId: live.liveId,
      title: live.title,
      thumbnailImageUrl:
          live.thumbnailImageUrl ?? live.defaultThumbnailImageUrl,
    );
    final replacingActiveSlot = state.activeSlotId == event.slotId;
    emit(
      state.copyWith(
        audibleSlotIds: replacingActiveSlot
            ? {event.slotId}
            : state.audibleSlotIds,
        activeSlotHighlightSerial: replacingActiveSlot
            ? state.activeSlotHighlightSerial + 1
            : state.activeSlotHighlightSerial,
        channelMyInfo: replacingActiveSlot ? null : state.channelMyInfo,
        pendingReplacementLive: null,
      ),
    );
    await _loadTarget(emit, target, slotId: event.slotId);
  }
}
