import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../setting/model/chat_settings.dart';
import '../model/base_chat.dart';
import '../model/chat.dart';
import '../model/recent_chat.dart';
import 'chat_container.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chatList,
    required this.chatSettings,
  });

  /// List of chat.
  final List<dynamic> chatList;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    final opacity = (100 - chatSettings.entireChatContainerTransparency) * 0.01;

    return RoundedContainer(
      backgroundColor: chatSettings.entireChatContainerTransparency == 100
          ? Colors.transparent
          : AppColors.blackColor.withOpacity(opacity),
      padding: chatSettings.entireChatContainerTransparency == 100
          ? EdgeInsets.zero
          : const EdgeInsets.all(3.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        // Don't save previous chats to memory for performance.
        addAutomaticKeepAlives: false,
        // Set this false for performance.
        addRepaintBoundaries: false,
        // Don't use.
        addSemanticIndexes: false,
        // Set this to 'true' to make the chat appear from bottom to top.
        reverse: true,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final bdy = chatList[index];

          String msg = '';
          Profile? profile;
          Extras? extras;
          int ctime = 0;

          // Normal Chat
          if (bdy is ChatBdy) {
            msg = bdy.msg;
            profile = bdy.profile;
            extras = bdy.extras;
            ctime = bdy.ctime;
          }
          // Recent Chat
          else if (bdy is RecentChatMsg) {
            msg = bdy.content;
            profile = bdy.profile;
            extras = bdy.extras;
            ctime = bdy.createTime;
          }

          final BaseChat chat = BaseChat(
            msg: msg,
            profile: profile,
            extras: extras,
            ctime: ctime,
          );

          return Padding(
            padding: EdgeInsets.only(
              top: chatSettings.chatContainerVerticalMargin.toDouble(),
            ),
            child: ChatContainer(
              chat: chat,
              chatSettings: chatSettings,
            ),
          );
        },
      ),
    );
  }
}
