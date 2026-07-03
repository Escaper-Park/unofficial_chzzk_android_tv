import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../domain/entities/chat.dart';
import 'chat_nickname_color.dart';
import 'player_chat_donation_style.dart';
import 'player_chat_formatters.dart';
import 'player_chat_panel_design.dart';
import 'player_chat_panel_style.dart';
import 'player_chat_strings.dart';

part 'player_chat_message_bubble_content.dart';
part 'player_chat_message_bubble_donation.dart';
part 'player_chat_message_bubble_meta.dart';

class PlayerChatMessageBubble extends StatefulWidget {
  const PlayerChatMessageBubble({
    super.key,
    required this.message,
    required this.style,
  });

  final PlayerChatMessage message;
  final PlayerChatPanelStyle style;

  @override
  State<PlayerChatMessageBubble> createState() =>
      _PlayerChatMessageBubbleState();
}

class _PlayerChatMessageBubbleState extends State<PlayerChatMessageBubble> {
  String? _contentMessageId;
  String? _contentText;
  bool? _contentBlind;
  Map<String, String>? _contentEmojis;
  double? _contentFontSize;
  List<InlineSpan>? _contentSpans;
  String? _timeMessageId;
  bool? _timeVisible;
  String? _timeLabel;

  @override
  Widget build(BuildContext context) {
    final message = widget.message;
    final style = widget.style;
    final donationStyle = PlayerChatDonationStyle.forAmount(message.payAmount);
    final contentStyle = PlayerChatPanelDesign.messageTextStyle.copyWith(
      fontSize: math.max(1, style.messageFontSize),
      color: message.isBlind
          ? PlayerChatPanelDesign.blindMessageColor
          : message.isDonation
          ? donationStyle.contentColor
          : null,
    );
    final metaStyle = PlayerChatPanelDesign.metaTextStyle.copyWith(
      fontSize: math.max(1, style.messageFontSize - 2),
      color: message.isDonation ? donationStyle.contentColor : null,
    );
    final nicknameStyle = metaStyle.copyWith(
      color: message.isDonation
          ? donationStyle.contentColor
          : chatNicknameColorFor(
              userIdHash: message.userIdHash,
              nickname: message.nickname,
            ),
    );
    final timeLabel = style.showTime && !message.isDonation
        ? _playerChatTimeLabelFor(message, visible: true)
        : _playerChatTimeLabelFor(message, visible: false);
    final contentSpans = _playerChatContentSpansFor(
      message: message,
      style: style,
      contentStyle: contentStyle,
    );
    final showContainer = message.isDonation || style.showMessageContainer;
    final child = Padding(
      padding: showContainer
          ? style.messagePadding
          : PlayerChatPanelDesign.messageTextPadding,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          if (_hasVisibleMeta(message, style)) ...[
            _PlayerChatMetaRow(
              message: message,
              nickname: _visibleNickname(message, style),
              metaStyle: metaStyle,
              nicknameStyle: nicknameStyle,
              showUserBadges: style.showUserBadges,
              showNicknameMarks: style.showNickname,
            ),
            const SizedBox(height: PlayerChatPanelDesign.metaContentGap),
          ],
          _PlayerChatContentRow(
            timeLabel: timeLabel,
            contentSpans: contentSpans,
            metaStyle: metaStyle,
            contentStyle: contentStyle,
          ),
          if (message.isDonation && (message.payAmount ?? 0) > 0) ...[
            const SizedBox(height: 8),
            _DonationAmountPill(
              label: formatPlayerChatDonationAmount(message.payAmount!),
              style: contentStyle,
              backgroundColor: donationStyle.amountBackgroundColor,
            ),
          ],
        ],
      ),
    );

    if (!showContainer) {
      return child;
    }

    return DecoratedBox(
      decoration: BoxDecoration(
        color: message.isDonation
            ? donationStyle.backgroundColor
            : style.bubbleColor,
        borderRadius: BorderRadius.circular(style.bubbleRadius),
      ),
      child: child,
    );
  }

  List<InlineSpan> _playerChatContentSpansFor({
    required PlayerChatMessage message,
    required PlayerChatPanelStyle style,
    required TextStyle contentStyle,
  }) {
    final text = message.isBlind
        ? PlayerChatString.blindedMessage
        : message.content;
    final fontSize = contentStyle.fontSize ?? style.messageFontSize;
    if (_contentMessageId == message.id &&
        _contentText == text &&
        _contentBlind == message.isBlind &&
        identical(_contentEmojis, message.emojis) &&
        _contentFontSize == fontSize) {
      return _contentSpans ?? const <InlineSpan>[];
    }

    final spans = _playerChatContentSpans(
      message: message,
      style: style,
      contentStyle: contentStyle,
    );
    _contentMessageId = message.id;
    _contentText = text;
    _contentBlind = message.isBlind;
    _contentEmojis = message.emojis;
    _contentFontSize = fontSize;
    _contentSpans = spans;
    return spans;
  }

  String? _playerChatTimeLabelFor(
    PlayerChatMessage message, {
    required bool visible,
  }) {
    if (_timeMessageId == message.id && _timeVisible == visible) {
      return _timeLabel;
    }

    final label = visible ? playerChatTimeLabel(message) : null;
    _timeMessageId = message.id;
    _timeVisible = visible;
    _timeLabel = label;
    return label;
  }

  bool _hasVisibleMeta(
    PlayerChatMessage message,
    PlayerChatPanelStyle style,
  ) {
    return _visibleNickname(message, style) != null ||
        (style.showUserBadges && message.userBadgeImageUrls.isNotEmpty) ||
        (style.showNickname && message.nicknameBadgeImageUrl != null) ||
        (style.showNickname && message.verifiedMark);
  }

  String? _visibleNickname(
    PlayerChatMessage message,
    PlayerChatPanelStyle style,
  ) {
    final nickname = message.isDonation && message.isAnonymous
        ? PlayerChatString.anonymousDonation
        : message.nickname;
    if (nickname == null || nickname.isEmpty) {
      return null;
    }
    if (message.isDonation || style.showNickname) {
      return nickname;
    }

    return null;
  }
}
