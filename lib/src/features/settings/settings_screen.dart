import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/app_version.dart' show AppVersion;
import '../../common/constants/dimensions.dart';
import '../../common/constants/styles.dart' show AppColors;
import '../../common/widgets/dpad/dpad_list_view.dart';
import '../../common/widgets/ui/ui_widgets.dart' show CenteredText, HeaderText;
import '../../utils/hooks/custom_hooks.dart';
import '../dashboard/widgets/dashboard_widgets.dart'
    show InheritedSidebarFocusScope;
import 'widgets/detail_screen/detail_screens.dart';
import 'widgets/settings_widgets.dart' show SettingMenuCard;

import 'settings_event.dart';
import 'settings_state.dart';

part 'widgets/screen/settings_body.dart';
part 'widgets/screen/settings_app_info.dart';
part 'widgets/screen/settings_menu_list.dart';
part 'widgets/screen/settings_detail.dart';

class SettingsScreen extends HookConsumerWidget
    with SettingsEvent, SettingsState {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nodes = useFocusNodes(6);

    final sidebarFSN = InheritedSidebarFocusScope.of(context);
    final settingMenuFSN = useFocusScopeNode();
    final detailScreenFSN = useFocusScopeNode();

    final licenseDetailFSN = useFocusScopeNode();

    final currentIndex = getCurrentSettingMenuIndex(ref);

    return _SettingsBody(
      settingMenuList: _SettingsMenuList(
        currentIndex: currentIndex,
        focusNodes: nodes,
        settingMenuFSN: settingMenuFSN,
        sidebarFSN: sidebarFSN,
        detailScreenFSN: detailScreenFSN,
        onPressed: (index) => changeScreenIndex(ref, index: index),
      ),
      settingDetail: _SettingsDetail(
        currentIndex: currentIndex,
        detailScreenFSN: detailScreenFSN,
        settingMenuFSN: settingMenuFSN,
        detailFSN: licenseDetailFSN,
      ),
      appInfo: _SettingsAppInfo(),
    );
  }
}
