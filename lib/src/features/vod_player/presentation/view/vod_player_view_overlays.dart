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
    return BlocSelector<
      VodPlayerBloc,
      VodPlayerState,
      _VodPlayerOverlaySnapshot
    >(
      selector: _VodPlayerOverlaySnapshot.new,
      builder: (context, snapshot) {
        return _VodPlayerOverlayListenableBoundary(
          snapshot: snapshot,
          controllerNode: controllerNode,
          controlsNode: controlsNode,
          browseNode: browseNode,
          playbackPaused: playbackPaused,
          muted: muted,
          seekSerial: seekSerial,
          seekRequest: seekRequest,
          playbackSnapshot: playbackSnapshot,
          overlayAutoHideController: overlayAutoHideController,
          exitNoticeController: exitNoticeController,
          onControlsInteraction: onControlsInteraction,
          onControlsModalVisibilityChanged: onControlsModalVisibilityChanged,
          onSeekFeedback: onSeekFeedback,
        );
      },
    );
  }
}

final class _VodPlayerOverlayListenableBoundary extends StatelessWidget {
  const _VodPlayerOverlayListenableBoundary({
    required this.snapshot,
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

  final _VodPlayerOverlaySnapshot snapshot;
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
        final state = snapshot.state;
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
              modalDismissSerial: overlayAutoHideController.modalDismissSerial,
              onModalVisibilityChanged: onControlsModalVisibilityChanged,
              onBrowseInteraction: exitNoticeController.hide,
            ) ??
            const SizedBox.shrink();
      },
    );
  }
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

@immutable
final class _VodPlayerOverlaySnapshot {
  const _VodPlayerOverlaySnapshot(this.state);

  final VodPlayerState state;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _VodPlayerOverlaySnapshot &&
            !_vodPlayerOverlaySnapshotChanged(other.state, state);
  }

  @override
  int get hashCode {
    return switch (state.overlayMode) {
      VodPlayerOverlayMode.controls => Object.hash(
        state.overlayMode,
        _vodPlayerControlsOverlayHash(state),
      ),
      VodPlayerOverlayMode.browse => Object.hash(
        state.overlayMode,
        _vodPlayerBrowseOverlayHash(state),
      ),
      VodPlayerOverlayMode.none => state.overlayMode.hashCode,
    };
  }
}

bool _vodPlayerOverlaySnapshotChanged(
  VodPlayerState previous,
  VodPlayerState current,
) {
  if (previous.overlayMode != current.overlayMode) {
    return true;
  }

  return switch (current.overlayMode) {
    VodPlayerOverlayMode.controls => _vodPlayerControlsOverlayChanged(
      previous,
      current,
    ),
    VodPlayerOverlayMode.browse => _vodPlayerBrowseOverlayChanged(
      previous,
      current,
    ),
    VodPlayerOverlayMode.none => false,
  };
}

bool _vodPlayerControlsOverlayChanged(
  VodPlayerState previous,
  VodPlayerState current,
) {
  return previous.activeSlotId != current.activeSlotId ||
      !_sameVodControlsOverlaySlot(previous.activeSlot, current.activeSlot) ||
      previous.settingsPreferences != current.settingsPreferences ||
      previous.groupCollection != current.groupCollection ||
      previous.playbackSpeed != current.playbackSpeed;
}

bool _sameVodControlsOverlaySlot(
  VodPlayerSlotState previous,
  VodPlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.videoNo == current.videoNo &&
      previous.videoId == current.videoId &&
      previous.title == current.title &&
      previous.channelId == current.channelId &&
      previous.channelName == current.channelName &&
      previous.channelVerified == current.channelVerified &&
      previous.chapters == current.chapters &&
      previous.playbackUri == current.playbackUri &&
      previous.seekThumbnail == current.seekThumbnail &&
      listEquals(
        previous.availableResolutionIndexes,
        current.availableResolutionIndexes,
      ) &&
      previous.channelMyInfo == current.channelMyInfo &&
      previous.durationSeconds == current.durationSeconds;
}

bool _vodPlayerBrowseOverlayChanged(
  VodPlayerState previous,
  VodPlayerState current,
) {
  return previous.browseStatus != current.browseStatus ||
      previous.browseItems != current.browseItems ||
      previous.browseNextPage != current.browseNextPage ||
      previous.browseHasMore != current.browseHasMore ||
      previous.browseLoadingMore != current.browseLoadingMore ||
      previous.browseFallbackAction != current.browseFallbackAction;
}

int _vodPlayerControlsOverlayHash(VodPlayerState state) {
  return Object.hashAll([
    state.activeSlotId,
    _vodControlsOverlaySlotHash(state.activeSlot),
    state.settingsPreferences,
    state.groupCollection,
    state.playbackSpeed,
  ]);
}

int _vodControlsOverlaySlotHash(VodPlayerSlotState slot) {
  return Object.hashAll([
    slot.slotId,
    slot.status,
    slot.videoNo,
    slot.videoId,
    slot.title,
    slot.channelId,
    slot.channelName,
    slot.channelVerified,
    Object.hashAll(slot.chapters),
    slot.playbackUri,
    slot.seekThumbnail,
    Object.hashAll(slot.availableResolutionIndexes),
    slot.channelMyInfo,
    slot.durationSeconds,
  ]);
}

int _vodPlayerBrowseOverlayHash(VodPlayerState state) {
  return Object.hashAll([
    state.browseStatus,
    Object.hashAll(state.browseItems),
    state.browseNextPage,
    state.browseHasMore,
    state.browseLoadingMore,
    state.browseFallbackAction,
  ]);
}
