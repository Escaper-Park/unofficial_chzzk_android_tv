import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/models/settings_preference_models.dart';
import '../../../settings/presentation/settings_screen_design.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_overlay_menu_widgets.dart';
import 'live_player_overlay_multiview_default_settings_items.dart';

class LiveOverlayMultiviewDefaultSettingMenu extends StatelessWidget {
  const LiveOverlayMultiviewDefaultSettingMenu({
    super.key,
    required this.preferences,
    required this.settingIndex,
    required this.links,
    required this.onDismiss,
    required this.onPreferencesChanged,
  });

  final SettingsPreferences preferences;
  final int? settingIndex;
  final List<LayerLink> links;
  final VoidCallback onDismiss;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final index = settingIndex;
    final items = liveOverlayMultiviewDefaultSettingItems;
    if (index == null ||
        index < 0 ||
        index >= items.length ||
        index >= links.length) {
      return const SizedBox.shrink();
    }

    final item = items[index];
    final value = item.read(preferences);

    return LiveOverlayStandardMenu(
      header: item.title,
      anchorLink: links[index],
      horizontalOffset:
          LivePlayerControlsOverlayDesign.modalHorizontalOffsetForAction(
            actionIndex: index,
            actionCount: liveOverlayMultiviewDefaultSettingCount,
          ),
      itemCount:
          item.optionSet.controlType == SettingsPreferenceControlType.slider
          ? 0
          : item.optionSet.values.length,
      onDismiss: onDismiss,
      child: switch (item.optionSet.controlType) {
        SettingsPreferenceControlType.toggle => LiveOverlayOptionList(
          children: [
            LiveOverlaySwitchItem(
              title: item.label(value),
              icon: liveOverlayMultiviewDefaultSettingIcon(item),
              selected: value == 1,
              autofocus: true,
              onPressed: () => onPreferencesChanged(
                item.writeNormalized(preferences, value == 1 ? 0 : 1),
              ),
            ),
          ],
        ),
        SettingsPreferenceControlType.select => LiveOverlayOptionList(
          children: [
            for (final option in item.optionSet.values)
              LiveOverlayOptionItem(
                title: item.label(option),
                icon: liveOverlayMultiviewDefaultSettingIcon(item),
                selected: option == value,
                autofocus: option == value,
                onPressed: () => onPreferencesChanged(
                  item.writeNormalized(preferences, option),
                ),
              ),
          ],
        ),
        SettingsPreferenceControlType.slider => _LiveOverlayMultiviewSlider(
          item: item,
          value: value,
          preferences: preferences,
          onPreferencesChanged: onPreferencesChanged,
        ),
      },
    );
  }
}

class _LiveOverlayMultiviewSlider extends HookWidget {
  const _LiveOverlayMultiviewSlider({
    required this.item,
    required this.value,
    required this.preferences,
    required this.onPreferencesChanged,
  });

  final SettingsPreferenceItem item;
  final int value;
  final SettingsPreferences preferences;
  final ValueChanged<SettingsPreferences> onPreferencesChanged;

  @override
  Widget build(BuildContext context) {
    final sliderNode = useFocusNode();
    final values = item.optionSet.values;

    return Padding(
      padding: SettingsScreenDesign.modalSliderPadding,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: SettingsScreenDesign.rowGap,
        children: [
          Text(
            item.label(value),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          TvSlider(
            value: value.toDouble(),
            min: values.first.toDouble(),
            max: values.last.toDouble(),
            divisions: values.length - 1,
            step: 1,
            wraps: item.wrapSlider,
            focusNode: sliderNode,
            autofocus: true,
            onChanged: (nextValue) => onPreferencesChanged(
              item.writeNormalized(preferences, nextValue.round()),
            ),
          ),
        ],
      ),
    );
  }
}
