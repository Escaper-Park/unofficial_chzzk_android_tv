import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dashboard/dashboard_screen.dart';
import './widgets/setting_widgets.dart';
import 'settings_detail_screen.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final settingMenuFSN = useFocusScopeNode();
    final contentScreenFSN = useFocusScopeNode();

    return DashboardScreen(
      sidebarFSN: sidebarFSN,
      contentScreenFSN: settingMenuFSN,
      contentScreen: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // setting menu
                  SettingMenuList(
                    settingMenuFSN: settingMenuFSN,
                    sidebarFSN: sidebarFSN,
                    contentScreenFSN: contentScreenFSN,
                  ),
                  const SizedBox(width: 20.0),
                  const SizedBox(width: 20.0),
                  // detail screen
                  Expanded(
                    child: SettingsDetailScreen(
                      sidebarFSN: sidebarFSN,
                      settingMenuFSN: settingMenuFSN,
                      contentScreenFSN: contentScreenFSN,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20.0),
            // App Info
            const AppInfo(),
          ],
        ),
      ),
    );
  }
}
