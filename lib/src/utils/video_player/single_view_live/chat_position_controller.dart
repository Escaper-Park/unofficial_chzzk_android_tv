import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../../../controller/setting/setting_controller.dart';
import '../../../model/setting/chat_setting.dart';
import '../common/control_icon.dart';
import '../network_video_controller.dart';

class ChatPositionController extends ConsumerWidget {
  const ChatPositionController({super.key, required this.videoFocusNode});

  final FocusNode videoFocusNode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatPositionIndex = ref.watch(
        chatSettingControllerProvider.select((value) => value.chatPosition));

    const int interval = 1;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        SizedBox(
          width: 50.0,
          child: Transform.flip(
            flipX: ChatPositionData.dataList[chatPositionIndex].$2,
            flipY: ChatPositionData.dataList[chatPositionIndex].$3,
            child: Icon(
              ChatPositionData.dataList[chatPositionIndex].$1,
              color: AppColors.chzzkColor,
            ),
          ),
        ),
        const SizedBox(width: 10.0),
        ControlIcon(
          autofocus: true,
          iconData: Icons.arrow_back_rounded,
          onPressed: () {
            ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
                  videoFocusNode: videoFocusNode,
                  controlType: ControlType.chat,
                );
            ref
                .read(chatSettingControllerProvider.notifier)
                .setChatPosition(chatPositionIndex - interval);
          },
        ),
        const SizedBox(width: 5.0),
        ControlIcon(
          iconData: Icons.arrow_forward_rounded,
          onPressed: () {
            ref.read(videoControlsTimerProvider.notifier).showControlsWithTimer(
                  videoFocusNode: videoFocusNode,
                  controlType: ControlType.chat,
                );

            ref
                .read(chatSettingControllerProvider.notifier)
                .setChatPosition(chatPositionIndex + interval);
          },
        ),
      ],
    );
  }
}
