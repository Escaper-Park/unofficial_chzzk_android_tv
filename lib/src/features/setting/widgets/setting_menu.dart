import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../utils/router/app_router.dart';
import '../../dashboard/controller/dashboard_controller.dart';
import '../controller/setting_screen_controller.dart';

class SettingMenuList extends ConsumerWidget {
  const SettingMenuList({
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
    final currentIndex = ref.watch(settingScreenControllerProvider);

    final List<String> itemData = [
      '스트리밍 설정',
      '채팅 설정',
      '업데이트 확인',
      '웹뷰 로그인',
      '오픈소스 라이선스',
    ];

    final List<SettingMenu> items = List.generate(
      itemData.length,
      (index) => SettingMenu(
        autofocus: index == 0 ? true : false,
        menuText: itemData[index],
        currentIndex: currentIndex,
        itemIndex: index,
        onPressed: index == 3
            ? () {
                ref
                    .read(dashboardControllerProvider.notifier)
                    .changeScreen(context, AppRoute.webviewLogin);
              }
            : () {
                ref
                    .read(settingScreenControllerProvider.notifier)
                    .setState(index);
              },
      ),
    );

    return DpadFocusScopeNavigator(
      node: settingMenuFSN,
      dpadKeyFocusScopeNodeMap: {
        DpadAction.arrowLeft: sidebarFSN,
        DpadAction.arrowRight: contentScreenFSN,
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}

class SettingMenu extends StatelessWidget {
  const SettingMenu({
    super.key,
    this.autofocus = false,
    required this.menuText,
    required this.currentIndex,
    required this.itemIndex,
    required this.onPressed,
  });

  final bool autofocus;
  final int currentIndex;
  final int itemIndex;
  final String menuText;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: (_) => Text(
        menuText,
        style: TextStyle(
          fontSize: 14.0,
          color: currentIndex == itemIndex
              ? AppColors.chzzkColor
              : AppColors.whiteColor,
        ),
      ),
    );
  }
}
