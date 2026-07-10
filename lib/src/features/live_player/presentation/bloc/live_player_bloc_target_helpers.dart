part of 'live_player_bloc.dart';

extension _LivePlayerBlocTargetHelpers on LivePlayerBloc {
  Future<void> _loadTarget(
    Emitter<LivePlayerState> emit,
    LivePlayerInitialTarget target, {
    String? slotId,
    bool preserveMetadataWhileLoading = false,
    bool readPersistedPreferences = false,
  }) async {
    final targetSlotId = slotId ?? state.activeSlotId;
    final targetSlot = state.slotById(targetSlotId);
    if (targetSlot == null) {
      return;
    }

    final requestSerial = _nextSlotTargetRequestSerial(targetSlotId);
    _endedStatusChecks.clear(targetSlotId);
    if (targetSlotId == state.activeSlotId) {
      ++_statusRefreshSerial;
    }
    _nextSlotStatusRefreshSerial(targetSlotId);
    final entrySettings = readPersistedPreferences
        ? await _readEntrySettings()
        : _entrySettingsForPreferences(state.settingsPreferences);
    if (!_isSlotTargetRequestCurrent(targetSlotId, requestSerial)) {
      return;
    }

    if (readPersistedPreferences) {
      _persistedSettingsPreferences = entrySettings.preferences;
    }
    final targetChangesLive =
        targetSlot.channelId != target.channelId ||
        targetSlot.liveId != target.liveId;
    final slotVolumeById = targetChangesLive
        ? {
            for (final entry in state.slotVolumeById.entries)
              if (entry.key != targetSlotId) entry.key: entry.value,
          }
        : state.slotVolumeById;
    final loadingSlot = targetSlot.copyWith(
      status: LivePlayerSlotStatus.loadingSource,
      channelId: target.channelId,
      liveId: target.liveId,
      fallbackTitle: target.title,
      fallbackThumbnailImageUrl: target.thumbnailImageUrl,
      detail: preserveMetadataWhileLoading ? targetSlot.detail : null,
      liveStatus: preserveMetadataWhileLoading ? targetSlot.liveStatus : null,
      playbackUri: null,
      availableResolutionIndexes: LivePlaybackResolutionOptions.allIndexes,
      playbackLatencyIndex: null,
      playbackResolutionIndex: null,
      expectedVideoWidth: null,
      expectedVideoHeight: null,
      playbackMetadataResolutionAttempts: 0,
      failureReason: null,
    );
    final currentState = state;
    final loadingState = currentState.copyWith(
      channelMyInfo: targetSlotId == state.activeSlotId
          ? preserveMetadataWhileLoading
                ? state.channelMyInfo
                : null
          : state.channelMyInfo,
      slotVolumeById: slotVolumeById,
      slots: [
        for (final current in state.slots)
          current.slotId == targetSlotId ? loadingSlot : current,
      ],
    );
    emit(
      readPersistedPreferences
          ? loadingState.copyWith(
              settingsPreferences: entrySettings.preferences,
              multiviewLayoutMode: _multiviewLayoutModeForIndex(
                entrySettings.liveSettings.multiviewScreenModeIndex,
              ),
            )
          : loadingState,
    );

    final resolutionIndex = _resolutionIndexForSlot(
      slotId: targetSlotId,
      preferences: entrySettings.preferences,
    );
    final result = await _targetLoader.load(
      target: target,
      settings: LivePlayerTargetLoadSettings._fromEntrySettings(entrySettings),
      resolutionIndex: resolutionIndex,
      isCurrent: () => _isSlotTargetRequestCurrent(
        targetSlotId,
        requestSerial,
      ),
    );
    if (result.isStale) {
      return;
    }

    final currentSlot = state.slotById(targetSlotId);
    if (currentSlot == null) {
      return;
    }

    switch (result.type) {
      case LivePlayerTargetLoadResultType.stale:
        return;
      case LivePlayerTargetLoadResultType.ended:
        _emitEndedSlot(
          emit,
          currentSlot,
          detail: result.detail,
          liveStatus: result.liveStatus,
        );
      case LivePlayerTargetLoadResultType.entryBlocked:
        _emitSlot(
          emit,
          currentSlot.copyWith(
            status: LivePlayerSlotStatus.failure,
            detail: result.detail,
            liveStatus: result.liveStatus,
            playbackUri: null,
            failureReason: LivePlayerFailureReason.entryBlocked,
          ),
        );
      case LivePlayerTargetLoadResultType.playbackSourceMissing:
        _emitSlot(
          emit,
          currentSlot.copyWith(
            status: LivePlayerSlotStatus.failure,
            detail: result.detail,
            failureReason: LivePlayerFailureReason.playbackSourceMissing,
          ),
        );
      case LivePlayerTargetLoadResultType.ready:
        final detail = result.detail!;
        var playbackSource = result.playbackSource!;
        var playbackLatencyIndex = result.playbackLatencyIndex!;
        var playbackResolutionIndex = result.playbackResolutionIndex!;

        while (true) {
          if (!_isSlotTargetRequestCurrent(targetSlotId, requestSerial)) {
            return;
          }
          final desiredPreferences = state.settingsPreferences;
          final desiredLatencyIndex =
              desiredPreferences.liveSettings.latencyIndex;
          final desiredResolutionIndex = _resolutionIndexForSlot(
            slotId: targetSlotId,
            preferences: desiredPreferences,
          );
          if (playbackLatencyIndex == desiredLatencyIndex &&
              playbackResolutionIndex == desiredResolutionIndex) {
            break;
          }

          final correctedSource = await _playbackSourceLoader.resolve(
            livePlaybackJson: detail.livePlaybackJson,
            latencyIndex: desiredLatencyIndex,
            resolutionIndex: desiredResolutionIndex,
          );
          if (!_isSlotTargetRequestCurrent(targetSlotId, requestSerial)) {
            return;
          }
          if (correctedSource == null) {
            final latestSlot = state.slotById(targetSlotId);
            if (latestSlot != null) {
              _emitSlot(
                emit,
                latestSlot.copyWith(
                  status: LivePlayerSlotStatus.failure,
                  playbackUri: null,
                  failureReason: LivePlayerFailureReason.playbackSourceMissing,
                ),
              );
            }
            return;
          }

          playbackSource = correctedSource;
          playbackLatencyIndex = desiredLatencyIndex;
          playbackResolutionIndex = desiredResolutionIndex;
        }

        final latestSlot = state.slotById(targetSlotId);
        if (latestSlot == null) {
          return;
        }
        _emitSlot(
          emit,
          latestSlot.copyWith(
            status: LivePlayerSlotStatus.ready,
            channelId: detail.channel?.channelId ?? target.channelId,
            liveId: detail.liveId,
            fallbackTitle: target.title,
            fallbackThumbnailImageUrl: target.thumbnailImageUrl,
            detail: detail,
            liveStatus: result.liveStatus,
            playbackUri: playbackSource.playbackUri,
            availableResolutionIndexes:
                playbackSource.availableResolutionIndexes,
            playbackLatencyIndex: playbackLatencyIndex,
            playbackResolutionIndex: playbackResolutionIndex,
            expectedVideoWidth: playbackSource.expectedVideoWidth,
            expectedVideoHeight: playbackSource.expectedVideoHeight,
            playbackMetadataResolutionAttempts: 1,
            videoViewType:
                state.settingsPreferences.generalSetting.videoViewType,
            failureReason: null,
          ),
        );
        _rememberRecentLive(detail, fallbackChannelId: target.channelId);
      case LivePlayerTargetLoadResultType.loadFailed:
        _emitSlot(
          emit,
          currentSlot.copyWith(
            status: LivePlayerSlotStatus.failure,
            failureReason: LivePlayerFailureReason.liveDetailLoadFailed,
          ),
        );
    }
  }
}
