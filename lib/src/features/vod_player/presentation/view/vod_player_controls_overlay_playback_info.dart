part of 'vod_player_controls_overlay.dart';

Widget _vodPlayerControlsPlaybackInfo({
  required VodPlayerState state,
  required VodPlayerSlotState slot,
  required VodPlayerPlaybackSnapshotListenable playbackSnapshot,
  required Duration duration,
  required List<TvVodOverlaySeekChapter> chapters,
  required TvVodOverlaySeekThumbnail? seekThumbnail,
  required ValueChanged<Duration> onSeek,
  required TvVodOverlaySeekFeedbackCallback? onSeekFeedback,
  required VoidCallback onInteraction,
}) {
  return ValueListenableBuilder<VodPlayerPlaybackSnapshot>(
    valueListenable: playbackSnapshot,
    builder: (context, snapshot, _) {
      final snapshotDuration = snapshot.duration > Duration.zero
          ? snapshot.duration
          : duration;
      return TvVodOverlayPlaybackInfo(
        progress: snapshot.progress(
          fallbackDurationSeconds: slot.durationSeconds,
        ),
        position: snapshot.position,
        duration: snapshotDuration,
        seekStep: Duration(
          seconds: VodPlayerScreenUiMapper.playbackIntervalSeconds(
            state.settingsPreferences.vodSettings.playbackIntervalIndex,
          ),
        ),
        chapters: chapters,
        seekThumbnail: seekThumbnail,
        positionText: VodPlayerScreenUiMapper.timeText(snapshot.position),
        durationText: VodPlayerScreenUiMapper.timeText(snapshotDuration),
        previewTimeTextBuilder: VodPlayerScreenUiMapper.timeText,
        onSeek: onSeek,
        onSeekFeedback: onSeekFeedback,
        onFocusChanged: (focused) {
          if (focused) {
            onInteraction();
          }
        },
      );
    },
  );
}
