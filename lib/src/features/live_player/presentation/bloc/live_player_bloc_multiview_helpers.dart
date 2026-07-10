part of 'live_player_bloc.dart';

extension _LivePlayerBlocMultiviewHelpers on LivePlayerBloc {
  Future<void> _onViewModeSelected(
    _ViewModeSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    final before = state;
    final transitionSerial = _beginMultiviewPlaybackTransition();
    if (event.viewMode == LivePlayerViewMode.multiview) {
      if (before.isMultiview) {
        emit(
          before.copyWith(
            overlayMode: LivePlayerOverlayMode.none,
            audibleSlotIds: {before.activeSlotId},
            slotVolumeById: const <String, double>{},
            pendingReplacementLive: null,
          ),
        );
        return;
      }

      final primarySlot = _slotAsPrimary(before.activeSlot);
      final projectedState = before.copyWith(
        viewMode: event.viewMode,
        overlayMode: LivePlayerOverlayMode.none,
        activeSlotId: _primarySlotId,
        primarySlotId: _primarySlotId,
        slots: [primarySlot],
        audibleSlotIds: const {_primarySlotId},
        slotVolumeById: const <String, double>{},
        pendingReplacementLive: null,
      );
      final updates = await _resolveMultiviewPlaybackSourceBatch(
        projectedState: projectedState,
        preferences: before.settingsPreferences,
      );
      if (updates == null ||
          emit.isDone ||
          !_multiviewPlaybackTransitionStillCurrent(
            before,
            transitionSerial,
          )) {
        return;
      }

      emit(
        state.copyWith(
          viewMode: LivePlayerViewMode.multiview,
          overlayMode: LivePlayerOverlayMode.none,
          activeSlotId: _primarySlotId,
          primarySlotId: _primarySlotId,
          slots: _applyPlaybackSourceBatch([primarySlot], updates),
          audibleSlotIds: const {_primarySlotId},
          slotVolumeById: const <String, double>{},
          pendingReplacementLive: null,
        ),
      );
      _retainSlotSerials({_primarySlotId});
      return;
    }

    if (!before.isMultiview) {
      emit(
        before.copyWith(
          overlayMode: LivePlayerOverlayMode.none,
          audibleSlotIds: const <String>{},
          slotVolumeById: const <String, double>{},
          pendingReplacementLive: null,
        ),
      );
      return;
    }

    final activeSlot = before.activeSlot;
    final sourceProjectedState = before.copyWith(
      viewMode: LivePlayerViewMode.single,
      activeSlotId: activeSlot.slotId,
      primarySlotId: activeSlot.slotId,
      slots: [activeSlot],
    );
    final updates = await _resolveMultiviewPlaybackSourceBatch(
      projectedState: sourceProjectedState,
      preferences: before.settingsPreferences,
    );
    if (updates == null ||
        emit.isDone ||
        !_multiviewPlaybackTransitionStillCurrent(
          before,
          transitionSerial,
        )) {
      return;
    }

    final latestActiveSlot = state.slotById(activeSlot.slotId);
    if (latestActiveSlot == null) {
      return;
    }
    final resolvedActiveSlot = updates[activeSlot.slotId] ?? latestActiveSlot;
    final primarySlot = _slotAsPrimary(resolvedActiveSlot);
    emit(
      state.copyWith(
        viewMode: LivePlayerViewMode.single,
        overlayMode: LivePlayerOverlayMode.none,
        activeSlotId: _primarySlotId,
        primarySlotId: _primarySlotId,
        slots: [primarySlot],
        audibleSlotIds: const <String>{},
        slotVolumeById: const <String, double>{},
        pendingReplacementLive: null,
      ),
    );
    _retainSlotSerials({_primarySlotId});
  }

  Future<void> _onMultiviewLayoutModeSelected(
    _MultiviewLayoutModeSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    final before = state;
    final transitionSerial = _beginMultiviewPlaybackTransition();
    final preferences = before.settingsPreferences.copyWith(
      liveSettings: before.settingsPreferences.liveSettings.copyWith(
        multiviewScreenModeIndex: _indexForMultiviewLayoutMode(
          event.layoutMode,
        ),
      ),
    );
    if (before.isMultiview &&
        before.multiviewLayoutMode != LivePlayerMultiviewLayoutMode.pip &&
        event.layoutMode == LivePlayerMultiviewLayoutMode.pip) {
      final projectedState = before.copyWith(
        multiviewLayoutMode: event.layoutMode,
        settingsPreferences: preferences,
      );
      final updates = await _resolveMultiviewPlaybackSourceBatch(
        projectedState: projectedState,
        preferences: preferences,
      );
      if (updates == null ||
          emit.isDone ||
          !_multiviewPlaybackTransitionStillCurrent(
            before,
            transitionSerial,
          )) {
        return;
      }

      final latest = state;
      final committedPreferences = latest.settingsPreferences.copyWith(
        liveSettings: latest.settingsPreferences.liveSettings.copyWith(
          multiviewScreenModeIndex: _indexForMultiviewLayoutMode(
            event.layoutMode,
          ),
        ),
      );
      emit(
        latest.copyWith(
          multiviewLayoutMode: event.layoutMode,
          settingsPreferences: committedPreferences,
          slots: _applyPlaybackSourceBatch(latest.slots, updates),
        ),
      );
      await _savePersistentPreferences(committedPreferences);
      return;
    }

    emit(
      before.copyWith(
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
    await _selectActiveSlotWithPlaybackTransition(
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

    await _selectActiveSlotWithPlaybackTransition(emit, event.slotId);
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

  void _onSlotVolumeChanged(
    _SlotVolumeChanged event,
    Emitter<LivePlayerState> emit,
  ) {
    if (!state.isMultiview || state.slotById(event.slotId) == null) {
      return;
    }

    final volume = event.volume.isFinite
        ? event.volume.clamp(0, 1).toDouble()
        : 1.0;
    emit(
      state.copyWith(
        slotVolumeById: {
          ...state.slotVolumeById,
          event.slotId: volume,
        },
      ),
    );
  }

  Future<void> _onSlotCloseConfirmed(
    _SlotCloseConfirmed event,
    Emitter<LivePlayerState> emit,
  ) async {
    final before = state;
    final projectedState = _stateAfterSlotClose(before, event.slotId);
    if (projectedState == null) {
      return;
    }
    final transitionSerial = _beginMultiviewPlaybackTransition();

    var updates = const <String, LivePlayerSlotState>{};
    final activeSlotRemoved = before.activeSlotId == event.slotId;
    if (activeSlotRemoved && _usesPipRoleResolutionInState(projectedState)) {
      final resolvedUpdates = await _resolveMultiviewPlaybackSourceBatch(
        projectedState: projectedState,
        preferences: before.settingsPreferences,
      );
      if (resolvedUpdates == null ||
          emit.isDone ||
          !_multiviewPlaybackTransitionStillCurrent(
            before,
            transitionSerial,
          )) {
        return;
      }
      updates = resolvedUpdates;
    }

    final latestProjectedState = _stateAfterSlotClose(state, event.slotId);
    if (latestProjectedState == null) {
      return;
    }

    _slotTargetRequestSerials.remove(event.slotId);
    _slotStatusRefreshSerials.remove(event.slotId);
    _slotStatusRefreshesInFlight.remove(event.slotId);
    _endedStatusChecks.clear(event.slotId);
    emit(
      latestProjectedState.copyWith(
        slots: _applyPlaybackSourceBatch(
          latestProjectedState.slots,
          updates,
        ),
      ),
    );
  }

  LivePlayerState? _stateAfterSlotClose(
    LivePlayerState sourceState,
    String closingSlotId,
  ) {
    final closingIndex = sourceState.slots.indexWhere(
      (slot) => slot.slotId == closingSlotId,
    );
    if (closingIndex == -1 || sourceState.slots.length <= 1) {
      return null;
    }

    final remainingSlots = [
      for (final slot in sourceState.slots)
        if (slot.slotId != closingSlotId) slot,
    ];
    final activeSlotRemoved = sourceState.activeSlotId == closingSlotId;
    final nextActiveSlotId = activeSlotRemoved
        ? remainingSlots[closingIndex >= remainingSlots.length
                  ? remainingSlots.length - 1
                  : closingIndex]
              .slotId
        : sourceState.activeSlotId;
    final nextPrimarySlotId =
        remainingSlots.any(
          (slot) => slot.slotId == sourceState.primarySlotId,
        )
        ? sourceState.primarySlotId
        : remainingSlots.first.slotId;
    final nextActiveSlot = remainingSlots.firstWhere(
      (slot) => slot.slotId == nextActiveSlotId,
    );
    final remainingSlotIds = {
      for (final slot in remainingSlots) slot.slotId,
    };
    final remainingAudibleSlotIds = sourceState.audibleSlotIds
        .where(remainingSlotIds.contains)
        .toSet();
    final remainingVolumes = {
      for (final entry in sourceState.slotVolumeById.entries)
        if (remainingSlotIds.contains(entry.key)) entry.key: entry.value,
    };

    return sourceState.copyWith(
      activeSlotId: nextActiveSlotId,
      primarySlotId: nextPrimarySlotId,
      slots: remainingSlots,
      audibleSlotIds: sourceState.isMultiview
          ? remainingAudibleSlotIds.length >= 2
                ? remainingAudibleSlotIds
                : sourceState.audibleSlotIds.isEmpty
                ? const <String>{}
                : {nextActiveSlotId}
          : sourceState.audibleSlotIds
                .where((slotId) => slotId != closingSlotId)
                .toSet(),
      slotVolumeById: remainingVolumes,
      activeSlotHighlightSerial: activeSlotRemoved && sourceState.isMultiview
          ? sourceState.activeSlotHighlightSerial + 1
          : sourceState.activeSlotHighlightSerial,
      channelMyInfo:
          sourceState.channelMyInfo?.channelId == nextActiveSlot.channelId
          ? sourceState.channelMyInfo
          : null,
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
