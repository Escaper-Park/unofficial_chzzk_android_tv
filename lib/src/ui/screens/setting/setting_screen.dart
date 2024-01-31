import 'package:flutter/material.dart';

import '../../../utils/router/app_router.dart';
import '../dashboard/dashboard_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      currentScreenIndex: 4,
      screen: Center(
        child: ElevatedButton(
          autofocus: true,
          onPressed: () {
            context.push(AppRoute.license.routePath);
          },
          child: const Text('오픈소스 라이선스'),
        ),
      ),
    );
  }
}
