part of 'vod_player_view.dart';

final class _VodPlayerOverlayLayer extends StatelessWidget {
  const _VodPlayerOverlayLayer({
    required this.controllerNode,
    required this.controlsNode,
    required this.browseNode,
    required this.playbackPaused,
    required this.muted,
    required this.seekSerial,
    required this.seekRequest,
    required this.playbackSnapshot,
    required this.overlayAutoHideController,
    required this.exitNoticeController,
    required this.onControlsInteraction,
    required this.onControlsModalVisibilityChanged,
    required this.onSeekFeedback,
  });

  final FocusScopeNode controllerNode;
  final FocusScopeNode controlsNode;
  final FocusScopeNode browseNode;
  final ValueNotifier<bool> playbackPaused;
  final ValueNotifier<bool> muted;
  final ValueNotifier<int> seekSerial;
  final ValueNotifier<VodPlayerSeekRequest?> seekRequest;
  final ValueNotifier<VodPlayerPlaybackSnapshot> playbackSnapshot;
  final TvPlayerOverlayAutoHideController overlayAutoHideController;
  final TvPlayerExitNoticeController exitNoticeController;
  final VoidCallback onControlsInteraction;
  final ValueChanged<bool> onControlsModalVisibilityChanged;
  final void Function({
    required bool forward,
    required Duration position,
  })
  onSeekFeedback;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: Listenable.merge([
        playbackPaused,
        muted,
        overlayAutoHideController,
      ]),
      builder: (context, _) {
        return BlocBuilder<VodPlayerBloc, VodPlayerState>(
          buildWhen: _vodPlayerOverlayBuildWhen,
          builder: (context, state) {
            final slot = state.activeSlot;
            return _vodPlayerOverlayFor(
                  context: context,
                  state: state,
                  slot: slot,
                  controllerNode: controllerNode,
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
                  onSeek: (position) {
                    _seekVodPlayerTo(
                      context: context,
                      seekSerial: seekSerial,
                      seekRequest: seekRequest,
                      playbackSnapshot: playbackSnapshot,
                      position: position,
                      slot: slot,
                    );
                  },
                  playbackSnapshot: playbackSnapshot,
                  onSeekFeedback: onSeekFeedback,
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

bool _vodPlayerOverlayBuildWhen(
  VodPlayerState previous,
  VodPlayerState current,
) {
  if (previous.overlayMode != current.overlayMode) {
    return true;
  }

  if (current.overlayMode == VodPlayerOverlayMode.none) {
    return false;
  }

  if (isOnlyVodPlaybackPositionStateChange(previous, current)) {
    return false;
  }

  return true;
}

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
