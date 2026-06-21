import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../domain/entities/chat.dart';
import 'player_chat_message_bubble.dart';
import 'player_chat_panel_design.dart';
import 'player_chat_panel_style.dart';
import 'player_chat_strings.dart';

class PlayerChatPanel extends StatelessWidget {
  const PlayerChatPanel({
    super.key,
    required this.messages,
    this.title = PlayerChatString.title,
    this.showTitle = true,
    this.statusText,
    this.style = const PlayerChatPanelStyle(),
    this.filterDonations = true,
  });

  final List<PlayerChatMessage> messages;
  final String title;
  final bool showTitle;
  final String? statusText;
  final PlayerChatPanelStyle style;
  final bool filterDonations;

  @override
  Widget build(BuildContext context) {
    final content = Padding(
      padding: style.panelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (showTitle && title.isNotEmpty) ...[
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PlayerChatPanelDesign.titleTextStyle,
            ),
            const SizedBox(height: 10),
          ],
          Expanded(
            child: _PlayerChatMessageList(
              messages: filterDonations
                  ? playerChatVisibleMessages(messages, style: style)
                  : messages,
              statusText: statusText,
              style: style,
            ),
          ),
        ],
      ),
    );

    if (!style.showPanelContainer) {
      return content;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: style.panelColor,
        borderRadius: BorderRadius.circular(style.panelRadius),
        border: Border.all(color: style.panelBorderColor),
      ),
      child: content,
    );
  }
}

List<PlayerChatMessage> playerChatVisibleMessages(
  List<PlayerChatMessage> messages, {
  required PlayerChatPanelStyle style,
}) {
  if (style.showDonation) {
    return messages;
  }

  return messages
      .where((message) => !message.isDonation)
      .toList(growable: false);
}

List<PlayerChatMessage> playerChatBadgeCollectorMessages(
  List<PlayerChatMessage> messages, {
  int maxItems = 80,
}) {
  final collected = <PlayerChatMessage>[];

  for (final message in messages.reversed) {
    if (!message.isBadgeCollectorProfile) {
      continue;
    }

    collected.add(message);
    if (collected.length >= maxItems) {
      break;
    }
  }

  return collected.reversed.toList(growable: false);
}

class _PlayerChatMessageList extends StatelessWidget {
  const _PlayerChatMessageList({
    required this.messages,
    required this.statusText,
    required this.style,
  });

  final List<PlayerChatMessage> messages;
  final String? statusText;
  final PlayerChatPanelStyle style;

  @override
  Widget build(BuildContext context) {
    if (messages.isEmpty) {
      final text = statusText?.trim();
      if (text == null || text.isEmpty) {
        return const SizedBox.shrink();
      }

      return Center(
        child: Text(
          text,
          textAlign: TextAlign.center,
          style: PlayerChatPanelDesign.metaTextStyle.copyWith(
            fontSize: math.max(1, style.messageFontSize - 2),
          ),
        ),
      );
    }

    final displayCount = math.min(messages.length, style.maxRenderedMessages);
    final firstDisplayIndex = messages.length - displayCount;

    return ListView.separated(
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      addSemanticIndexes: false,
      itemCount: displayCount,
      itemBuilder: (context, index) {
        final message = messages[firstDisplayIndex + displayCount - 1 - index];
        return KeyedSubtree(
          key: ValueKey(message.id),
          child: PlayerChatMessageBubble(
            message: message,
            style: style,
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: math.max(0.0, style.messageGap));
      },
    );
  }
}
