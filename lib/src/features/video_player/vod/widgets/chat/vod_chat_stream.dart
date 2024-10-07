import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:video_player/video_player.dart';

import '../../../../../common/widgets/center_widgets.dart';
import '../../../../chat/widgets/badge_collector.dart';
import '../../../../chat/widgets/chat_list.dart';
import '../../../../setting/controller/chat_settings_controller.dart';
import '../../../../setting/model/chat_settings.dart';
import '../../../../vod/model/vod_chat.dart';
import '../../../common/chat/chat_window_mode.dart';
import '../../controller/vod_chat_controller.dart';

class VodChatStream extends ConsumerWidget {
  const VodChatStream({
    super.key,
    required this.controller,
    required this.chatWindowMode,
  });

  final VideoPlayerController controller;
  final ChatWindowMode chatWindowMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final chatStream =
        ref.watch(vodChatControllerProvider(controller: controller));

    ChatSettings chatSettings = ref.watch(chatSettingsControllerProvider);

    if (chatWindowMode == ChatWindowMode.side) {
      chatSettings = chatSettings.copyWith(
        entireChatContainerTransparency: 100,
        singleChatContainerTransparency: 100,
      );
    }

    // For Positioned
    final screenSize = MediaQuery.of(context).size;
    final overlayChatContainerWidth =
        screenSize.width * chatSettings.chatContainerWidth * 0.01;
    final overlayChatContainerHeight =
        screenSize.height * chatSettings.chatContainerHeight * 0.01;

    final overlayChatContainerPositionX =
        (screenSize.width - overlayChatContainerWidth) *
            chatSettings.chatPositionX *
            0.01;
    final overlayChatContainerPositionY =
        (screenSize.height - overlayChatContainerHeight) *
            chatSettings.chatPositionY *
            0.01;

    return chatWindowMode == ChatWindowMode.side
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: _chatStream(chatStream, chatSettings),
          )
        : Positioned(
            width: overlayChatContainerWidth,
            height: overlayChatContainerHeight,
            left: overlayChatContainerPositionX,
            top: overlayChatContainerPositionY,
            child: _chatStream(chatStream, chatSettings),
          );
  }

  Widget _chatStream(
    AsyncValue<List<VodChat>> chatStream,
    ChatSettings chatSettings,
  ) {
    return chatStream.when(
      data: (chatList) {
        final badgesChatList = chatList.where((chat) {
          return (chat.profile != null &&
                  chat.profile?.userRoleCode != "common_user") ||
              (chat.profile?.verifiedMark == true);
        }).toList();

        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Normal chat
            if (chatSettings.badgeCollectorHeight != 100)
              Expanded(
                flex: 100 - chatSettings.badgeCollectorHeight,
                child: ChatList(
                  chatList: chatList,
                  chatSettings: chatSettings,
                ),
              ),
            if (chatSettings.useBadgeCollector == 1 &&
                chatWindowMode == ChatWindowMode.side)
              const Divider(),
            if (chatSettings.useBadgeCollector == 1)
              // Badge Collector
              Expanded(
                flex: chatSettings.badgeCollectorHeight,
                child: Padding(
                  padding: const EdgeInsets.only(top: 5.0),
                  child: BadgeCollector(
                    chatList: badgesChatList,
                    chatSettings: chatSettings,
                  ),
                ),
              ),
          ],
        );
      },
      error: (e, __) => CenteredText(text: '다시보기 채팅 불러오기 실패\n $e'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
