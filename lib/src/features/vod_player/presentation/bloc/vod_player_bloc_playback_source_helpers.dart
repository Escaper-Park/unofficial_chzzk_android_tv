part of 'vod_player_bloc.dart';

extension _VodPlayerBlocPlaybackSourceHelpers on VodPlayerBloc {
  Future<void> _refreshActivePlaybackSource(
    Emitter<VodPlayerState> emit,
    SettingsPreferences preferences,
  ) async {
    final slot = state.activeSlot;
    if (slot.status != VodPlayerSlotStatus.ready &&
        slot.status != VodPlayerSlotStatus.playing) {
      return;
    }

    final detail = slot.detail;
    if (detail == null) {
      return;
    }

    final requestSerial = ++_targetRequestSerial;
    final previousStatus = slot.status;
    final previousPlaybackUri = slot.playbackUri;
    final previousPlaybackCache = slot.playbackCache;
    final previousSeekThumbnail = slot.seekThumbnail;
    final previousResolutionIndexes = slot.availableResolutionIndexes;
    final refreshStartPosition = slot.position;
    _emitSlot(
      emit,
      slot.copyWith(
        status: VodPlayerSlotStatus.ready,
        playbackUri: null,
        startPosition: refreshStartPosition,
      ),
    );

    void restorePreviousStatus() {
      final currentSlot = state.slotById(slot.slotId);
      if (requestSerial != _targetRequestSerial ||
          currentSlot == null ||
          currentSlot.detail?.videoNo != detail.videoNo ||
          currentSlot.status != VodPlayerSlotStatus.ready) {
        return;
      }

      _emitSlot(
        emit,
        currentSlot.copyWith(
          status: previousStatus,
          playbackUri: previousPlaybackUri,
          playbackCache: previousPlaybackCache,
          seekThumbnail: previousSeekThumbnail,
          availableResolutionIndexes: previousResolutionIndexes,
          startPosition: currentSlot.position,
        ),
      );
    }

    try {
      final videoId = _nonBlank(slot.videoId) ?? _nonBlank(detail.videoId);
      final inKey = _nonBlank(detail.inKey);
      final blockReason = await _vodDetailBlockReason(
        detail,
        fallbackVideoId: slot.videoId,
        fallbackChannelId: slot.fallbackChannelId,
      );
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      if (blockReason != null) {
        final currentSlot = state.slotById(slot.slotId);
        if (currentSlot != null &&
            currentSlot.detail?.videoNo == detail.videoNo) {
          final playbackCache = currentSlot.playbackCache;
          _emitSlot(
            emit,
            currentSlot.copyWith(
              status: VodPlayerSlotStatus.failure,
              playbackUri: null,
              playbackCache: null,
              seekThumbnail: null,
              failureReason: _vodEntryFailureReason(blockReason),
            ),
          );
          unawaited(_deletePlaybackCache(playbackCache));
        }
        return;
      }

      final playback = videoId == null || inKey == null
          ? null
          : await _vodRepository.getPlayback(videoId: videoId, key: inKey);
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      final masterPlaylistUri =
          _absoluteUri(playback?.masterPlaylistUrl) ??
          vodLiveRewindMasterPlaylistUri(detail.liveRewindPlaybackJson);
      final seekThumbnail =
          playback?.seekThumbnail ??
          vodLiveRewindSeekThumbnail(
            rawJson: detail.liveRewindPlaybackJson,
            liveOpenDate: detail.liveOpenDate,
          );
      if (masterPlaylistUri == null) {
        restorePreviousStatus();
        return;
      }

      final sourceStartPosition =
          state.slotById(slot.slotId)?.position ?? slot.position;
      final playbackSource = await resolveVodPlaybackSource(
        masterPlaylistUri: masterPlaylistUri,
        resolutionIndex: preferences.vodSettings.resolutionIndex,
        startPositionSeconds: sourceStartPosition.inSeconds,
        loadPlaylistText: loadVodPlaybackPlaylistText,
      );
      if (requestSerial != _targetRequestSerial) {
        await _deletePlaybackCache(playbackSource.cache);
        return;
      }

      final currentSlot = state.slotById(slot.slotId);
      if (currentSlot == null ||
          currentSlot.detail?.videoNo != detail.videoNo) {
        await _deletePlaybackCache(playbackSource.cache);
        return;
      }

      final startPosition = currentSlot.position;
      _emitSlot(
        emit,
        currentSlot.copyWith(
          status: VodPlayerSlotStatus.ready,
          playbackUri: playbackSource.playbackUri,
          playbackCache: playbackSource.cache,
          seekThumbnail: seekThumbnail,
          availableResolutionIndexes: playbackSource.availableResolutionIndexes,
          startPosition: startPosition,
          failureReason: null,
        ),
      );
      if (previousPlaybackCache != playbackSource.cache) {
        unawaited(_deletePlaybackCache(previousPlaybackCache));
      }
    } on Object {
      // Keep the current playback source when transient resolution switching
      // fails.
      restorePreviousStatus();
    }
  }
}
