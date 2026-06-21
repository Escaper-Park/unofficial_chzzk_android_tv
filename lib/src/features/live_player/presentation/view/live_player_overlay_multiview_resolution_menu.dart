import 'package:flutter/material.dart';

import '../../../settings/presentation/settings_screen_string.dart';
import '../../domain/use_cases/resolve_live_playback_uri.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_channel_items.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewResolutionMenu extends StatelessWidget {
  const LiveOverlayMultiviewResolutionMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
    required this.onResolutionSelected,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;
  final void Function({
    required String slotId,
    required int resolutionIndex,
  })
  onResolutionSelected;

  @override
  Widget build(BuildContext context) {
    return _LiveOverlayMultiviewResolutionMenuBody(
      state: state,
      anchorLink: anchorLink,
      onInteraction: onInteraction,
      onDismiss: onDismiss,
      onResolutionSelected: onResolutionSelected,
    );
  }
}

class _LiveOverlayMultiviewResolutionMenuBody extends StatefulWidget {
  const _LiveOverlayMultiviewResolutionMenuBody({
    required this.state,
    required this.anchorLink,
    required this.onInteraction,
    required this.onDismiss,
    required this.onResolutionSelected,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;
  final void Function({
    required String slotId,
    required int resolutionIndex,
  })
  onResolutionSelected;

  @override
  State<_LiveOverlayMultiviewResolutionMenuBody> createState() {
    return _LiveOverlayMultiviewResolutionMenuBodyState();
  }
}

class _LiveOverlayMultiviewResolutionMenuBodyState
    extends State<_LiveOverlayMultiviewResolutionMenuBody> {
  String? _selectedSlotId;

  @override
  Widget build(BuildContext context) {
    final selectedSlotId = _selectedSlotId;
    final selectedSlot = selectedSlotId == null
        ? null
        : widget.state.slotById(selectedSlotId);
    if (selectedSlot != null) {
      return _buildResolutionMenu(selectedSlot);
    }

    return _buildChannelMenu();
  }

  Widget _buildChannelMenu() {
    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayMultiviewResolutionSettings,
      anchorLink: widget.anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 5,
          ),
      itemCount: widget.state.slots.length,
      onDismiss: widget.onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final slot in widget.state.slots)
            LiveOverlayOptionItem(
              key: ValueKey('live-overlay-multiview-channel-${slot.slotId}'),
              title: livePlayerSlotChannelName(slot),
              selected: slot.slotId == widget.state.activeSlotId,
              autofocus: slot.slotId == widget.state.activeSlotId,
              showRadio: false,
              onPressed: () {
                widget.onInteraction();
                setState(() {
                  _selectedSlotId = slot.slotId;
                });
              },
            ),
        ],
      ),
    );
  }

  Widget _buildResolutionMenu(LivePlayerSlotState slot) {
    final values = LivePlaybackResolutionOptions.menuIndexes(
      slot.availableResolutionIndexes,
    );
    final preferredIndex =
        slot.playbackResolutionIndex ??
        widget.state.settingsPreferences.liveSettings.multiviewResolutionIndex;
    final selectedIndex = LivePlaybackResolutionOptions.effectiveSelectedIndex(
      preferredIndex: preferredIndex,
      availableIndexes: slot.availableResolutionIndexes,
    );

    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayMultiviewResolutionSettings,
      anchorLink: widget.anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 2,
            actionCount: 5,
          ),
      itemCount: values.length,
      onDismiss: widget.onDismiss,
      child: LiveOverlayOptionList(
        children: [
          for (final value in values)
            LiveOverlayOptionItem(
              key: ValueKey('live-overlay-multiview-resolution-$value'),
              title: SettingsScreenString.resolutionLabel(value),
              selected: selectedIndex == value,
              autofocus: selectedIndex == value,
              showRadio: false,
              onPressed: () {
                widget.onInteraction();
                widget.onResolutionSelected(
                  slotId: slot.slotId,
                  resolutionIndex: value,
                );
                widget.onDismiss();
              },
            ),
        ],
      ),
    );
  }
}
