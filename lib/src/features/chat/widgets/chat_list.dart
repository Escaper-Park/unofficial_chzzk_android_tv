import 'package:flutter/material.dart';

import '../../../common/constants/enums.dart' show DonationType, ChatWindowMode;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart' show RoundedContainer;
import '../../settings/model/chat_settings.dart';
import '../../vod/model/vod_chat.dart';
import '../model/base_chat.dart';
import '../model/chat.dart';
import '../model/extras.dart';
import '../model/profile.dart';
import '../model/recent_chat.dart';
import 'chat_widgets.dart';

class ChatList extends StatelessWidget {
  const ChatList({
    super.key,
    required this.chatList,
    required this.chatSettings,
    required this.chatWindowMode,
  });

  final List<dynamic> chatList;
  final ChatSettings chatSettings;
  final ChatWindowMode chatWindowMode;

  @override
  Widget build(BuildContext context) {
    final int transparencyPercent =
        chatSettings.entireChatContainerTransparency;

    final double opacity = (100 - transparencyPercent) * 0.01;

    return RoundedContainer(
      backgroundColor: transparencyPercent == 100
          ? Colors.transparent
          : AppColors.blackColor.withOpacity(opacity),
      padding: transparencyPercent == 100
          ? EdgeInsets.zero
          : const EdgeInsets.all(3.0),
      child: ListView.builder(
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.only(
          top: chatSettings.chatContainerVerticalMargin.toDouble(),
          left: chatSettings.chatContainerHorizontalMargin.toDouble(),
          right: chatSettings.chatContainerHorizontalMargin.toDouble(),
        ),
        addAutomaticKeepAlives: false,
        addRepaintBoundaries: false,
        addSemanticIndexes: false,
        reverse: true,
        itemCount: chatList.length,
        itemBuilder: (context, index) {
          final bdy = chatList[index];

          String msg = '';
          Profile? profile;
          Extras? extras;
          int ctime = 0;
          int msgTypeCode = 1;

          // Chat, Donation
          if (bdy is ChatBdy) {
            msg = bdy.msg;
            profile = bdy.profile;
            extras = bdy.extras;
            ctime = bdy.ctime;
            msgTypeCode = bdy.msgTypeCode;
          }
          // Recent Chat
          else if (bdy is RecentChatMsg) {
            msg = bdy.content;
            profile = bdy.profile;
            extras = bdy.extras;
            ctime = bdy.createTime;
            msgTypeCode = bdy.messageTypeCode;
          }
          // Vod Chat
          else if (bdy is VodChat) {
            msg = bdy.content;
            profile = bdy.profile;
            extras = bdy.extras;
            ctime = bdy.playerMessageTime;
            msgTypeCode = bdy.messageTypeCode;
          }

          final BaseChat chat = BaseChat(
            msg: msg,
            profile: profile,
            extras: extras,
            ctime: ctime,
          );

          // chat
          if (msgTypeCode == 1) {
            return Padding(
              padding: EdgeInsets.only(
                top: chatSettings.chatContainerVerticalMargin.toDouble(),
              ),
              child: ChatContainer(
                chat: chat,
                chatSettings: chatWindowMode == ChatWindowMode.side
                    ? chatSettings.copyWith(
                        entireChatContainerTransparency: 100,
                        singleChatContainerTransparency: 100,
                      )
                    : chatSettings,
              ),
            );
          }
          // donation
          else if (msgTypeCode == 10) {
            String? donationType = extras?.donationType;

            // chat donation
            if (donationType == DonationType.chat.value) {
              return chatSettings.showDonation == 1
                  ? Padding(
                      padding: EdgeInsets.only(
                        top:
                            chatSettings.chatContainerVerticalMargin.toDouble(),
                      ),
                      child: DonationContainer(
                        chat: chat,
                        chatSettings: chatSettings,
                      ),
                    )
                  : const SizedBox.shrink();
            }
            // video, mission
            else {
              return const SizedBox.shrink();
            }
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
