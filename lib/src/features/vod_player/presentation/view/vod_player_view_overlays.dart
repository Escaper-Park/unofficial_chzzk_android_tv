part of 'vod_player_view.dart';

Widget? _vodPlayerOverlayFor({
  required BuildContext context,
  required VodPlayerState state,
  required VodPlayerSlotState slot,
  required FocusScopeNode controllerNode,
  required FocusScopeNode controlsNode,
  required FocusScopeNode browseNode,
  required bool playbackPaused,
  required bool muted,
  required ValueChanged<bool> onPlaybackPausedChanged,
  required ValueChanged<bool> onMutedChanged,
  required ValueChanged<Duration> onSeek,
  required VodPlayerPlaybackSnapshotListenable playbackSnapshot,
  required void Function({
    required bool forward,
    required Duration position,
  })
  onSeekFeedback,
  required VoidCallback onControlsInteraction,
  required int modalDismissSerial,
  required ValueChanged<bool> onModalVisibilityChanged,
  required VoidCallback onBrowseInteraction,
}) {
  return switch (state.overlayMode) {
    VodPlayerOverlayMode.controls => VodPlayerControlsOverlay(
      state: state,
      controlsNode: controlsNode,
      playbackPaused: playbackPaused,
      muted: muted,
      onPlaybackPausedChanged: onPlaybackPausedChanged,
      onMutedChanged: onMutedChanged,
      onSeek: onSeek,
      playbackSnapshot: playbackSnapshot,
      onSeekFeedback:
          ({
            required forward,
            required position,
          }) {
            onSeekFeedback(
              forward: forward,
              position: clampVodPlaybackPosition(
                position,
                Duration(seconds: slot.durationSeconds),
              ),
            );
          },
      onInteraction: onControlsInteraction,
      modalDismissSerial: modalDismissSerial,
      onModalVisibilityChanged: onModalVisibilityChanged,
    ),
    VodPlayerOverlayMode.browse => VodPlayerBrowseOverlay(
      state: state,
      browseNode: browseNode,
      onInteraction: onBrowseInteraction,
      onLoadMore: () {
        context.read<VodPlayerBloc>().add(
          const VodPlayerEvent.browseLoadMoreRequested(),
        );
      },
      onFallbackPressed: () {
        context.read<VodPlayerBloc>().add(
          const VodPlayerEvent.browseFallbackPressed(),
        );
      },
      onVodSelected: (vod) {
        unawaited(
          handleVodPlayerEntryFromCard(
            context,
            vod,
            usePendingEntryGuard: false,
            onAllowed: (_, target) {
              context.read<VodPlayerBloc>().add(
                VodPlayerEvent.browseVodSelected(target: target),
              );
              requestTvSectionFocus(controllerNode);
            },
          ),
        );
      },
    ),
    VodPlayerOverlayMode.none => null,
  };
}
