import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './controller/setting_screen_controller.dart';
import 'widgets/chat/chat_settings_screen.dart';
import 'widgets/licences/licenses.dart';
import 'widgets/streaming/stream_settings_screen.dart';
import 'widgets/update/update_screen.dart';
import 'widgets/webview_login/webview_login_screen.dart';

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
      StreamSettingsScreen(settingMenuFSN: settingMenuFSN),
      ChatSettingsScreen(settingMenuFSN: settingMenuFSN),
      const UpdateScreen(),
      const WebviewLoginScreen(),
      OpenSourceLicencesScreen(settingMenuFSN: settingMenuFSN),
    ];

    return FocusScope(
      node: contentScreenFSN,
      child: screens[settingScreenIndex],
    );
  }
}
