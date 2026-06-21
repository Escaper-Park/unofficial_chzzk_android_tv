import 'package:flutter/material.dart';

import 'player_chat_panel_design.dart';

final class PlayerChatPanelStyle {
  const PlayerChatPanelStyle({
    this.panelColor = PlayerChatPanelDesign.panelColor,
    this.panelBorderColor = PlayerChatPanelDesign.panelBorderColor,
    this.bubbleColor = PlayerChatPanelDesign.bubbleColor,
    this.panelMargin = EdgeInsets.zero,
    this.panelPadding = PlayerChatPanelDesign.panelPadding,
    this.messagePadding = PlayerChatPanelDesign.messagePadding,
    this.panelRadius = PlayerChatPanelDesign.panelRadius,
    this.bubbleRadius = PlayerChatPanelDesign.bubbleRadius,
    this.messageGap = 5.0,
    this.messageFontSize = 14.0,
    this.showPanelContainer = true,
    this.showMessageContainer = false,
    this.showTime = false,
    this.showNickname = true,
    this.showDonation = true,
    this.showUserBadges = false,
    this.maxRenderedMessages = 60,
  });

  final Color panelColor;
  final Color panelBorderColor;
  final Color bubbleColor;
  final EdgeInsetsGeometry panelMargin;
  final EdgeInsetsGeometry panelPadding;
  final EdgeInsetsGeometry messagePadding;
  final double panelRadius;
  final double bubbleRadius;
  final double messageGap;
  final double messageFontSize;
  final bool showPanelContainer;
  final bool showMessageContainer;
  final bool showTime;
  final bool showNickname;
  final bool showDonation;
  final bool showUserBadges;
  final int maxRenderedMessages;

  PlayerChatPanelStyle copyWith({
    Color? panelColor,
    Color? panelBorderColor,
    Color? bubbleColor,
    EdgeInsetsGeometry? panelMargin,
    EdgeInsetsGeometry? panelPadding,
    EdgeInsetsGeometry? messagePadding,
    double? panelRadius,
    double? bubbleRadius,
    double? messageGap,
    double? messageFontSize,
    bool? showPanelContainer,
    bool? showMessageContainer,
    bool? showTime,
    bool? showNickname,
    bool? showDonation,
    bool? showUserBadges,
    int? maxRenderedMessages,
  }) {
    return PlayerChatPanelStyle(
      panelColor: panelColor ?? this.panelColor,
      panelBorderColor: panelBorderColor ?? this.panelBorderColor,
      bubbleColor: bubbleColor ?? this.bubbleColor,
      panelMargin: panelMargin ?? this.panelMargin,
      panelPadding: panelPadding ?? this.panelPadding,
      messagePadding: messagePadding ?? this.messagePadding,
      panelRadius: panelRadius ?? this.panelRadius,
      bubbleRadius: bubbleRadius ?? this.bubbleRadius,
      messageGap: messageGap ?? this.messageGap,
      messageFontSize: messageFontSize ?? this.messageFontSize,
      showPanelContainer: showPanelContainer ?? this.showPanelContainer,
      showMessageContainer: showMessageContainer ?? this.showMessageContainer,
      showTime: showTime ?? this.showTime,
      showNickname: showNickname ?? this.showNickname,
      showDonation: showDonation ?? this.showDonation,
      showUserBadges: showUserBadges ?? this.showUserBadges,
      maxRenderedMessages: maxRenderedMessages ?? this.maxRenderedMessages,
    );
  }
}
