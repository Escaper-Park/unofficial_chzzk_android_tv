import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/app_version.dart' show AppVersion;
import '../../../../common/constants/enums.dart' show DpadAction;
import '../../../../common/constants/styles.dart' show AppColors;
import '../../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadFocusScopeNavigator;
import '../../../../common/widgets/ui/ui_widgets.dart' show CenteredText;
import '../../widgets/settings_widgets.dart' show UpdateLogMarkdown;
import '../../settings_state.dart';

class SettingsDetailUpdate extends HookConsumerWidget with SettingsState {
  const SettingsDetailUpdate({
    super.key,
    required this.settingMenuFSN,
    required this.updateDetailFSN,
  });

  final FocusScopeNode settingMenuFSN;
  final FocusScopeNode updateDetailFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdate = getAsyncUpdate(ref);
    final focusNode = useFocusNode();

    return switch (asyncUpdate) {
      AsyncData(:final value) => value == null
          ? const CenteredText(text: '업데이트 정보를 불러올 수 없습니다')
          : DpadFocusScopeNavigator(
              node: updateDetailFSN,
              onFocusChange: (value) {
                if (value) focusNode.requestFocus();
              },
              dpadKeyNodeMap: {DpadAction.arrowLeft: settingMenuFSN},
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _updateAlert(value.$1),
                  _paddedDivider(),
                  Expanded(
                    child: UpdateLogMarkdown(
                      log: value.$2,
                      focusNode: focusNode,
                      settingMenuFSN: settingMenuFSN,
                    ),
                  ),
                ],
              ),
            ),
      AsyncError() => const CenteredText(text: '업데이트 정보를 불러올 수 없습니다'),
      _ => const SizedBox.shrink(),
    };
  }

  Widget _paddedDivider() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: const Divider(),
    );
  }

  Widget _updateAlert(String version) {
    final String msg = AppVersion.version == version
        ? '최신 버전을 사용 중입니다\n현재 버전 [$version]'
        : '새로운 업데이트가 있습니다. [$version] \nGitHub Repository를 방문해주세요. \nhttps://github.com/Escaper-Park/unofficial_chzzk_android_tv';
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        msg,
        style: TextStyle(
          fontSize: 14.0,
          color: AppColors.whiteColor,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
