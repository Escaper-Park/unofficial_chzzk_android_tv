part of 'live_player_view.dart';

final class _LivePlayerOverlayLayer extends StatelessWidget {
  const _LivePlayerOverlayLayer({
    required this.controlsNode,
    required this.browseNode,
    required this.playbackPaused,
    required this.muted,
    required this.overlayAutoHideController,
    required this.exitNoticeController,
    required this.onControlsInteraction,
    required this.onControlsModalVisibilityChanged,
  });

  final FocusScopeNode controlsNode;
  final FocusScopeNode browseNode;
  final ValueNotifier<bool> playbackPaused;
  final ValueNotifier<bool> muted;
  final TvPlayerOverlayAutoHideController overlayAutoHideController;
  final TvPlayerExitNoticeController exitNoticeController;
  final VoidCallback onControlsInteraction;
  final ValueChanged<bool> onControlsModalVisibilityChanged;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        playbackPaused,
        muted,
        overlayAutoHideController,
      ]),
      builder: (context, _) {
        return BlocBuilder<LivePlayerBloc, LivePlayerState>(
          buildWhen: _livePlayerOverlayBuildWhen,
          builder: (context, state) {
            return _livePlayerOverlayFor(
                  context: context,
                  state: state,
                  controlsNode: controlsNode,
                  browseNode: browseNode,
                  playbackPaused: playbackPaused.value,
                  muted: muted.value,
                  onPlaybackPausedChanged: (value) {
                    playbackPaused.value = value;
                  },
                  onMutedChanged: (value) {
                    muted.value = value;
                  },
                  onControlsInteraction: onControlsInteraction,
                  modalDismissSerial:
                      overlayAutoHideController.modalDismissSerial,
                  onModalVisibilityChanged: onControlsModalVisibilityChanged,
                  onBrowseInteraction: exitNoticeController.hide,
                ) ??
                const SizedBox.shrink();
          },
        );
      },
    );
  }
}

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
