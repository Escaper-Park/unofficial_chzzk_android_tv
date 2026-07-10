import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show ScrollCacheExtent;

import '../../domain/entities/chat.dart';
import 'player_chat_message_bubble.dart';
import 'player_chat_panel_design.dart';
import 'player_chat_panel_style.dart';
import 'player_chat_strings.dart';

class PlayerChatPanel extends StatefulWidget {
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
  State<PlayerChatPanel> createState() => _PlayerChatPanelState();
}

class _PlayerChatPanelState extends State<PlayerChatPanel> {
  List<PlayerChatMessage>? _displayMessages;
  List<PlayerChatMessage>? _displaySourceMessages;
  bool? _displayFilterDonations;
  bool? _displayShowDonation;
  int? _displayMaxRenderedMessages;

  @override
  Widget build(BuildContext context) {
    final style = widget.style;
    final messages = _displayMessagesFor(
      messages: widget.messages,
      style: style,
      filterDonations: widget.filterDonations,
    );
    final content = Padding(
      padding: widget.style.panelPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (widget.showTitle && widget.title.isNotEmpty) ...[
            Text(
              widget.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: PlayerChatPanelDesign.titleTextStyle,
            ),
            const SizedBox(height: 10),
          ],
          Expanded(
            child: _PlayerChatMessageList(
              messages: messages,
              statusText: widget.statusText,
              style: style,
            ),
          ),
        ],
      ),
    );

    if (!widget.style.showPanelContainer) {
      return content;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: widget.style.panelColor,
        borderRadius: BorderRadius.circular(widget.style.panelRadius),
        border: Border.all(color: widget.style.panelBorderColor),
      ),
      child: content,
    );
  }

  List<PlayerChatMessage> _displayMessagesFor({
    required List<PlayerChatMessage> messages,
    required PlayerChatPanelStyle style,
    required bool filterDonations,
  }) {
    if (identical(_displaySourceMessages, messages) &&
        _displayFilterDonations == filterDonations &&
        _displayShowDonation == style.showDonation &&
        _displayMaxRenderedMessages == style.maxRenderedMessages) {
      return _displayMessages ?? messages;
    }

    final nextMessages = _playerChatDisplayMessages(
      messages,
      style: style,
      filterDonations: filterDonations,
    );
    _displaySourceMessages = messages;
    _displayFilterDonations = filterDonations;
    _displayShowDonation = style.showDonation;
    _displayMaxRenderedMessages = style.maxRenderedMessages;
    _displayMessages = nextMessages;
    return nextMessages;
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

List<PlayerChatMessage> _playerChatDisplayMessages(
  List<PlayerChatMessage> messages, {
  required PlayerChatPanelStyle style,
  required bool filterDonations,
}) {
  if (!filterDonations || style.showDonation) {
    return messages;
  }

  final maxItems = math.max(0, style.maxRenderedMessages);
  if (maxItems == 0) {
    return const <PlayerChatMessage>[];
  }

  final collected = <PlayerChatMessage>[];
  for (final message in messages.reversed) {
    if (message.isDonation) {
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

    final itemIndexByMessageId = <String, int>{
      for (var index = 0; index < displayCount; index += 1)
        messages[firstDisplayIndex + displayCount - 1 - index].id: index,
    };
    int? findItemIndex(Key key) =>
        key is ValueKey<String> ? itemIndexByMessageId[key.value] : null;

    return ListView.separated(
      reverse: true,
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      scrollCacheExtent: const ScrollCacheExtent.pixels(0),
      addAutomaticKeepAlives: false,
      addRepaintBoundaries: true,
      addSemanticIndexes: false,
      itemCount: displayCount,
      findItemIndexCallback: findItemIndex,
      itemBuilder: (context, index) {
        final message = messages[firstDisplayIndex + displayCount - 1 - index];
        return KeyedSubtree(
          key: ValueKey(message.id),
          child: TickerMode(
            enabled:
                TickerMode.valuesOf(context).enabled &&
                index < PlayerChatPanelDesign.maxAnimatedMessageRows,
            child: PlayerChatMessageBubble(
              message: message,
              style: style,
            ),
          ),
        );
      },
      separatorBuilder: (context, index) {
        return SizedBox(height: math.max(0.0, style.messageGap));
      },
    );
  }
}
