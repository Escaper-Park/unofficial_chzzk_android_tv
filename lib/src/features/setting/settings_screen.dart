import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../dashboard/dashboard_screen.dart';

class SettingsScreen extends HookConsumerWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final contentScreenFSN = useFocusScopeNode();

    return DashboardScreen(
      sidebarFSN: sidebarFSN,
      contentScreenFSN: contentScreenFSN,
      contentScreen: Container(),
    );
  }
}
