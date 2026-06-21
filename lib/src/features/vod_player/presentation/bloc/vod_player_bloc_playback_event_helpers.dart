part of 'vod_player_bloc.dart';

extension _VodPlayerBlocPlaybackEventHelpers on VodPlayerBloc {
  void _onPlaybackSpeedSelected(
    _PlaybackSpeedSelected event,
    Emitter<VodPlayerState> emit,
  ) {
    emit(state.copyWith(playbackSpeed: event.speed));
  }

  void _onPlaybackReady(
    _PlaybackReady event,
    Emitter<VodPlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    _emitSlot(emit, slot.copyWith(status: VodPlayerSlotStatus.playing));
  }

  void _onPlaybackFailed(
    _PlaybackFailed event,
    Emitter<VodPlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    final playbackCache = slot.playbackCache;
    _emitSlot(
      emit,
      slot.copyWith(
        status: VodPlayerSlotStatus.failure,
        playbackUri: null,
        playbackCache: null,
        seekThumbnail: null,
        failureReason: VodPlayerFailureReason.playbackFailed,
      ),
    );
    unawaited(_deletePlaybackCache(playbackCache));
  }

  void _onPlaybackPositionChanged(
    _PlaybackPositionChanged event,
    Emitter<VodPlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    _emitSlot(
      emit,
      slot.copyWith(
        position: event.position,
        duration: event.duration,
      ),
    );
  }

  void _onPlaybackEnded(
    _PlaybackEnded event,
    Emitter<VodPlayerState> emit,
  ) {
    final slot = state.slotById(event.slotId);
    if (slot == null || slot.playbackUri != event.playbackUri) {
      return;
    }

    _emitSlot(
      emit,
      slot.copyWith(
        status: VodPlayerSlotStatus.ended,
        position: event.position,
        duration: event.duration,
      ),
    );
  }
}
