part of 'live_player_multiview_playback_layout.dart';

class _LivePlayerSlotCell extends HookWidget {
  const _LivePlayerSlotCell({
    required this.slotId,
    required this.isMultiview,
    required this.active,
    required this.playbackPaused,
    required this.singleMuted,
    required this.appPlaybackSuspended,
    required this.volume,
    required this.mixWithOthers,
    required this.watchEventEnabled,
    required this.statusPollingEnabled,
    required this.activeOutlineController,
    required this.playbackSessionController,
    required this.statusSurfaceFor,
  });

  final String slotId;
  final bool isMultiview;
  final bool active;
  final ValueListenable<bool> playbackPaused;
  final ValueListenable<bool> singleMuted;
  final bool appPlaybackSuspended;
  final double volume;
  final bool mixWithOthers;
  final bool watchEventEnabled;
  final bool statusPollingEnabled;
  final TvTimedVisibilityController activeOutlineController;
  final LivePlayerPlaybackSessionController playbackSessionController;
  final LivePlayerStatusSurfaceBuilder statusSurfaceFor;

  @override
  Widget build(BuildContext context) {
    final retainedPlaybackSlot = useRef<LivePlayerSlotState?>(null);
    final reloadPending = useRef(false);
    final surfaceRevision = useRef(0);

    return ValueListenableBuilder<bool>(
      valueListenable: playbackPaused,
      builder: (context, playbackPaused, child) {
        return ValueListenableBuilder<bool>(
          valueListenable: singleMuted,
          builder: (context, muted, child) {
            final effectivePlaybackPaused =
                playbackPaused || appPlaybackSuspended;
            return _LivePlayerSlotCellContent(
              slotId: slotId,
              isMultiview: isMultiview,
              active: active,
              playbackPaused: effectivePlaybackPaused,
              volume: isMultiview
                  ? volume
                  : muted
                  ? 0
                  : volume,
              mixWithOthers: mixWithOthers,
              watchEventEnabled: watchEventEnabled,
              statusPollingEnabled: statusPollingEnabled,
              activeOutlineController: activeOutlineController,
              playbackSessionController: playbackSessionController,
              statusSurfaceFor: statusSurfaceFor,
              retainedPlaybackSlot: retainedPlaybackSlot,
              reloadPending: reloadPending,
              surfaceRevision: surfaceRevision,
            );
          },
        );
      },
    );
  }
}

class _LivePlayerSlotCellContent extends StatelessWidget {
  const _LivePlayerSlotCellContent({
    required this.slotId,
    required this.isMultiview,
    required this.active,
    required this.playbackPaused,
    required this.volume,
    required this.mixWithOthers,
    required this.watchEventEnabled,
    required this.statusPollingEnabled,
    required this.activeOutlineController,
    required this.playbackSessionController,
    required this.statusSurfaceFor,
    required this.retainedPlaybackSlot,
    required this.reloadPending,
    required this.surfaceRevision,
  });

  final String slotId;
  final bool isMultiview;
  final bool active;
  final bool playbackPaused;
  final double volume;
  final bool mixWithOthers;
  final bool watchEventEnabled;
  final bool statusPollingEnabled;
  final TvTimedVisibilityController activeOutlineController;
  final LivePlayerPlaybackSessionController playbackSessionController;
  final LivePlayerStatusSurfaceBuilder statusSurfaceFor;
  final ObjectRef<LivePlayerSlotState?> retainedPlaybackSlot;
  final ObjectRef<bool> reloadPending;
  final ObjectRef<int> surfaceRevision;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LivePlayerSlotSnapshot?
    >(
      selector: (state) {
        final slot = state.slotById(slotId);
        if (slot == null) {
          return null;
        }

        return _LivePlayerSlotSnapshot(
          slot: slot,
          active: active,
          playbackEnabled: _playbackEnabledForSlotId(state, slotId),
          playbackPaused: playbackPaused,
          volume: volume,
          mixWithOthers: mixWithOthers,
          videoViewType: _effectiveVideoViewTypeForSlot(state, slot),
          watchEventEnabled: watchEventEnabled,
          statusPollingEnabled: statusPollingEnabled,
        );
      },
      builder: (context, snapshot) {
        final slotSnapshot = snapshot;
        if (slotSnapshot == null) {
          return const ColoredBox(
            color: LivePlayerScreenDesign.backgroundColor,
          );
        }
        final slot = slotSnapshot.slot;
        final surfaceSlot = _surfaceSlotFor(
          slot: slot,
          retainedPlaybackSlot: retainedPlaybackSlot,
          reloadPending: reloadPending,
          surfaceRevision: surfaceRevision,
        );
        final retainedPlaybackVisible =
            slotSnapshot.playbackEnabled &&
            surfaceSlot != null &&
            surfaceSlot.playbackUri != slot.playbackUri;
        final statusSurface = retainedPlaybackVisible
            ? const _RetainedPlaybackLoadingIndicator()
            : statusSurfaceFor(
                slot,
                active: slotSnapshot.active,
                isMultiview: isMultiview,
              );

        return Stack(
          fit: StackFit.expand,
          children: [
            if (slotSnapshot.playbackEnabled && surfaceSlot != null)
              LivePlayerSurface(
                key: ValueKey(
                  'live-player-surface-${slot.slotId}-${slotSnapshot.videoViewType.name}-${surfaceRevision.value}',
                ),
                slot: surfaceSlot,
                playbackPaused: slotSnapshot.playbackPaused,
                volume: slotSnapshot.volume,
                mixWithOthers: slotSnapshot.mixWithOthers,
                videoViewType: slotSnapshot.videoViewType,
                watchEventEnabled: slotSnapshot.watchEventEnabled,
                statusPollingEnabled: slotSnapshot.statusPollingEnabled,
                playbackSessionController: playbackSessionController,
              )
            else
              const ColoredBox(
                color: LivePlayerScreenDesign.backgroundColor,
              ),
            ?statusSurface,
            if (slotSnapshot.active)
              _LivePlayerActiveSlotOutline(
                controller: activeOutlineController,
              ),
          ],
        );
      },
    );
  }
}

class _LivePlayerActiveSlotOutline extends StatelessWidget {
  const _LivePlayerActiveSlotOutline({
    required this.controller,
  });

  final TvTimedVisibilityController controller;

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        if (!controller.isShowing) {
          return const SizedBox.shrink();
        }

        return child!;
      },
      child: IgnorePointer(
        child: DecoratedBox(
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColorTokens.brandColor,
              width: LivePlayerScreenDesign.multiviewActiveOutlineWidth,
            ),
          ),
        ),
      ),
    );
  }
}

class _RetainedPlaybackLoadingIndicator extends StatelessWidget {
  const _RetainedPlaybackLoadingIndicator();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: LayoutBuilder(
        builder: (context, constraints) {
          final shortestSide = math.min(
            constraints.maxWidth,
            constraints.maxHeight,
          );
          final iconSize =
              (shortestSide *
                      LivePlayerScreenDesign.inactiveStatusIconSizeRatio)
                  .clamp(
                    LivePlayerScreenDesign.inactiveStatusIconMinSize,
                    LivePlayerScreenDesign.inactiveStatusIconMaxSize,
                  )
                  .toDouble();

          return LivePlayerLoadingIndicator(size: iconSize);
        },
      ),
    );
  }
}

LivePlayerSlotState? _surfaceSlotFor({
  required LivePlayerSlotState slot,
  required ObjectRef<LivePlayerSlotState?> retainedPlaybackSlot,
  required ObjectRef<bool> reloadPending,
  required ObjectRef<int> surfaceRevision,
}) {
  if (slot.playbackUri != null) {
    if (reloadPending.value) {
      surfaceRevision.value += 1;
      reloadPending.value = false;
    }
    retainedPlaybackSlot.value = slot;
    return slot;
  }

  final retained = retainedPlaybackSlot.value;
  if (_canRetainPlaybackSurfaceForLoading(slot: slot, retained: retained)) {
    reloadPending.value = true;
    return retained;
  }

  retainedPlaybackSlot.value = null;
  reloadPending.value = false;
  return null;
}

bool _canRetainPlaybackSurfaceForLoading({
  required LivePlayerSlotState slot,
  required LivePlayerSlotState? retained,
}) {
  if (slot.status != LivePlayerSlotStatus.loadingSource ||
      retained?.playbackUri == null) {
    return false;
  }

  if (slot.channelId != retained!.channelId) {
    return false;
  }

  final slotLiveId = slot.liveId;
  final retainedLiveId = retained.liveId;
  return slotLiveId == null ||
      retainedLiveId == null ||
      slotLiveId == retainedLiveId;
}

@immutable
final class _LivePlayerSlotSnapshot {
  const _LivePlayerSlotSnapshot({
    required this.slot,
    required this.active,
    required this.playbackEnabled,
    required this.playbackPaused,
    required this.volume,
    required this.mixWithOthers,
    required this.videoViewType,
    required this.watchEventEnabled,
    required this.statusPollingEnabled,
  });

  final LivePlayerSlotState slot;
  final bool active;
  final bool playbackEnabled;
  final bool playbackPaused;
  final double volume;
  final bool mixWithOthers;
  final PlayerVideoViewType videoViewType;
  final bool watchEventEnabled;
  final bool statusPollingEnabled;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerSlotSnapshot &&
            _sameSlotPlaybackSurfaceInput(other.slot, slot) &&
            other.active == active &&
            other.playbackEnabled == playbackEnabled &&
            other.playbackPaused == playbackPaused &&
            other.volume == volume &&
            other.mixWithOthers == mixWithOthers &&
            other.videoViewType == videoViewType &&
            other.watchEventEnabled == watchEventEnabled &&
            other.statusPollingEnabled == statusPollingEnabled;
  }

  @override
  int get hashCode => Object.hashAll([
    slot.slotId,
    slot.status,
    slot.channelId,
    slot.liveId,
    slot.playbackUri,
    slot.openDate,
    Object.hashAll(slot.liveTokens),
    slot.failureReason,
    active,
    playbackEnabled,
    playbackPaused,
    volume,
    mixWithOthers,
    videoViewType,
    watchEventEnabled,
    statusPollingEnabled,
  ]);
}

bool _sameSlotPlaybackSurfaceInput(
  LivePlayerSlotState previous,
  LivePlayerSlotState current,
) {
  return previous.slotId == current.slotId &&
      previous.status == current.status &&
      previous.channelId == current.channelId &&
      previous.liveId == current.liveId &&
      previous.playbackUri == current.playbackUri &&
      previous.openDate == current.openDate &&
      listEquals(previous.liveTokens, current.liveTokens) &&
      previous.failureReason == current.failureReason;
}
