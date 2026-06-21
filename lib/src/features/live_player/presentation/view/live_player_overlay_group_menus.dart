import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayGroupAddMenu extends StatelessWidget {
  const LiveOverlayGroupAddMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.horizontalOffset,
    required this.onInteraction,
    required this.onDismiss,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final double horizontalOffset;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    final groups = state.groupCollection.groups;

    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayAddToGroup,
      anchorLink: anchorLink,
      horizontalOffset: horizontalOffset,
      itemCount: groups.isEmpty ? 1 : groups.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: groups.isEmpty
            ? [
                LiveOverlayOptionItem(
                  title: LivePlayerScreenString.overlayNoGroup,
                  icon: Icons.folder_off_outlined,
                  selected: false,
                  showRadio: false,
                  autofocus: true,
                  onPressed: onDismiss,
                ),
              ]
            : [
                for (var index = 0; index < groups.length; index += 1)
                  LiveOverlayOptionItem(
                    title: groups[index].groupName,
                    icon: Icons.folder_outlined,
                    selected: false,
                    showRadio: false,
                    autofocus: index == 0,
                    onPressed: () {
                      onInteraction();
                      context.read<LivePlayerBloc>().add(
                        LivePlayerEvent.groupAddRequested(
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

class LiveOverlayGroupSettingsMenu extends StatelessWidget {
  const LiveOverlayGroupSettingsMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.horizontalOffset,
    required this.onInteraction,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final double horizontalOffset;
  final VoidCallback onInteraction;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final groups = state.groupCollection.groups;
    final groupControlsVisible =
        state.settingsPreferences.liveSettings.showGroupInVideoPlayer == 1;
    final activeGroupId = state.groupCollection.effectiveActivatedGroupId;
    final itemCount = 1 + (groups.isEmpty ? 1 : groups.length);

    return LiveOverlayStandardMenu(
      header: LivePlayerScreenString.overlayGroupSettings,
      anchorLink: anchorLink,
      horizontalOffset: horizontalOffset,
      itemCount: itemCount,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: [
          LiveOverlaySwitchItem(
            title: LivePlayerScreenString.overlayShowGroup,
            icon: Icons.visibility_outlined,
            selected: groupControlsVisible,
            autofocus: true,
            onPressed: () => onPreferencesChanged(
              state.settingsPreferences.copyWith(
                liveSettings: state.settingsPreferences.liveSettings.copyWith(
                  showGroupInVideoPlayer: groupControlsVisible ? 0 : 1,
                ),
              ),
            ),
          ),
          if (groups.isEmpty)
            LiveOverlayOptionItem(
              title: LivePlayerScreenString.overlayNoGroup,
              icon: Icons.folder_off_outlined,
              selected: false,
              enabled: false,
              onPressed: () {},
            )
          else
            for (final group in groups)
              LiveOverlayOptionItem(
                title: group.groupName,
                icon: Icons.folder_outlined,
                selected: activeGroupId == group.id,
                onPressed: () {
                  onInteraction();
                  context.read<LivePlayerBloc>().add(
                    LivePlayerEvent.groupActivated(groupId: group.id),
                  );
                },
              ),
        ],
      ),
    );
  }
}
