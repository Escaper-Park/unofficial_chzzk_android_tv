import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/app_version.dart';
import '../../common/widgets/focused_outline_button.dart';
import '../../common/widgets/header_text.dart';
import '../../utils/popup/popup_utils.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/dashboard_screen.dart';
import './controller/update_controller.dart';

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
            _functionButton(
              autofocus: true,
              '보기',
              () {
                context.pushNamed(AppRoute.license.routeName);
              },
            ),
            const Divider(),
            const HeaderText(
              text: 'WebView 로그인',
              fontSize: 18.0,
            ),
            _functionButton(
              'WebView 로그인',
              () {
                context.pushNamed(AppRoute.naverLoginWithWebView.routeName);
              },
            ),
            const Divider(),
            const HeaderText(
              text: '앱 버전: ${AppVersion.version}',
              fontSize: 18.0,
            ),
            Consumer(
              builder: (context, ref, child) {
                return _functionButton(
                  '업데이트 확인',
                  () async {
                    final latestVersion = await ref
                        .read(updateControllerProvider.notifier)
                        .checkUpdate();

                    final supportedAbis = await ref
                        .read(updateControllerProvider.notifier)
                        .findSupportedABI();

                    String msg =
                        '새로운 업데이트가 있습니다. GitHub Repository를 방문해주세요.\nhttps://github.com/Escaper-Park/unofficial_chzzk_android_tv\n지원 ABI: $supportedAbis';
                    if (latestVersion == 'error' && context.mounted) {
                      await PopupUtils.showSingleDialog(
                        context: context,
                        titleText: '업데이트 확인 오류',
                        contentText: '오류 발생',
                      );

                      return;
                    }

                    if (latestVersion == AppVersion.version &&
                        context.mounted) {
                      await PopupUtils.showSingleDialog(
                        context: context,
                        titleText: '최신 버전',
                        contentText: '최신 버전을 사용 중입니다',
                      );

                      return;
                    }

                    if (latestVersion != AppVersion.version &&
                        context.mounted) {
                      await PopupUtils.showSingleDialog(
                        context: context,
                        titleText: '업데이트 발견: $latestVersion',
                        contentHeight: 200.0,
                        contentText: msg,
                      );

                      return;
                    }
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _functionButton(
    String text,
    VoidCallback onPressed, {
    bool autofocus = false,
  }) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: FocusedOutlineButton(
        padding: const EdgeInsets.all(10.0),
        autofocus: autofocus,
        onPressed: onPressed,
        child: Text(text),
      ),
    );
  }
}
