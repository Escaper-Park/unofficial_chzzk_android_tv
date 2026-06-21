import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_channel_items.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewSoundMenu extends StatelessWidget {
  const LiveOverlayMultiviewSoundMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayMultiviewSoundSettings,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 5,
          ),
      itemCount: state.slots.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final slot in state.slots)
            LiveOverlayChannelSwitchItem(
              slot: slot,
              selected: state.isSlotAudible(slot.slotId),
              autofocus: slot.slotId == state.activeSlotId,
              onPressed: () {
                onInteraction();
                context.read<LivePlayerBloc>().add(
                  LivePlayerEvent.slotAudioToggled(slotId: slot.slotId),
                );
              },
            ),
        ],
      ),
    );
  }
}
