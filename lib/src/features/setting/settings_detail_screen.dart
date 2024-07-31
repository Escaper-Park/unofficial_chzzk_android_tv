import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './controller/setting_screen_controller.dart';
import 'widgets/licenses_screen.dart';

class SettingsDetailScreen extends ConsumerWidget {
  const SettingsDetailScreen({
    super.key,
    required this.sidebarFSN,
    required this.settingMenuFSN,
    required this.contentScreenFSN,
  });

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode contentScreenFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final settingScreenIndex = ref.watch(settingScreenControllerProvider);

    final List<Widget> screens = [
      Container(),
      Container(),
      Container(),
      OpenSourceLicencesScreen(settingMenuFSN: settingMenuFSN),
    ];

    return FocusScope(
      node: contentScreenFSN,
      child: screens[settingScreenIndex],
    );
  }
}
