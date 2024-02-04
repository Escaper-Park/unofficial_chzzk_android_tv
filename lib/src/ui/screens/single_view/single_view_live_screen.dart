import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../constants/styles.dart';
import '../../../controller/setting/setting_controller.dart';
import '../../../model/setting/chat_setting.dart';
import '../../../utils/video_player/network_video_controller.dart';
import './widgets/single_view_chat.dart';
import './widgets/single_view_video_live.dart';

class SingleViewLiveScreen extends ConsumerWidget {
  const SingleViewLiveScreen({
    super.key,
    required this.videoPath,
    required this.channelId,
    required this.chatChannelId,
    required this.openDate,
  });

  final String videoPath;
  final String channelId;
  final String chatChannelId;
  final String openDate;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final SingleViewScreenMode screenMode =
        ref.watch(singleViewScreenControllerProvider);

    final ChatSetting chatSetting = ref.watch(chatSettingControllerProvider);

    final double opacity = (1.0 - chatSetting.chatContainerTransparency * 0.01);
    final int chatContainerHeight = chatSetting.chatContainerHeight;
    final int chatContainerWidth = chatSetting.chatContainerWidth;
    final int chatPositionIndex = chatSetting.chatPosition;

    final double maxHeight = MediaQuery.of(context).size.height;
    final double maxWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Stack(
        children: [
          Row(
            children: [
              Expanded(
                flex: 3,
                child: SingleViewVideoLive(
                  videoPath: videoPath,
                  openDate: openDate,
                  channelId: channelId,
                ),
              ),
              if (screenMode == SingleViewScreenMode.chat)
                Expanded(
                  flex: 1,
                  child: SizedBox(
                    height: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SingleViewChat(
                        channelId: channelId,
                        chatChannelId: chatChannelId,
                        fontSize: chatSetting.fontSize.toDouble(),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          if (screenMode == SingleViewScreenMode.overlayChat)
            Align(
              alignment: ChatPositionData.dataList[chatPositionIndex].$4,
              child: Container(
                color: AppColors.blackColor.withOpacity(opacity),
                width: maxWidth * chatContainerWidth * 0.01,
                height: maxHeight * chatContainerHeight * 0.01,
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: SingleViewChat(
                    channelId: channelId,
                    chatChannelId: chatChannelId,
                    fontSize: chatSetting.fontSize.toDouble(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
