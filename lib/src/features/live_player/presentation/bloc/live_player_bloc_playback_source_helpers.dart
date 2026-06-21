part of 'live_player_bloc.dart';

extension _LivePlayerBlocPlaybackSourceHelpers on LivePlayerBloc {
  Future<void> _onSlotResolutionSelected(
    _SlotResolutionSelected event,
    Emitter<LivePlayerState> emit,
  ) async {
    if (!state.isMultiview) {
      return;
    }

    final slot = state.slotById(event.slotId);
    if (slot == null) {
      return;
    }

    await _refreshSlotPlaybackSource(
      emit,
      slot: slot,
      preferences: state.settingsPreferences,
      resolutionIndex: event.resolutionIndex,
    );
  }

  Future<void> _refreshActivePlaybackSource(
    Emitter<LivePlayerState> emit,
    SettingsPreferences preferences,
  ) async {
    final slot = state.activeSlot;
    await _refreshSlotPlaybackSource(
      emit,
      slot: slot,
      preferences: preferences,
      resolutionIndex: preferences.liveSettings.resolutionIndex,
    );
  }

  Future<void> _refreshMultiviewPlaybackSources(
    Emitter<LivePlayerState> emit,
    SettingsPreferences preferences,
  ) async {
    final slots = state.slots.toList();
    for (final slot in slots) {
      await _refreshSlotPlaybackSource(
        emit,
        slot: slot,
        preferences: preferences,
        resolutionIndex: _resolutionIndexForSlot(
          slotId: slot.slotId,
          preferences: preferences,
        ),
      );
    }
  }

  Future<void> _refreshSlotPlaybackSource(
    Emitter<LivePlayerState> emit, {
    required LivePlayerSlotState slot,
    required SettingsPreferences preferences,
    required int resolutionIndex,
  }) async {
    final currentSlot = state.slotById(slot.slotId);
    if (currentSlot == null ||
        currentSlot.status != LivePlayerSlotStatus.ready &&
            currentSlot.status != LivePlayerSlotStatus.playing) {
      return;
    }

    final detail = currentSlot.detail;
    if (detail == null) {
      return;
    }

    final latencyIndex = preferences.liveSettings.latencyIndex;
    final videoViewType = preferences.generalSetting.videoViewType;
    final playbackSourceUnchanged =
        currentSlot.playbackLatencyIndex == latencyIndex &&
        currentSlot.playbackResolutionIndex == resolutionIndex;
    if (playbackSourceUnchanged) {
      if (currentSlot.videoViewType != videoViewType) {
        _emitSlot(
          emit,
          currentSlot.copyWith(videoViewType: videoViewType),
        );
      }
      return;
    }

    final requestSerial = _nextSlotTargetRequestSerial(slot.slotId);
    final playbackSource = await _playbackSourceLoader.resolve(
      livePlaybackJson: detail.livePlaybackJson,
      latencyIndex: latencyIndex,
      resolutionIndex: resolutionIndex,
    );
    if (!_isSlotTargetRequestCurrent(slot.slotId, requestSerial) ||
        playbackSource == null) {
      return;
    }

    final latestSlot = state.slotById(slot.slotId);
    if (latestSlot == null || latestSlot.detail?.liveId != detail.liveId) {
      return;
    }

    final playbackUriChanged =
        latestSlot.playbackUri != playbackSource.playbackUri;
    _emitSlot(
      emit,
      latestSlot.copyWith(
        status: playbackUriChanged
            ? LivePlayerSlotStatus.ready
            : latestSlot.status,
        playbackUri: playbackSource.playbackUri,
        availableResolutionIndexes: playbackSource.availableResolutionIndexes,
        playbackLatencyIndex: latencyIndex,
        playbackResolutionIndex: resolutionIndex,
        videoViewType: videoViewType,
        failureReason: null,
      ),
    );
  }
}
