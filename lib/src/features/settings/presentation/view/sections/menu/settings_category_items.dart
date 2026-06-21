import 'package:flutter/material.dart';

import '../../../../domain/entities/settings_preferences.dart';

final class SettingsCategoryItem {
  const SettingsCategoryItem({
    required this.category,
    required this.icon,
  });

  final SettingsCategoryId category;
  final IconData icon;
}

const settingsCategoryItems = <SettingsCategoryItem>[
  SettingsCategoryItem(
    category: SettingsCategoryId.general,
    icon: Icons.settings,
  ),
  SettingsCategoryItem(
    category: SettingsCategoryId.liveStreaming,
    icon: Icons.live_tv,
  ),
  SettingsCategoryItem(
    category: SettingsCategoryId.multiview,
    icon: Icons.view_quilt,
  ),
  SettingsCategoryItem(
    category: SettingsCategoryId.vodStreaming,
    icon: Icons.video_library,
  ),
  SettingsCategoryItem(category: SettingsCategoryId.chat, icon: Icons.chat),
  SettingsCategoryItem(
    category: SettingsCategoryId.updates,
    icon: Icons.system_update,
  ),
  SettingsCategoryItem(category: SettingsCategoryId.faq, icon: Icons.help),
  SettingsCategoryItem(category: SettingsCategoryId.appInfo, icon: Icons.info),
];

IconData settingsCategoryIcon(SettingsCategoryId category) {
  return settingsCategoryItems
      .singleWhere((item) => item.category == category)
      .icon;
}
