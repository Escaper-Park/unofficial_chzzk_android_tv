import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import '../live_player_screen_ui_mapper.dart';

class LiveOverlayChannelNameItem extends HookWidget {
  const LiveOverlayChannelNameItem({
    super.key,
    required this.slot,
    required this.onPressed,
    this.enabled = true,
    this.autofocus = false,
  });

  final LivePlayerSlotState slot;
  final VoidCallback onPressed;
  final bool enabled;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final channelName = livePlayerSlotChannelName(slot);

    return TvListItem(
      title: channelName,
      titleBuilder: (context, style) => TvMediaChannelName(
        channelName: channelName,
        verified: slot.channelVerified,
        style: style,
      ),
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      design: TvListItemDesign.dense(lineCount: 1),
      onPressed: onPressed,
    );
  }
}

class LiveOverlayChannelSwitchItem extends HookWidget {
  const LiveOverlayChannelSwitchItem({
    super.key,
    required this.slot,
    required this.selected,
    required this.onPressed,
    this.autofocus = false,
  });

  final LivePlayerSlotState slot;
  final bool selected;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);
    final channelName = livePlayerSlotChannelName(slot);

    return TvListItem(
      title: channelName,
      titleBuilder: (context, style) => TvMediaChannelName(
        channelName: channelName,
        verified: slot.channelVerified,
        style: style,
      ),
      icon: selected ? Icons.volume_up_outlined : Icons.volume_off_outlined,
      trailing: TvSwitch(
        selected: selected,
        focused: focusNode.hasFocus,
      ),
      selected: selected,
      autofocus: autofocus,
      focusNode: focusNode,
      design: TvListItemDesign.dense(lineCount: 1),
      onPressed: onPressed,
    );
  }
}

class LiveOverlayChannelVolumeItem extends HookWidget {
  const LiveOverlayChannelVolumeItem({
    super.key,
    required this.slot,
    required this.selected,
    required this.volumePercent,
    required this.onPressed,
    this.autofocus = false,
  });

  final LivePlayerSlotState slot;
  final bool selected;
  final int volumePercent;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final channelName = livePlayerSlotChannelName(slot);

    return TvListItem(
      title: channelName,
      titleBuilder: (context, style) => TvMediaChannelName(
        channelName: channelName,
        verified: slot.channelVerified,
        style: style,
      ),
      icon: selected ? Icons.volume_up_outlined : Icons.volume_off_outlined,
      action: selected ? '$volumePercent%' : 'OFF',
      selected: selected,
      autofocus: autofocus,
      focusNode: focusNode,
      design: TvListItemDesign.dense(lineCount: 1),
      onPressed: onPressed,
    );
  }
}

class LiveOverlayChannelInfoItem extends StatelessWidget {
  const LiveOverlayChannelInfoItem({
    super.key,
    required this.slot,
  });

  final LivePlayerSlotState slot;

  @override
  Widget build(BuildContext context) {
    final channelName = livePlayerSlotChannelName(slot);

    return TvListItem(
      title: channelName,
      titleBuilder: (context, style) => TvMediaChannelName(
        channelName: channelName,
        verified: slot.channelVerified,
        style: style,
      ),
      subtitle: slot.title,
      icon: Icons.info_outline,
      action: LivePlayerScreenUiMapper.viewerCountText(
        slot.concurrentUserCount,
      ),
      enabled: false,
      design: TvListItemDesign.dense(lineCount: slot.title == null ? 1 : 2),
      onPressed: () {},
    );
  }
}

String livePlayerSlotChannelName(LivePlayerSlotState slot) {
  return slot.channelName ??
      slot.channelId ??
      LivePlayerScreenString.overlayBroadcastFallback;
}
