import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../settings/presentation/settings_screen_design.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_channel_items.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayMultiviewSoundMenu extends HookWidget {
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
    final selectedSlotId = useState<String?>(null);
    final selectedSlot = selectedSlotId.value == null
        ? null
        : state.slotById(selectedSlotId.value!);

    return LiveOverlayStandardMenu(
      header: selectedSlot == null
          ? LivePlayerScreenString.overlayMultiviewSoundSettings
          : livePlayerSlotChannelName(selectedSlot),
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 5,
          ),
      itemCount: selectedSlot == null ? state.slots.length : 0,
      onDismiss: onDismiss,
      child: selectedSlot == null
          ? LiveOverlayOptionList(
              children: [
                for (final slot in state.slots)
                  LiveOverlayChannelVolumeItem(
                    slot: slot,
                    selected: state.isSlotAudible(slot.slotId),
                    volumePercent: (state.slotStoredVolume(slot.slotId) * 100)
                        .round(),
                    autofocus: slot.slotId == state.activeSlotId,
                    onPressed: () {
                      onInteraction();
                      selectedSlotId.value = slot.slotId;
                    },
                  ),
              ],
            )
          : _LiveOverlayMultiviewVolumeSlider(
              state: state,
              slot: selectedSlot,
              onInteraction: onInteraction,
            ),
    );
  }
}

class _LiveOverlayMultiviewVolumeSlider extends HookWidget {
  const _LiveOverlayMultiviewVolumeSlider({
    required this.state,
    required this.slot,
    required this.onInteraction,
  });

  final LivePlayerState state;
  final LivePlayerSlotState slot;
  final VoidCallback onInteraction;

  @override
  Widget build(BuildContext context) {
    final sliderNode = useFocusNode();
    final volumePercent = (state.slotStoredVolume(slot.slotId) * 100).round();
    final selected = state.isSlotAudible(slot.slotId);
    final channelName = livePlayerSlotChannelName(slot);

    return Padding(
      padding: SettingsScreenDesign.modalSliderPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SettingsScreenDesign.rowGap,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                selected ? Icons.volume_up_outlined : Icons.volume_off_outlined,
              ),
              const SizedBox(width: 8),
              Flexible(
                child: TvMediaChannelName(
                  channelName: channelName,
                  verified: slot.channelVerified,
                  style: Theme.of(context).textTheme.titleSmall,
                ),
              ),
              const SizedBox(width: 12),
              Text(
                '$volumePercent%',
                style: Theme.of(context).textTheme.titleSmall,
              ),
            ],
          ),
          TvSlider(
            value: volumePercent.toDouble(),
            min: 0,
            max: 100,
            divisions: 20,
            step: 5,
            focusNode: sliderNode,
            autofocus: true,
            onChanged: (nextValue) {
              onInteraction();
              context.read<LivePlayerBloc>().add(
                LivePlayerEvent.slotVolumeChanged(
                  slotId: slot.slotId,
                  volume: nextValue / 100,
                ),
              );
            },
            onSubmitted: () {
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
