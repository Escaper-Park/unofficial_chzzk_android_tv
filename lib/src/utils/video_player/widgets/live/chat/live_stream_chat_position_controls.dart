import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/header_text.dart';
import '../../../../../features/chat/controller/chat_settings_controller.dart';
import '../../../../../features/chat/model/chat_settings.dart';
import '../../../controller/network_video_controller.dart';
import '../../common/control_icon.dart';

class LiveStreamChatPositionControls extends ConsumerWidget {
  const LiveStreamChatPositionControls({
    super.key,
    required this.videoFocusNode,
    required this.buttonsFocusNode1,
    required this.buttonsFocusNode2,
  });

  final FocusNode videoFocusNode;
  final FocusNode buttonsFocusNode1;
  final FocusNode buttonsFocusNode2;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatPositionIndex = ref.watch(chatSettingsControllerProvider
        .select((setting) => setting.chatPosition));
    final chatPositionData = ChatPositionData.chatPositionsData;

    const int interval = 1;

    return SizedBox(
      height: 120.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(text: '채팅창 위치'),
          Expanded(
            child: Row(
              children: [
                SizedBox(
                  width: 50.0,
                  child: Transform.flip(
                    flipX: chatPositionData[chatPositionIndex].isFlipX,
                    flipY: chatPositionData[chatPositionIndex].isFlipY,
                    child: Icon(
                      chatPositionData[chatPositionIndex].iconData,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
                const SizedBox(width: 10.0),
                ControlIcon(
                  autofocus: true,
                  focusNode: buttonsFocusNode1,
                  iconData: Icons.arrow_back_rounded,
                  onPressed: () {
                    ref
                        .read(controlOverlayTimerProvider.notifier)
                        .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.chatSettings,
                        );
                    ref
                        .read(chatSettingsControllerProvider.notifier)
                        .setChatPosition(chatPositionIndex - interval);
                  },
                ),
                const SizedBox(width: 5.0),
                ControlIcon(
                  iconData: Icons.arrow_forward_rounded,
                  focusNode: buttonsFocusNode2,
                  onPressed: () {
                    ref
                        .read(controlOverlayTimerProvider.notifier)
                        .showOverlayAndStartTimer(
                          videoFocusNode: videoFocusNode,
                          overlayType: OverlayType.chatSettings,
                        );

                    ref
                        .read(chatSettingsControllerProvider.notifier)
                        .setChatPosition(chatPositionIndex + interval);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
