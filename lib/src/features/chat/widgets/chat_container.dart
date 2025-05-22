import 'package:flutter/material.dart';

import '../../../utils/extensions/extensions.dart';
import '../../../common/constants/styles.dart';
import '../../settings/model/chat_settings.dart';
import '../model/base_chat.dart';
import 'chat_container_base.dart';

class ChatContainer extends StatelessWidget {
  /// A single chat container.
  const ChatContainer({
    super.key,
    required this.chat,
    required this.chatSettings,
  });

  final BaseChat chat;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    final Color nicknameColor =
        _getNicknameColor(chat.profile?.nickname ?? '익명');

    final chatTime = chat.ctime < 62000000
        ? chat.ctime.playerMessageTimeToHms()
        : chat.ctime.timestampToHHmm();

    return ChatContainerBase(
      chat: chat,
      chatSettings: chatSettings,
      nickname: chat.profile?.nickname ?? '익명',
      nicknameColor: nicknameColor,
      backgroundColor: AppColors.blackColor,
      chatTime: chatTime,
    );
  }

  /// Get nickname color calculated by nickname
  Color _getNicknameColor(String nickname) {
    int colorIndex = nickname.runes.reduce((a, b) => a + b) % 50;

    return AppColors.nicknameColors[colorIndex];
  }
}
