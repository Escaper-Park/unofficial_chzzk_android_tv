import 'package:flutter/material.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/settings_screen_string.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';
import 'vod_player_controls_overlay_design.dart';
import 'vod_player_overlay_menu_widgets.dart';

class VodOverlayChatModeMenu extends StatelessWidget {
  const VodOverlayChatModeMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final VodPlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    return VodOverlayStandardMenu(
      header: VodPlayerScreenString.chatMode,
      anchorLink: anchorLink,
      horizontalOffset:
          VodPlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 1,
            actionCount: 5,
          ),
      itemCount: settingsChatWindowOptionSet.values.length,
      onDismiss: onDismiss,
      child: VodOverlayOptionList(
        children: [
          for (final value in settingsChatWindowOptionSet.values)
            VodOverlayOptionItem(
              title: SettingsScreenString.chatWindowLabel(value),
              icon: _chatModeIcon(value),
              selected:
                  state.settingsPreferences.vodSettings.chatWindowIndex ==
                  value,
              autofocus:
                  state.settingsPreferences.vodSettings.chatWindowIndex ==
                  value,
              onPressed: () {
                onPreferencesChanged(
                  state.settingsPreferences.copyWith(
                    vodSettings: state.settingsPreferences.vodSettings.copyWith(
                      chatWindowIndex: value,
                    ),
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

IconData _chatModeIcon(int value) {
  return switch (value) {
    0 => Icons.chat_bubble_outline,
    1 => Icons.picture_in_picture_alt_outlined,
    2 => Icons.view_sidebar_outlined,
    _ => Icons.chat_bubble_outline,
  };
}
