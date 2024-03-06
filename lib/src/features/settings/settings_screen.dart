import 'package:flutter/material.dart';

import '../../common/widgets/focused_outline_button.dart';
import '../../common/widgets/header_text.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/dashboard_screen.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      screen: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(
              text: '오픈소스 라이선스',
              fontSize: 18.0,
            ),
            FocusedOutlineButton(
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                context.pushNamed(AppRoute.license.routeName);
              },
              child: const Text('보기'),
            ),
            const HeaderText(
              text: '앱 버전',
              fontSize: 18.0,
            ),
            const Text('v0.2.0-release'),
          ],
        ),
      ),
    );
  }
}
