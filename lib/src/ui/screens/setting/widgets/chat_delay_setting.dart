import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/setting/setting_controller.dart';
import '../../../../utils/video_player/common/control_icon.dart';

class ChatDelaySetting extends HookConsumerWidget {
  const ChatDelaySetting({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatDelaySec =
        ref.read(settingControllerProvider.notifier).getChatDelaySec();

    final chatDelyState = useState<int>(chatDelaySec);

    const int interval = 1;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            width: 45.0,
            child: Text(
              '${chatDelyState.value}초',
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          ControlIcon(
            iconData: Icons.arrow_upward_rounded,
            onPressed: () {
              final value = chatDelaySec + interval;
              if (value <= 15 && value >= 0) {
                chatDelyState.value = value;

                ref
                    .read(settingControllerProvider.notifier)
                    .setChatDelaySec(value);
              }
            },
          ),
          const SizedBox(width: 5.0),
          ControlIcon(
            iconData: Icons.arrow_downward_rounded,
            onPressed: () {
              final value = chatDelaySec - interval;

              if (value <= 15 && value >= 0) {
                chatDelyState.value = value;

                ref
                    .read(settingControllerProvider.notifier)
                    .setChatDelaySec(value);
              }
            },
          ),
        ],
      ),
    );
  }
}
