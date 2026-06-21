import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';
import 'vod_player_controls_overlay_design.dart';
import 'vod_player_overlay_menu_widgets.dart';

class VodOverlaySoundMenu extends StatelessWidget {
  const VodOverlaySoundMenu({
    super.key,
    required this.slot,
    required this.anchorLink,
    required this.muted,
    required this.onMutedChanged,
    required this.onDismiss,
  });

  final VodPlayerSlotState slot;
  final LayerLink anchorLink;
  final bool muted;
  final ValueChanged<bool> onMutedChanged;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.soundSettings,
      anchorLink: anchorLink,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 4,
          ),
      itemCount: 1,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: [
          VodOverlaySwitchItem(
            title: slot.channelName ?? VodPlayerScreenString.muted,
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

class VodOverlaySpeedMenu extends StatelessWidget {
  const VodOverlaySpeedMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
  });

  final VodPlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.speedSettings,
      anchorLink: anchorLink,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 4,
          ),
      itemCount: _playbackSpeeds.length,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: [
          for (final speed in _playbackSpeeds)
            VodOverlayOptionItem(
              title: VodPlayerScreenString.speedLabel(speed),
              icon: speed == 1 ? Icons.play_arrow : Icons.speed,
              selected: state.playbackSpeed == speed,
              autofocus: state.playbackSpeed == speed,
              onPressed: () {
                onInteraction();
                context.read<VodPlayerBloc>().add(
                  VodPlayerEvent.playbackSpeedSelected(speed: speed),
                );
                onDismiss();
              },
            ),
        ],
      ),
    );
  }
}

const _playbackSpeeds = <double>[0.5, 0.75, 1, 1.25, 1.5, 2];
