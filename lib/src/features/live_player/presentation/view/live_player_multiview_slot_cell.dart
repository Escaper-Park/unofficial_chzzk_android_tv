part of 'live_player_multiview_playback_layout.dart';

class _LivePlayerSlotCell extends StatelessWidget {
  const _LivePlayerSlotCell({
    required this.slotId,
    required this.isMultiview,
    required this.active,
    required this.activeOutlineVisible,
    required this.playbackPaused,
    required this.muted,
    required this.mixWithOthers,
    required this.watchEventEnabled,
    required this.playbackSessionController,
    required this.borderRadius,
    required this.statusSurfaceFor,
  });

  final String slotId;
  final bool isMultiview;
  final bool active;
  final bool activeOutlineVisible;
  final bool playbackPaused;
  final bool muted;
  final bool mixWithOthers;
  final bool watchEventEnabled;
  final LivePlayerPlaybackSessionController playbackSessionController;
  final double borderRadius;
  final LivePlayerStatusSurfaceBuilder statusSurfaceFor;

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
          activeOutlineVisible: activeOutlineVisible,
          playbackEnabled: _playbackEnabledSlotIds(state).contains(slotId),
          playbackPaused: playbackPaused,
          muted: muted,
          mixWithOthers: mixWithOthers,
          watchEventEnabled: watchEventEnabled,
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

        final content = Stack(
          fit: StackFit.expand,
          children: [
            if (slotSnapshot.playbackEnabled)
              LivePlayerSurface(
                key: ValueKey(slot.slotId),
                slot: slot,
                playbackPaused: slotSnapshot.playbackPaused,
                muted: slotSnapshot.muted,
                mixWithOthers: slotSnapshot.mixWithOthers,
                watchEventEnabled: slotSnapshot.watchEventEnabled,
                playbackSessionController: playbackSessionController,
              )
            else
              const ColoredBox(
                color: LivePlayerScreenDesign.backgroundColor,
              ),
            ?statusSurfaceFor(
              slot,
              active: slotSnapshot.active,
              isMultiview: isMultiview,
            ),
            if (slotSnapshot.active && slotSnapshot.activeOutlineVisible)
              IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColorTokens.brandColor,
                      width: LivePlayerScreenDesign.multiviewActiveOutlineWidth,
                    ),
                  ),
                ),
              ),
          ],
        );

        return ClipRRect(
          borderRadius: BorderRadius.circular(borderRadius),
          clipBehavior: borderRadius <= 0 ? Clip.none : Clip.antiAlias,
          child: content,
        );
      },
    );
  }
}

@immutable
final class _LivePlayerSlotSnapshot {
  const _LivePlayerSlotSnapshot({
    required this.slot,
    required this.active,
    required this.activeOutlineVisible,
    required this.playbackEnabled,
    required this.playbackPaused,
    required this.muted,
    required this.mixWithOthers,
    required this.watchEventEnabled,
  });

  final LivePlayerSlotState slot;
  final bool active;
  final bool activeOutlineVisible;
  final bool playbackEnabled;
  final bool playbackPaused;
  final bool muted;
  final bool mixWithOthers;
  final bool watchEventEnabled;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerSlotSnapshot &&
            other.slot == slot &&
            other.active == active &&
            other.activeOutlineVisible == activeOutlineVisible &&
            other.playbackEnabled == playbackEnabled &&
            other.playbackPaused == playbackPaused &&
            other.muted == muted &&
            other.mixWithOthers == mixWithOthers &&
            other.watchEventEnabled == watchEventEnabled;
  }

  @override
  int get hashCode => Object.hash(
    slot,
    active,
    activeOutlineVisible,
    playbackEnabled,
    playbackPaused,
    muted,
    mixWithOthers,
    watchEventEnabled,
  );
}
