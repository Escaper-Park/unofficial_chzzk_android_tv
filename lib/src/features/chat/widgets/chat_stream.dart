import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/ui/ui_widgets.dart';
import '../../../utils/extensions/custom_extensions.dart';
import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../settings/model/chat_settings.dart';
import 'badge_collector.dart';
import 'chat_list.dart';

class ChatStream extends StatelessWidget {
  const ChatStream({
    super.key,
    required this.chatStream,
    required this.chatWindowMode,
    required this.chatSettings,
  });

  final AsyncValue<List<dynamic>> chatStream;
  final ChatWindowMode chatWindowMode;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    // For Positioned
    final overlayChatContainerWidth =
        context.screenWidth * chatSettings.chatContainerWidth * 0.01;
    final overlayChatContainerHeight =
        context.screenHeight * chatSettings.chatContainerHeight * 0.01;

    final overlayChatContainerPositionX =
        (context.screenWidth - overlayChatContainerWidth) *
            chatSettings.chatPositionX *
            0.01;
    final overlayChatContainerPositionY =
        (context.screenHeight - overlayChatContainerHeight) *
            chatSettings.chatPositionY *
            0.01;

    return chatWindowMode == ChatWindowMode.side
        ? Padding(
            padding: const EdgeInsets.all(10.0),
            child: _chatWidget(
              chatStream,
              chatSettings,
            ),
          )
        : Positioned(
            width: overlayChatContainerWidth,
            height: overlayChatContainerHeight,
            left: overlayChatContainerPositionX,
            top: overlayChatContainerPositionY,
            child: _chatWidget(
              chatStream,
              chatSettings,
            ),
          );
  }

  Widget _chatWidget(
    AsyncValue<List<dynamic>> chatStream,
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
                  chatWindowMode: chatWindowMode,
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
                    chatWindowMode: chatWindowMode,
                  ),
                ),
              ),
          ],
        );
      },
      error: (_, __) => const CenteredText(text: '채팅을 불러올 수 없습니다'),
      loading: () => const SizedBox.shrink(),
    );
  }
}
