part of 'live_player_bloc.dart';

extension _LivePlayerBlocLifecycleHelpers on LivePlayerBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<LivePlayerState> emit,
  ) async {
    final target = event.initialTarget;
    if (target == null) {
      _emitActiveSlot(
        emit,
        state.activeSlot.copyWith(
          status: LivePlayerSlotStatus.failure,
          failureReason: LivePlayerFailureReason.missingInitialTarget,
        ),
      );
      return;
    }

    await _loadTarget(emit, target);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<LivePlayerState> emit,
  ) async {
    final slot = state.activeSlot;
    final channelId = slot.channelId;
    if (channelId == null) {
      _emitActiveSlot(
        emit,
        slot.copyWith(
          status: LivePlayerSlotStatus.failure,
          failureReason: LivePlayerFailureReason.missingInitialTarget,
        ),
      );
      return;
    }

    await _loadTarget(
      emit,
      LivePlayerInitialTarget(
        channelId: channelId,
        liveId: slot.liveId,
        title: slot.fallbackTitle,
        thumbnailImageUrl: slot.fallbackThumbnailImageUrl,
      ),
    );
  }
}
