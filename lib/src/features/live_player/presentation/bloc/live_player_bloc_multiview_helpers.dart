part of 'live_player_bloc.dart';

extension _LivePlayerBlocMultiviewHelpers on LivePlayerBloc {
  Future<void> _onViewModeSelected(
    _ViewModeSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (event.viewMode == LivePlayerViewMode.multiview) {
      final enteringMultiview = !state.isMultiview;
      final primarySlot = enteringMultiview
          ? _slotAsPrimary(state.activeSlot)
          : state.activeSlot;
      emit(
        state.copyWith(
          viewMode: event.viewMode,
          overlayMode: LivePlayerOverlayMode.none,
          activeSlotId: enteringMultiview ? _primarySlotId : state.activeSlotId,
          primarySlotId: enteringMultiview
              ? _primarySlotId
              : state.primarySlotId,
          slots: enteringMultiview ? [primarySlot] : state.slots,
          audibleSlotIds: {
            enteringMultiview ? _primarySlotId : state.activeSlotId,
          },
          pendingReplacementLive: null,
        ),
      );
      if (enteringMultiview) {
        _retainSlotSerials({_primarySlotId});
      }
      await _refreshMultiviewPlaybackSources(emit, state.settingsPreferences);
      return;
    }

    final primarySlot = _slotAsPrimary(state.activeSlot);
    emit(
      state.copyWith(
        viewMode: event.viewMode,
        overlayMode: LivePlayerOverlayMode.none,
        activeSlotId: _primarySlotId,
        primarySlotId: _primarySlotId,
        slots: [primarySlot],
        audibleSlotIds: const <String>{},
        pendingReplacementLive: null,
      ),
    );
    _retainSlotSerials({_primarySlotId});
    await _refreshActivePlaybackSource(emit, state.settingsPreferences);
  }

  Future<void> _onMultiviewLayoutModeSelected(
    _MultiviewLayoutModeSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    final preferences = state.settingsPreferences.copyWith(
      liveSettings: state.settingsPreferences.liveSettings.copyWith(
        multiviewScreenModeIndex: _indexForMultiviewLayoutMode(
          event.layoutMode,
        ),
      ),
    );
    emit(
      state.copyWith(
        multiviewLayoutMode: event.layoutMode,
        settingsPreferences: preferences,
      ),
    );
    await _savePersistentPreferences(preferences);
  }

  Future<void> _onActiveSlotShiftRequested(
    _ActiveSlotShiftRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (!state.isMultiview || state.slots.length < 2 || event.delta == 0) {
      return;
    }

    final nextIndex = _wrappedIndex(
      state.activeSlotIndex + event.delta,
      state.slots.length,
    );
    _emitActiveSlotSelection(
      emit,
      state.slots[nextIndex].slotId,
    );
  }

  Future<void> _onActiveSlotSelected(
    _ActiveSlotSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (state.slotById(event.slotId) == null) {
      return;
    }

    _emitActiveSlotSelection(emit, event.slotId);
  }

  void _onSlotAudioToggled(
    _SlotAudioToggled event,
    Emitter<LivePlayerState> emit,
  ) {
    if (!state.isMultiview || state.slotById(event.slotId) == null) {
      return;
    }

    final audibleSlotIds = {...state.effectiveAudibleSlotIds};
    if (!audibleSlotIds.add(event.slotId)) {
      audibleSlotIds.remove(event.slotId);
    }

    emit(state.copyWith(audibleSlotIds: audibleSlotIds));
  }

  Future<void> _onSlotCloseConfirmed(
    _SlotCloseConfirmed event,
    Emitter<LivePlayerState> emit,
  ) async {
    final closingIndex = state.slots.indexWhere(
      (slot) => slot.slotId == event.slotId,
    );
    if (closingIndex == -1 || state.slots.length <= 1) {
      return;
    }

    _slotTargetRequestSerials.remove(event.slotId);
    _slotStatusRefreshSerials.remove(event.slotId);
    _slotStatusRefreshesInFlight.remove(event.slotId);
    _endedStatusChecks.clear(event.slotId);

    final remainingSlots = [
      for (final slot in state.slots)
        if (slot.slotId != event.slotId) slot,
    ];
    final activeSlotRemoved = state.activeSlotId == event.slotId;
    final nextActiveSlotId = activeSlotRemoved
        ? remainingSlots[closingIndex >= remainingSlots.length
                  ? remainingSlots.length - 1
                  : closingIndex]
              .slotId
        : state.activeSlotId;
    final nextPrimarySlotId =
        remainingSlots.any(
          (slot) => slot.slotId == state.primarySlotId,
        )
        ? state.primarySlotId
        : remainingSlots.first.slotId;
    final nextActiveSlot = remainingSlots.firstWhere(
      (slot) => slot.slotId == nextActiveSlotId,
    );

    emit(
      state.copyWith(
        activeSlotId: nextActiveSlotId,
        primarySlotId: nextPrimarySlotId,
        slots: remainingSlots,
        audibleSlotIds: state.isMultiview
            ? {nextActiveSlotId}
            : state.audibleSlotIds
                  .where((slotId) => slotId != event.slotId)
                  .toSet(),
        activeSlotHighlightSerial: activeSlotRemoved && state.isMultiview
            ? state.activeSlotHighlightSerial + 1
            : state.activeSlotHighlightSerial,
        channelMyInfo:
            state.channelMyInfo?.channelId == nextActiveSlot.channelId
            ? state.channelMyInfo
            : null,
      ),
    );
  }
}

LivePlayerMultiviewLayoutMode _multiviewLayoutModeForIndex(int index) {
  return switch (index) {
    1 => LivePlayerMultiviewLayoutMode.pip,
    2 => LivePlayerMultiviewLayoutMode.focus,
    _ => LivePlayerMultiviewLayoutMode.pbp,
  };
}

int _indexForMultiviewLayoutMode(LivePlayerMultiviewLayoutMode mode) {
  return switch (mode) {
    LivePlayerMultiviewLayoutMode.pbp => 0,
    LivePlayerMultiviewLayoutMode.pip => 1,
    LivePlayerMultiviewLayoutMode.focus => 2,
  };
}
