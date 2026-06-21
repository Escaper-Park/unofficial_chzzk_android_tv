import 'package:flutter/material.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/settings_screen_string.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_menu_widgets.dart';

class LiveOverlayChatModeMenu extends StatelessWidget {
  const LiveOverlayChatModeMenu({
    super.key,
    required this.state,
    required this.anchorLink,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final LivePlayerState state;
  final LayerLink anchorLink;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    return LiveOverlayStandardMenu(
      header: state.isMultiview
          ? LivePlayerScreenString.overlayMultiviewChatMode
          : LivePlayerScreenString.overlayChatWindowMode,
      anchorLink: anchorLink,
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: 1,
            actionCount: 5,
          ),
      itemCount: state.isMultiview
          ? settingsMultiviewChatWindowOptionSet.values.length
          : settingsChatWindowOptionSet.values.length,
      onDismiss: onDismiss,
      child: LiveOverlayOptionList(
        children: state.isMultiview
            ? _multiviewChatWindowItems()
            : _chatWindowItems(),
      ),
    );
  }

  List<Widget> _multiviewChatWindowItems() {
    return [
      for (final value in settingsMultiviewChatWindowOptionSet.values)
        LiveOverlayOptionItem(
          title: SettingsScreenString.multiviewChatWindowLabel(value),
          icon: _chatModeIcon(value),
          selected:
              state.settingsPreferences.liveSettings.multiviewChatWindowIndex ==
              value,
          autofocus:
              state.settingsPreferences.liveSettings.multiviewChatWindowIndex ==
              value,
          onPressed: () {
            onPreferencesChanged(
              state.settingsPreferences.copyWith(
                liveSettings: state.settingsPreferences.liveSettings.copyWith(
                  multiviewChatWindowIndex: value,
                ),
              ),
            );
            onDismiss();
          },
        ),
    ];
  }

  List<Widget> _chatWindowItems() {
    return [
      for (final value in settingsChatWindowOptionSet.values)
        LiveOverlayOptionItem(
          title: SettingsScreenString.chatWindowLabel(value),
          icon: _chatModeIcon(value),
          selected:
              state.settingsPreferences.liveSettings.chatWindowIndex == value,
          autofocus:
              state.settingsPreferences.liveSettings.chatWindowIndex == value,
          onPressed: () {
            onPreferencesChanged(
              state.settingsPreferences.copyWith(
                liveSettings: state.settingsPreferences.liveSettings.copyWith(
                  chatWindowIndex: value,
                ),
              ),
            );
            onDismiss();
          },
        ),
    ];
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
