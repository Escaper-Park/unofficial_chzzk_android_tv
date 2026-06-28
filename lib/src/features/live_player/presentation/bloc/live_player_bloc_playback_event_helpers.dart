part of 'live_player_bloc.dart';

extension _LivePlayerBlocPlaybackEventHelpers on LivePlayerBloc {
  void _onPlaybackReady(
    _PlaybackReady event,
    Emitter<LivePlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    _endedStatusChecks.clear(event.slotId);
    _emitSlot(
      emit,
      slot.copyWith(status: LivePlayerSlotStatus.playing),
    );
  }

  void _onPlaybackEnded(
    _PlaybackEnded event,
    Emitter<LivePlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    final channelId = slot?.channelId;
    if (slot == null ||
        channelId == null ||
        slot.playbackUri != event.playbackUri) {
      return;
    }

    _endedStatusChecks.start(
      slotId: event.slotId,
      playbackUri: event.playbackUri,
      initialAttempts: 1,
    );
  }

  void _onPlaybackFailed(
    _PlaybackFailed event,
    Emitter<LivePlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    _endedStatusChecks.clear(event.slotId);
    _emitSlot(
      emit,
      slot.copyWith(
        status: LivePlayerSlotStatus.failure,
        playbackUri: null,
        failureReason: LivePlayerFailureReason.playbackFailed,
      ),
    );
  }
}
