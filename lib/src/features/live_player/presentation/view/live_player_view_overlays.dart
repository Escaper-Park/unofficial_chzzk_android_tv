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
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LivePlayerOverlaySnapshot
    >(
      selector: _LivePlayerOverlaySnapshot.new,
      builder: (context, snapshot) {
        return _LivePlayerOverlayListenableBoundary(
          snapshot: snapshot,
          controlsNode: controlsNode,
          browseNode: browseNode,
          playbackPaused: playbackPaused,
          muted: muted,
          overlayAutoHideController: overlayAutoHideController,
          exitNoticeController: exitNoticeController,
          onControlsInteraction: onControlsInteraction,
          onControlsModalVisibilityChanged: onControlsModalVisibilityChanged,
        );
      },
    );
  }
}

final class _LivePlayerOverlayListenableBoundary extends StatelessWidget {
  const _LivePlayerOverlayListenableBoundary({
    required this.snapshot,
    required this.controlsNode,
    required this.browseNode,
    required this.playbackPaused,
    required this.muted,
    required this.overlayAutoHideController,
    required this.exitNoticeController,
    required this.onControlsInteraction,
    required this.onControlsModalVisibilityChanged,
  });

  final _LivePlayerOverlaySnapshot snapshot;
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
        return _livePlayerOverlayFor(
              context: context,
              state: snapshot.state,
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
              modalDismissSerial: overlayAutoHideController.modalDismissSerial,
              onModalVisibilityChanged: onControlsModalVisibilityChanged,
              onBrowseInteraction: exitNoticeController.hide,
            ) ??
            const SizedBox.shrink();
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
      selectSlotDetailsFromBloc: true,
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

@immutable
final class _LivePlayerOverlaySnapshot {
  const _LivePlayerOverlaySnapshot(this.state);

  final LivePlayerState state;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerOverlaySnapshot &&
            !_livePlayerOverlayBuildWhen(other.state, state);
  }

  @override
  int get hashCode {
    return switch (state.overlayMode) {
      LivePlayerOverlayMode.controls => Object.hash(
        state.overlayMode,
        _livePlayerControlsOverlayHash(state),
      ),
      LivePlayerOverlayMode.browse => Object.hash(
        state.overlayMode,
        _livePlayerBrowseOverlayHash(state),
      ),
      LivePlayerOverlayMode.none => state.overlayMode.hashCode,
    };
  }
}

int _livePlayerControlsOverlayHash(LivePlayerState state) {
  return Object.hashAll([
    state.viewMode,
    state.multiviewLayoutMode,
    state.activeSlotId,
    state.primarySlotId,
    Object.hashAll(state.slots.map(_controlsOverlaySlotHash)),
    _unorderedStringSetHash(state.audibleSlotIds),
    _stringDoubleMapHash(state.slotVolumeById),
    state.settingsPreferences,
    state.groupCollection,
    state.channelMyInfo,
    state.isSignedIn,
  ]);
}

int _controlsOverlaySlotHash(LivePlayerSlotState slot) {
  return Object.hashAll([
    slot.slotId,
    slot.status,
    slot.channelId,
    slot.liveId,
    slot.chatChannelId,
    slot.title,
    slot.channelName,
    slot.channelVerified,
    Object.hashAll(slot.availableResolutionIndexes),
    slot.playbackResolutionIndex,
  ]);
}

int _livePlayerBrowseOverlayHash(LivePlayerState state) {
  return Object.hashAll([
    state.browseSection,
    state.browseStatus,
    Object.hashAll(state.browseItems),
    state.browseLiveCursor,
    state.browseCategoryCursor,
    state.browseHasMore,
    state.browseLoadingMore,
    state.browseFallbackAction,
    state.pendingReplacementLive,
    if (state.pendingReplacementLive != null) ...[
      state.activeSlotId,
      Object.hashAll(state.slots.map(_replacementOverlaySlotHash)),
    ],
  ]);
}

int _replacementOverlaySlotHash(LivePlayerSlotState slot) {
  return Object.hash(
    slot.slotId,
    slot.channelId,
    slot.channelName,
    slot.channelVerified,
  );
}
