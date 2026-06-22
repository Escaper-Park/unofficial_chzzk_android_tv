part of 'live_player_view.dart';

Widget? _livePlayerOverlayFor({
  required BuildContext context,
  required LivePlayerState state,
  required FocusScopeNode controlsNode,
  required FocusScopeNode browseNode,
  required bool playbackPaused,
  required bool muted,
  required ValueChanged<bool> onPlaybackPausedChanged,
  required ValueChanged<bool> onMutedChanged,
  required VoidCallback onControlsInteraction,
  required int modalDismissSerial,
  required ValueChanged<bool> onModalVisibilityChanged,
  required VoidCallback onBrowseInteraction,
}) {
  return switch (state.overlayMode) {
    LivePlayerOverlayMode.controls => LivePlayerControlsOverlay(
      state: state,
      controlsNode: controlsNode,
      playbackPaused: playbackPaused,
      muted: muted,
      onPlaybackPausedChanged: onPlaybackPausedChanged,
      onRealtimePressed: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.jumpToRealtimeRequested(),
        );
      },
      onMutedChanged: onMutedChanged,
      onInteraction: onControlsInteraction,
      modalDismissSerial: modalDismissSerial,
      onModalVisibilityChanged: onModalVisibilityChanged,
    ),
    LivePlayerOverlayMode.browse => LivePlayerBrowseOverlay(
      state: state,
      browseNode: browseNode,
      onInteraction: onBrowseInteraction,
      onSectionUp: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.browseNextSectionRequested(),
        );
      },
      onSectionDown: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.browsePreviousSectionRequested(),
        );
      },
      onLoadMore: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.browseLoadMoreRequested(),
        );
      },
      onFallbackPressed: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.browseFallbackPressed(),
        );
      },
      onReplacementClosed: () {
        context.read<LivePlayerBloc>().add(
          const LivePlayerEvent.browseReplacementClosed(),
        );
      },
      onReplacementSlotSelected: (slotId) {
        context.read<LivePlayerBloc>().add(
          LivePlayerEvent.browseReplacementSlotSelected(slotId: slotId),
        );
      },
      onLiveSelected: (live) {
        unawaited(
          handleLivePlayerEntryFromCard(
            context,
            live,
            usePendingEntryGuard: false,
            onAllowed: (live, _) {
              context.read<LivePlayerBloc>().add(
                LivePlayerEvent.browseLiveSelected(live: live),
              );
            },
          ),
        );
      },
    ),
    LivePlayerOverlayMode.none => null,
  };
}
