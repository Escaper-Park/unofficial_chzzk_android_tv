import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/dpad_widgets.dart';
import '../../../common/widgets/focused_widget.dart';
import '../controller/setting_screen_controller.dart';

class SettingItems extends ConsumerWidget {
  const SettingItems({
    super.key,
    required this.settingMenuFSN,
    required this.sidebarFSN,
  });

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<String> itemData = [
      '스트리밍 설정',
      '채팅 설정',
      '업데이트 확인',
      '오픈소스 라이선스',
    ];

    final List<SettingItem> items = List.generate(
      itemData.length,
      (index) => SettingItem(
        autofocus: index == 0 ? true : false,
        menuText: itemData[index],
        onPressed: () {
          ref.read(settingScreenControllerProvider.notifier).setState(index);
        },
      ),
    );

    return DpadFocusScopeNavigator(
      node: settingMenuFSN,
      dpadKeyFocusScopeNodeMap: {DpadAction.arrowLeft: sidebarFSN},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items,
      ),
    );
  }
}

class SettingItem extends StatelessWidget {
  const SettingItem({
    super.key,
    this.autofocus = false,
    required this.menuText,
    required this.onPressed,
  });

  final bool autofocus;
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
        style: const TextStyle(
          fontSize: 14.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
