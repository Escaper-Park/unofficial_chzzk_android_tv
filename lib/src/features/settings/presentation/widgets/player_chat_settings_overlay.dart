import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import '../../domain/entities/settings_preferences.dart';
import '../models/preferences/chat_settings_preferences.dart';
import '../models/settings_preference_models.dart';
import '../settings_screen_design.dart';
import 'settings_position_icon.dart';

part 'player_chat_settings_action.dart';
part 'player_chat_settings_slider.dart';

int get playerChatSettingsCount => chatSettingsPreferences.length;

class PlayerChatSettingsPanel extends StatelessWidget {
  const PlayerChatSettingsPanel({
    super.key,
    required this.links,
    required this.onPressed,
  });

  final List<LayerLink> links;
  final ValueChanged<int> onPressed;

  @override
  Widget build(BuildContext context) {
    final preferences = chatSettingsPreferences;
    final columnCount =
        (preferences.length / _PlayerChatSettingsOverlayDesign.gridRowCount)
            .ceil();

    return TvPlayerOverlayFrame(
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          spacing: _PlayerChatSettingsOverlayDesign.gridRowGap,
          children: [
            for (
              var row = 0;
              row < _PlayerChatSettingsOverlayDesign.gridRowCount;
              row += 1
            )
              Row(
                mainAxisSize: MainAxisSize.min,
                spacing: _PlayerChatSettingsOverlayDesign.gridColumnGap,
                children: [
                  for (var column = 0; column < columnCount; column += 1)
                    if (column + row * columnCount < preferences.length)
                      _PlayerChatSettingAction(
                        index: column + row * columnCount,
                        link: links[column + row * columnCount],
                        onPressed: onPressed,
                      ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

class PlayerChatSettingMenu extends StatelessWidget {
  const PlayerChatSettingMenu({
    super.key,
    required this.preferences,
    required this.chatSettingIndex,
    required this.chatSettingLinks,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final SettingsPreferences preferences;
  final int? chatSettingIndex;
  final List<LayerLink> chatSettingLinks;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final index = chatSettingIndex;
    if (index == null ||
        index < 0 ||
        index >= chatSettingsPreferences.length ||
        index >= chatSettingLinks.length) {
      return const SizedBox.shrink();
    }

    final item = chatSettingsPreferences[index];
    final value = item.read(preferences);

    return TvPlayerOverlayStandardMenu(
      header: item.title,
      anchorLink: chatSettingLinks[index],
      itemCount:
          item.optionSet.controlType == SettingsPreferenceControlType.slider
          ? 0
          : item.optionSet.values.length,
      extraHeight:
          item.optionSet.controlType == SettingsPreferenceControlType.slider
          ? TvPlayerOverlayControlsDesign.modalSliderHeight
          : 0,
      onDismiss: onDismiss,
      child: switch (item.optionSet.controlType) {
        SettingsPreferenceControlType.toggle => TvPlayerOverlayOptionList(
          children: [
            TvPlayerOverlaySwitchItem(
              title: item.label(value),
              selected: value == 1,
              autofocus: true,
              onPressed: () => onPreferencesChanged(
                item.writeNormalized(
                  preferences,
                  value == 1 ? 0 : 1,
                ),
              ),
            ),
          ],
        ),
        SettingsPreferenceControlType.select => TvPlayerOverlayOptionList(
          children: [
            for (final option in item.optionSet.values)
              TvPlayerOverlayOptionItem(
                title: item.label(option),
                leading: _playerChatSettingValueIcon(
                  item: item,
                  value: option,
                  size: 18,
                ),
                selected: option == value,
                autofocus: option == value,
                onPressed: () => onPreferencesChanged(
                  item.writeNormalized(preferences, option),
                ),
              ),
          ],
        ),
        SettingsPreferenceControlType.slider => _PlayerChatSliderSetting(
          item: item,
          value: value,
          preferences: preferences,
          onPreferencesChanged: onPreferencesChanged,
        ),
      },
    );
  }
}
