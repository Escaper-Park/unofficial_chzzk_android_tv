import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/app_version.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/center_widgets.dart';
import '../../../../common/widgets/header_text.dart';
import '../../controller/update_controller.dart';
import 'update_log_markdown.dart';

class UpdateScreen extends ConsumerWidget {
  const UpdateScreen({
    super.key,
    required this.settingMenuFSN,
  });

  final FocusScopeNode settingMenuFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncUpdate = ref.watch(updateControllerProvider);

    return asyncUpdate.when(
      data: (update) {
        final String msg = AppVersion.version == update.$1
            ? '최신 버전을 사용 중입니다\n현재 버전 [${update.$1}]'
            : '새로운 업데이트가 있습니다. [${update.$1}] \nGitHub Repository를 방문해주세요. \nhttps://github.com/Escaper-Park/unofficial_chzzk_android_tv';

        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(text: '업데이트 알림'),
              const Divider(),
              const SizedBox(height: 16.0),
              Text(
                msg,
                style: const TextStyle(
                  fontSize: 16.0,
                  color: AppColors.whiteColor,
                ),
              ),
              const SizedBox(height: 10.0),
              const HeaderText(text: '업데이트 내용'),
              const Divider(),
              Expanded(
                child: UpdateLogMarkdown(
                  log: update.$2,
                  settingMenuFSN: settingMenuFSN,
                ),
              ),
            ],
          ),
        );
      },
      error: (error, stackTrace) => const CenteredText(text: '업데이트 확인 오류'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
