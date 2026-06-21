part of 'vod_player_view.dart';

Duration _seekVodPlayerTo({
  required BuildContext context,
  required ValueNotifier<int> seekSerial,
  required ValueNotifier<VodPlayerSeekRequest?> seekRequest,
  required ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot,
  required Duration position,
  required VodPlayerSlotState slot,
}) {
  final maxDuration = Duration(seconds: slot.durationSeconds);
  final clampedPosition = clampVodPlaybackPosition(position, maxDuration);
  final serial = seekSerial.value + 1;
  seekSerial.value = serial;
  seekRequest.value = VodPlayerSeekRequest(
    serial: serial,
    position: clampedPosition,
  );
  playbackSnapshot.value = VodPlayerPlaybackSnapshot(
    position: clampedPosition,
    duration: vodPlayerSnapshotDurationForSlot(
      slot,
      playbackSnapshot.value,
    ),
  );

  final playbackUri = slot.playbackUri;
  if (playbackUri != null) {
    context.read<VodPlayerBloc>().add(
      VodPlayerEvent.playbackPositionChanged(
        slotId: slot.slotId,
        playbackUri: playbackUri,
        position: clampedPosition,
        duration: playbackSnapshot.value.duration,
      ),
    );
  }

  return clampedPosition;
}

void _seekVodPlayerRelative({
  required BuildContext context,
  required ValueNotifier<int> seekSerial,
  required ValueNotifier<VodPlayerSeekRequest?> seekRequest,
  required ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot,
  required VodPlayerSeekFeedbackController seekFeedbackController,
  required bool forward,
  required VodPlayerSlotState slot,
  required VodPlayerState state,
}) {
  if (slot.playbackUri == null) {
    return;
  }

  final interval = Duration(
    seconds: VodPlayerScreenUiMapper.playbackIntervalSeconds(
      state.settingsPreferences.vodSettings.playbackIntervalIndex,
    ),
  );
  final target = _seekVodPlayerTo(
    context: context,
    seekSerial: seekSerial,
    seekRequest: seekRequest,
    playbackSnapshot: playbackSnapshot,
    position:
        playbackSnapshot.value.position + (forward ? interval : -interval),
    slot: slot,
  );
  seekFeedbackController.show(forward: forward, position: target);
}
