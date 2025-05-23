import 'package:flutter/material.dart';

import '../../../common/constants/enums.dart' show ChatWindowMode;
import '../../settings/model/chat_settings.dart';
import '../../vod/model/vod_chat.dart';
import '../model/chat.dart';
import '../model/recent_chat.dart';
import 'chat_list.dart';

class BadgeCollector extends StatefulWidget {
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
  State<BadgeCollector> createState() => _BadgeCollectorState();
}

class _BadgeCollectorState extends State<BadgeCollector> {
  final List<dynamic> _badgeCache = [];
  final Set<String> _seenCtime = {};
  final int _maxHistory = 200;

  @override
  void didUpdateWidget(covariant BadgeCollector oldWidget) {
    super.didUpdateWidget(oldWidget);

    final List<dynamic> newBadgeChat = [];

    if (widget.chatList.isEmpty) return;

    for (final msg in widget.chatList) {
      final ctimeKey = _extractCtimeKey(msg);

      if (!_seenCtime.contains(ctimeKey)) {
        _seenCtime.add(ctimeKey);
        newBadgeChat.add(msg);
      }
    }

    if (newBadgeChat.isNotEmpty) {
      setState(() {
        _badgeCache.insertAll(0, newBadgeChat);

        if (_badgeCache.length > _maxHistory) {
          _badgeCache.removeRange(_maxHistory, _badgeCache.length);
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChatList(
      chatList: _badgeCache,
      chatSettings: widget.chatSettings.copyWith(showNickname: 1),
      chatWindowMode: widget.chatWindowMode,
    );
  }

  String _extractCtimeKey(dynamic msg) {
    // Chat, Donation
    int ctime = 0;
    if (msg is ChatBdy) {
      ctime = msg.ctime;
    } else if (msg is RecentChatMsg) {
      ctime = msg.createTime;
    } else if (msg is VodChat) {
      ctime = msg.playerMessageTime;
    } else {
      ctime = 0;
    }
    final ctimeKey = ctime.toString();
    return ctimeKey;
  }
}
