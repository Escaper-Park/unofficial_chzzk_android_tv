import 'package:flutter/material.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../settings/model/chat_settings.dart';
import 'chat_list.dart';

class BadgeCollector extends StatelessWidget {
  /// Show only manager or streamer or something
  const BadgeCollector({
    super.key,
    required this.chatList,
    required this.chatSettings,
    required this.chatWindowMode,
  });

  /// List of chat.
  final List<dynamic> chatList;

  /// Chat Settings
  final ChatSettings chatSettings;

  final ChatWindowMode chatWindowMode;

  @override
  Widget build(BuildContext context) {
    return ChatList(
      chatList: chatList,
      chatSettings: chatSettings.copyWith(showNickname: 1),
      chatWindowMode: chatWindowMode,
    );
  }
}
