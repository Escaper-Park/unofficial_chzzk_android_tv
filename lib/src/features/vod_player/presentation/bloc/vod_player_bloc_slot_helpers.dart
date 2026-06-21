part of 'vod_player_bloc.dart';

extension _VodPlayerBlocSlotHelpers on VodPlayerBloc {
  void _emitActiveSlot(
    Emitter<VodPlayerState> emit,
    VodPlayerSlotState slot,
  ) {
    _emitSlot(emit, slot.copyWith(slotId: state.activeSlotId));
  }

  void _emitSlot(
    Emitter<VodPlayerState> emit,
    VodPlayerSlotState slot,
  ) {
    emit(state.copyWith(slots: _slotsWith(slot)));
  }

  List<VodPlayerSlotState> _slotsWith(VodPlayerSlotState slot) {
    return [
      for (final current in state.slots)
        current.slotId == slot.slotId ? slot : current,
    ];
  }

  void _emitFeedback(
    Emitter<VodPlayerState> emit,
    VodPlayerFeedbackType feedbackType,
  ) {
    emit(
      state.copyWith(
        feedbackType: feedbackType,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _onFeedbackCleared(
    _FeedbackCleared event,
    Emitter<VodPlayerState> emit,
  ) {
    if (state.feedbackSerial != event.serial) {
      return;
    }

    emit(state.copyWith(feedbackType: null));
  }

  Future<void> _deletePlaybackCache(VodPlaybackCache? playbackCache) async {
    await playbackCache?.delete();
  }
}
