import 'dart:async';

import 'package:flutter/material.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_handlers.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayPlaybackMenu extends StatelessWidget {
  const LiveOverlayPlaybackMenu({
    super.key,
    required this.anchorLink,
    required this.playbackPaused,
    required this.onPlaybackPausedChanged,
    required this.onDismiss,
  });

  final LayerLink anchorLink;
  final bool playbackPaused;
  final ValueChanged<bool> onPlaybackPausedChanged;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayPlay,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 0,
            actionCount: 5,
          ),
      itemCount: 2,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          LiveOverlayOptionItem(
            title: playbackPaused
                ? LivePlayerScreenString.overlayPlay
                : LivePlayerScreenString.overlayPause,
            icon: playbackPaused ? Icons.play_arrow : Icons.pause,
            selected: false,
            showRadio: false,
            autofocus: true,
            onPressed: () {
              onPlaybackPausedChanged(!playbackPaused);
              onDismiss();
            },
          ),
          LiveOverlayOptionItem(
            title: LivePlayerScreenString.overlayRealtime,
            icon: Icons.flash_on,
            selected: false,
            showRadio: false,
            onPressed: () {
              onPlaybackPausedChanged(false);
              onDismiss();
            },
          ),
        ],
      ),
    );
  }
}

class LiveOverlayFavoriteMenu extends StatelessWidget {
  const LiveOverlayFavoriteMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onOpenGroupPressed,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onOpenGroupPressed;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayFavorite,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 5,
          ),
      itemCount: 2,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          LiveOverlayOptionItem(
            title: state.isFollowingActiveChannel
                ? LivePlayerScreenString.overlayFollowing
                : LivePlayerScreenString.overlayFollow,
            icon: state.isFollowingActiveChannel
                ? Icons.favorite
                : Icons.favorite_border,
            selected: false,
            showRadio: false,
            autofocus: state.canToggleActiveChannelFollowing,
            enabled: state.canToggleActiveChannelFollowing,
            onPressed: () {
              unawaited(
                handleLiveOverlayFollowingPressed(
                  context: context,
                  following: state.isFollowingActiveChannel,
                  onInteraction: onInteraction,
                  onCloseMenu: onDismiss,
                ),
              );
            },
          ),
          LiveOverlayOptionItem(
            title: LivePlayerScreenString.overlayAddToGroup,
            icon: Icons.group_add_outlined,
            selected: false,
            showRadio: false,
            autofocus: !state.canToggleActiveChannelFollowing,
            onPressed: onOpenGroupPressed,
          ),
        ],
      ),
    );
  }
}

class LiveOverlaySoundMenu extends StatelessWidget {
  const LiveOverlaySoundMenu({
    super.key,
    required this.slot,
    required this.anchorLink,
    required this.muted,
    required this.onMutedChanged,
    required this.onDismiss,
  });

  final LivePlayerSlotState slot;
  final LayerLink anchorLink;
  final bool muted;
  final ValueChanged<bool> onMutedChanged;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlaySoundSettings,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 4,
          ),
      itemCount: 1,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          LiveOverlaySwitchItem(
            title: slot.channelName ?? slot.channelId ?? '',
            icon: muted ? Icons.volume_off : Icons.volume_up,
            selected: !muted,
            autofocus: true,
            onPressed: () => onMutedChanged(!muted),
          ),
        ],
      ),
    );
  }
}
