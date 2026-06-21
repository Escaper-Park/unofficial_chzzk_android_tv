import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_channel_items.dart';

Future<void> handleLiveOverlayFollowingPressed({
  required BuildContext context,
  required bool following,
  required VoidCallback onInteraction,
  required VoidCallback onCloseMenu,
}) async {
  onInteraction();

  if (following) {
    final result = await showTvDialog(
      context: context,
      type: TvDialogType.alert,
      title: LivePlayerScreenString.unfollowDialogTitle,
      content: LivePlayerScreenString.unfollowDialogContent,
      primaryLabel: LivePlayerScreenString.unfollowDialogConfirm,
      secondaryLabel: LivePlayerScreenString.unfollowDialogCancel,
      icon: Icons.favorite_border_rounded,
    );
    if (!context.mounted || result != TvDialogResult.primary) {
      return;
    }
  }

  if (!context.mounted) {
    return;
  }

  context.read<LivePlayerBloc>().add(
    const LivePlayerEvent.followingToggled(),
  );
  onCloseMenu();
}

Future<void> handleLiveOverlaySlotClosePressed({
  required BuildContext context,
  required LivePlayerSlotState slot,
  required VoidCallback onInteraction,
  required VoidCallback onCloseMenu,
}) async {
  onInteraction();

  final channelName = livePlayerSlotChannelName(slot);
  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: LivePlayerScreenString.closeSlotDialogTitle(channelName),
    content: LivePlayerScreenString.closeSlotDialogContent,
    primaryLabel: LivePlayerScreenString.closeSlotDialogConfirm,
    secondaryLabel: LivePlayerScreenString.closeSlotDialogCancel,
    icon: Icons.live_tv_outlined,
  );
  if (!context.mounted || result != TvDialogResult.primary) {
    return;
  }

  context.read<LivePlayerBloc>().add(
    LivePlayerEvent.slotCloseConfirmed(slotId: slot.slotId),
  );
  onCloseMenu();
}
