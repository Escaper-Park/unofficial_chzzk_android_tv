part of 'live_player_bloc.dart';

extension _LivePlayerBlocTargetHelpers on LivePlayerBloc {
  Future<void> _loadTarget(
    Emitter<LivePlayerState> emit,
    LivePlayerInitialTarget target, {
    String? slotId,
    bool preserveMetadataWhileLoading = false,
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
    final entrySettings = await _readEntrySettings();
    if (!_isSlotTargetRequestCurrent(targetSlotId, requestSerial)) {
      return;
    }

    _persistedSettingsPreferences = entrySettings.preferences;
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
      failureReason: null,
    );
    emit(
      state.copyWith(
        settingsPreferences: entrySettings.preferences,
        multiviewLayoutMode: _multiviewLayoutModeForIndex(
          entrySettings.liveSettings.multiviewScreenModeIndex,
        ),
        channelMyInfo: targetSlotId == state.activeSlotId
            ? preserveMetadataWhileLoading
                  ? state.channelMyInfo
                  : null
            : state.channelMyInfo,
        slots: [
          for (final current in state.slots)
            current.slotId == targetSlotId ? loadingSlot : current,
        ],
      ),
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
        final playbackSource = result.playbackSource!;
        _emitSlot(
          emit,
          currentSlot.copyWith(
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
            playbackLatencyIndex: result.playbackLatencyIndex,
            playbackResolutionIndex: result.playbackResolutionIndex,
            videoViewType: result.videoViewType!,
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
