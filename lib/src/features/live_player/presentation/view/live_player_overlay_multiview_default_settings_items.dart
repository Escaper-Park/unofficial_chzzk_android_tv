import 'package:flutter/material.dart';

import '../../../settings/domain/entities/settings_preferences.dart';
import '../../../settings/presentation/models/settings_preference_groups.dart';

final liveOverlayMultiviewDefaultSettingItems = <SettingsPreferenceItem>[
  for (final ref in _liveOverlayMultiviewDefaultSettingRefs)
    settingsPreferenceByRef(ref)!,
];

int get liveOverlayMultiviewDefaultSettingCount =>
    liveOverlayMultiviewDefaultSettingItems.length;

IconData liveOverlayMultiviewDefaultSettingIcon(
  SettingsPreferenceItem item,
) {
  return item.actionIcon ?? Icons.tune;
}

const _liveOverlayMultiviewDefaultSettingRefs = <SettingsPreferenceRef>[
  SettingsPreferenceRef(category: SettingsCategoryId.multiview, index: 4),
  SettingsPreferenceRef(category: SettingsCategoryId.multiview, index: 5),
  SettingsPreferenceRef(category: SettingsCategoryId.multiview, index: 7),
  SettingsPreferenceRef(category: SettingsCategoryId.multiview, index: 8),
  SettingsPreferenceRef(category: SettingsCategoryId.multiview, index: 9),
];
