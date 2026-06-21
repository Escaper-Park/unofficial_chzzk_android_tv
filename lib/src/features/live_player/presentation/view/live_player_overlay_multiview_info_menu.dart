import 'package:flutter/material.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_channel_items.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewInfoMenu extends StatelessWidget {
  const LiveOverlayMultiviewInfoMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayMultiviewInfo,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 4,
            actionCount: 5,
          ),
      itemCount: state.slots.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final slot in state.slots)
            LiveOverlayChannelInfoItem(slot: slot),
        ],
      ),
    );
  }
}
