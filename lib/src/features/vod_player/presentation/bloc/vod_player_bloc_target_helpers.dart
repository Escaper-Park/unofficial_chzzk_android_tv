part of 'vod_player_bloc.dart';

extension _VodPlayerBlocTargetHelpers on VodPlayerBloc {
  Future<void> _loadTarget(
    Emitter<VodPlayerState> emit,
    VodPlayerInitialTarget target,
  ) async {
    final requestSerial = ++_targetRequestSerial;
    final previousPlaybackCache = state.activeSlot.playbackCache;
    final startPosition = Duration(
      seconds: target.startPositionSeconds < 0
          ? 0
          : target.startPositionSeconds,
    );
    _emitActiveSlot(
      emit,
      state.activeSlot.copyWith(
        status: VodPlayerSlotStatus.loadingSource,
        videoNo: target.videoNo,
        videoId: target.videoId,
        fallbackTitle: target.title,
        fallbackThumbnailImageUrl: target.thumbnailImageUrl,
        fallbackChannelId: target.channelId,
        fallbackChannelName: target.channelName,
        fallbackChannelVerified: target.channelVerified,
        detail: null,
        playbackUri: null,
        playbackCache: null,
        seekThumbnail: null,
        availableResolutionIndexes: const [
          VodPlaybackResolutionOptions.autoIndex,
        ],
        channelMyInfo: null,
        position: startPosition,
        startPosition: startPosition,
        failureReason: null,
      ),
    );
    unawaited(_deletePlaybackCache(previousPlaybackCache));

    try {
      final entrySettings = await _readEntrySettings();
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      emit(state.copyWith(settingsPreferences: entrySettings.preferences));

      final detail =
          target.detail ??
          await _vodRepository.getVodDetail(videoNo: target.videoNo);
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      final blockReason = await _vodDetailBlockReason(
        detail,
        fallbackVideoId: target.videoId,
        fallbackChannelId: target.channelId,
      );
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      if (blockReason != null) {
        _emitActiveSlot(
          emit,
          state.activeSlot.copyWith(
            status: VodPlayerSlotStatus.failure,
            detail: detail,
            playbackUri: null,
            playbackCache: null,
            seekThumbnail: null,
            failureReason: _vodEntryFailureReason(blockReason),
          ),
        );
        return;
      }

      final videoId = _nonBlank(detail.videoId) ?? _nonBlank(target.videoId);
      final inKey = _nonBlank(detail.inKey);
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
        _emitActiveSlot(
          emit,
          state.activeSlot.copyWith(
            status: VodPlayerSlotStatus.failure,
            detail: detail,
            failureReason: VodPlayerFailureReason.playbackSourceMissing,
          ),
        );
        return;
      }

      final playbackSource = await resolveVodPlaybackSource(
        masterPlaylistUri: masterPlaylistUri,
        resolutionIndex: entrySettings.preferences.vodSettings.resolutionIndex,
        startPositionSeconds: startPosition.inSeconds,
        loadPlaylistText: loadVodPlaybackPlaylistText,
      );
      if (requestSerial != _targetRequestSerial) {
        await _deletePlaybackCache(playbackSource.cache);
        return;
      }

      _emitActiveSlot(
        emit,
        state.activeSlot.copyWith(
          status: VodPlayerSlotStatus.ready,
          videoNo: detail.videoNo,
          videoId: videoId,
          detail: detail,
          playbackUri: playbackSource.playbackUri,
          playbackCache: playbackSource.cache,
          seekThumbnail: seekThumbnail,
          availableResolutionIndexes: playbackSource.availableResolutionIndexes,
          videoViewType: entrySettings.videoViewType,
          duration: Duration(seconds: detail.duration),
          failureReason: null,
        ),
      );
    } on Object {
      if (requestSerial != _targetRequestSerial) {
        return;
      }

      _emitActiveSlot(
        emit,
        state.activeSlot.copyWith(
          status: VodPlayerSlotStatus.failure,
          failureReason: VodPlayerFailureReason.detailLoadFailed,
        ),
      );
    }
  }
}
