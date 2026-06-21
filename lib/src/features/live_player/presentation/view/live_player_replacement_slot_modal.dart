import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';

class LivePlayerReplacementSlotModal extends StatelessWidget {
  const LivePlayerReplacementSlotModal({
    super.key,
    required this.slots,
    required this.activeSlotId,
    required this.onDismiss,
    required this.onSlotSelected,
  });

  final List<LivePlayerSlotState> slots;
  final String activeSlotId;
  final VoidCallback onDismiss;
  final ValueChanged<String> onSlotSelected;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: LivePlayerScreenString.replacementSlotTitle,
      showScrim: true,
      onDismiss: onDismiss,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (final slot in slots)
            TvListItem(
              title: _slotChannelName(slot),
              titleBuilder: (context, style) => TvMediaChannelName(
                channelName: _slotChannelName(slot),
                verified: slot.channelVerified,
                style: style,
              ),
              icon: Icons.live_tv_outlined,
              autofocus: slot.slotId == activeSlotId,
              design: TvListItemDesign.dense(lineCount: 1),
              onPressed: () => onSlotSelected(slot.slotId),
            ),
        ],
      ),
    );
  }
}

String _slotChannelName(LivePlayerSlotState slot) {
  return slot.channelName ??
      slot.channelId ??
      LivePlayerScreenString.overlayBroadcastFallback;
}
