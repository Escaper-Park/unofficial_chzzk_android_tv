import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../utils/router/app_router.dart';
import '../../common/custom_outline_button.dart';
import '../../common/header_text.dart';
import '../dashboard/dashboard_screen.dart';
import 'widgets/chat_delay_setting.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DashboardScreen(
      currentScreenIndex: 4,
      screen: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(
              text: '채팅 딜레이',
              fontSize: 18.0,
            ),
            const ChatDelaySetting(),
            const HeaderText(
              text: '오픈소스 라이선스',
              fontSize: 18.0,
            ),
            CustomOutlineButton(
              autofocus: true,
              padding: const EdgeInsets.all(10.0),
              onPressed: () {
                context.push(AppRoute.license.routePath);
              },
              child: const Text(
                '보기',
                style: TextStyle(
                  fontSize: 14.0,
                  color: AppColors.chzzkColor,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
