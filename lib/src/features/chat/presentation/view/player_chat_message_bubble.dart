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

class PlayerChatMessageBubble extends StatelessWidget {
  const PlayerChatMessageBubble({
    super.key,
    required this.message,
    required this.style,
  });

  final PlayerChatMessage message;
  final PlayerChatPanelStyle style;

  @override
  Widget build(BuildContext context) {
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
        ? playerChatTimeLabel(message)
        : null;
    final contentSpans = _playerChatContentSpans(
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
          if (_hasVisibleMeta) ...[
            _PlayerChatMetaRow(
              message: message,
              nickname: _visibleNickname,
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

  bool get _hasVisibleMeta {
    return _visibleNickname != null ||
        (style.showUserBadges && message.userBadgeImageUrls.isNotEmpty) ||
        (style.showNickname && message.nicknameBadgeImageUrl != null) ||
        (style.showNickname && message.verifiedMark);
  }

  String? get _visibleNickname {
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
