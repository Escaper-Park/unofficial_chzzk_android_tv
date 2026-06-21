import 'dart:async';

import 'package:flutter/material.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_channel_items.dart';
import 'live_player_overlay_handlers.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewBroadcastMenu extends StatelessWidget {
  const LiveOverlayMultiviewBroadcastMenu({
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
      header: LivePlayerScreenString.overlayBroadcastSettings,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 1,
            actionCount: 5,
          ),
      itemCount: state.slots.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final slot in state.slots)
            LiveOverlayChannelNameItem(
              slot: slot,
              enabled: state.slots.length > 1,
              autofocus: slot.slotId == state.activeSlotId,
              onPressed: () {
                unawaited(
                  handleLiveOverlaySlotClosePressed(
                    context: context,
                    slot: slot,
                    onInteraction: onInteraction,
                    onCloseMenu: onDismiss,
                  ),
                );
              },
            ),
        ],
      ),
    );
  }
}
