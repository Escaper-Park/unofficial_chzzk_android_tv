part of 'vod_player_bloc.dart';

extension _VodPlayerBlocLifecycleHelpers on VodPlayerBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<VodPlayerState> emit,
  ) async {
    final target = event.initialTarget;
    if (target == null) {
      _emitActiveSlot(
        emit,
        state.activeSlot.copyWith(
          status: VodPlayerSlotStatus.failure,
          failureReason: VodPlayerFailureReason.missingInitialTarget,
        ),
      );
      return;
    }

    await _loadTarget(emit, target);
  }

  Future<void> _onTargetSelected(
    _TargetSelected event,
    Emitter<VodPlayerState> emit,
  ) async {
    await _loadTarget(emit, event.target);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<VodPlayerState> emit,
  ) async {
    final slot = state.activeSlot;
    final videoNo = slot.videoNo;
    if (videoNo == null) {
      _emitActiveSlot(
        emit,
        slot.copyWith(
          status: VodPlayerSlotStatus.failure,
          failureReason: VodPlayerFailureReason.missingInitialTarget,
        ),
      );
      return;
    }

    await _loadTarget(
      emit,
      VodPlayerInitialTarget(
        videoNo: videoNo,
        videoId: slot.videoId,
        title: slot.fallbackTitle,
        thumbnailImageUrl: slot.fallbackThumbnailImageUrl,
        channelId: slot.fallbackChannelId,
        channelName: slot.fallbackChannelName,
        channelVerified: slot.fallbackChannelVerified,
        startPositionSeconds: slot.startPosition.inSeconds,
      ),
    );
  }
}
