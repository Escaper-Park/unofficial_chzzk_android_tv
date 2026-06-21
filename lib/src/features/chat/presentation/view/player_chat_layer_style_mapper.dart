import 'dart:math' as math;

import 'package:flutter/material.dart';

import '../../../settings/domain/entities/chat_settings.dart';
import 'player_chat_panel_design.dart';
import 'player_chat_panel_style.dart';
import 'player_chat_presentation_mode.dart';

PlayerChatPanelStyle playerChatPanelStyleFromSettings(
  ChatSettings settings, {
  required PlayerChatPresentationMode mode,
}) {
  final showPanelContainer =
      mode != PlayerChatPresentationMode.sidePanel &&
      settings.useChatPanelContainer == 1;
  final useBubbleTransparency = mode != PlayerChatPresentationMode.sidePanel;

  return PlayerChatPanelStyle(
    panelColor: _applyTransparency(
      PlayerChatPanelDesign.panelColor,
      settings.chatPanelTransparency,
    ),
    panelBorderColor: _applyTransparency(
      PlayerChatPanelDesign.panelBorderColor,
      settings.chatPanelTransparency,
    ),
    bubbleColor: useBubbleTransparency
        ? _applyTransparency(
            PlayerChatPanelDesign.bubbleColor,
            settings.chatBubbleTransparency,
          )
        : PlayerChatPanelDesign.bubbleColor,
    panelMargin: EdgeInsets.symmetric(
      horizontal: math
          .max(
            0,
            settings.chatContainerHorizontalMargin,
          )
          .toDouble(),
      vertical: math.max(0.0, settings.chatContainerVerticalMargin).toDouble(),
    ),
    messageGap: math.max(0.0, settings.chatBubbleVerticalGap).toDouble(),
    messageFontSize: math.max(1, settings.chatMessageFontSize).toDouble(),
    panelPadding: showPanelContainer
        ? PlayerChatPanelDesign.panelContainerPadding
        : mode == PlayerChatPresentationMode.overlay
        ? EdgeInsets.zero
        : PlayerChatPanelDesign.panelPadding,
    showPanelContainer: showPanelContainer,
    showMessageContainer:
        mode != PlayerChatPresentationMode.sidePanel && !showPanelContainer,
    showTime: settings.showChatTime == 1,
    showNickname: settings.showNickname == 1,
    showDonation: settings.showDonation == 1,
    showUserBadges: settings.showUserBadges == 1,
  );
}

Color _applyTransparency(Color color, int transparencyPercent) {
  final visibleRatio = 1 - _settingsRatio(transparencyPercent);
  return color.withValues(alpha: (color.a * visibleRatio).clamp(0, 1));
}

double _settingsRatio(int value) {
  return value.clamp(0, 100).toDouble() / 100;
}
