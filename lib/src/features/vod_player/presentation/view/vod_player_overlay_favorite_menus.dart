import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';
import 'vod_player_controls_overlay_design.dart';
import 'vod_player_overlay_menu_widgets.dart';

class VodOverlayFavoriteMenu extends StatelessWidget {
  const VodOverlayFavoriteMenu({
    super.key,
    required this.slot,
    required this.anchorLink,
    required this.onInteraction,
    required this.onOpenGroupPressed,
    required this.onDismiss,
  });

  final VodPlayerSlotState slot;
  final LayerLink anchorLink;
  final VoidCallback onInteraction;
  final VoidCallback onOpenGroupPressed;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.favorite,
      anchorLink: anchorLink,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 3,
            actionCount: 5,
          ),
      itemCount: 2,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: [
          VodOverlayOptionItem(
            title: slot.isFollowing
                ? VodPlayerScreenString.following
                : VodPlayerScreenString.follow,
            icon: slot.isFollowing ? Icons.favorite : Icons.favorite_border,
            selected: false,
            showRadio: false,
            autofocus: slot.canToggleFollowing,
            enabled: slot.canToggleFollowing,
            onPressed: () {
              unawaited(
                _handleFollowingPressed(
                  context: context,
                  following: slot.isFollowing,
                  onInteraction: onInteraction,
                  onCloseMenu: onDismiss,
                ),
              );
            },
          ),
          VodOverlayOptionItem(
            title: VodPlayerScreenString.addToGroup,
            icon: Icons.group_add_outlined,
            selected: false,
            showRadio: false,
            autofocus: !slot.canToggleFollowing,
            onPressed: onOpenGroupPressed,
          ),
        ],
      ),
    );
  }
}

class VodOverlayGroupAddMenu extends StatelessWidget {
  const VodOverlayGroupAddMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.horizontalOffset,
    required this.onInteraction,
    required this.onDismiss,
  });

  final VodPlayerState state;
  final LayerLink anchorLink;
  final double horizontalOffset;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final groups = state.groupCollection.groups;

    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.addToGroup,
      anchorLink: anchorLink,
      horizontalOffset: horizontalOffset,
      itemCount: groups.isEmpty ? 1 : groups.length,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: groups.isEmpty
            ? [
                VodOverlayOptionItem(
                  title: VodPlayerScreenString.noGroup,
                  icon: Icons.folder_off_outlined,
                  selected: false,
                  showRadio: false,
                  autofocus: true,
                  onPressed: onDismiss,
                ),
              ]
            : [
                for (var index = 0; index < groups.length; index += 1)
                  VodOverlayOptionItem(
                    title: groups[index].groupName,
                    icon: Icons.folder_outlined,
                    selected: false,
                    showRadio: false,
                    autofocus: index == 0,
                    onPressed: () {
                      onInteraction();
                      context.read<VodPlayerBloc>().add(
                        VodPlayerEvent.groupAddRequested(
                          groupId: groups[index].id,
                        ),
                      );
                      onDismiss();
                    },
                  ),
              ],
      ),
    );
  }
}

Future<void> _handleFollowingPressed({
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
      title: VodPlayerScreenString.unfollowDialogTitle,
      content: VodPlayerScreenString.unfollowDialogContent,
      primaryLabel: VodPlayerScreenString.unfollowDialogConfirm,
      secondaryLabel: VodPlayerScreenString.unfollowDialogCancel,
      icon: Icons.favorite_border_rounded,
    );
    if (!context.mounted || result != TvDialogResult.primary) {
      return;
    }
  }

  if (!context.mounted) {
    return;
  }

  context.read<VodPlayerBloc>().add(
    const VodPlayerEvent.followingToggled(),
  );
  onCloseMenu();
}
