import 'dart:math' as math;

import 'package:flutter/widgets.dart';

import '../../../settings/domain/entities/chat_settings.dart';
import 'player_chat_presentation_mode.dart';

class PlayerChatSingleViewLayout extends StatelessWidget {
  const PlayerChatSingleViewLayout({
    super.key,
    required this.playback,
    required this.chatPresentationModeIndex,
    required this.chatSettings,
    this.chat,
  });

  final Widget playback;
  final int chatPresentationModeIndex;
  final ChatSettings chatSettings;
  final Widget? chat;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final mode = PlayerChatPresentationMode.fromSettingsIndex(
          chatPresentationModeIndex,
        );
        final showSidePanel =
            chat != null && mode == PlayerChatPresentationMode.sidePanel;
        final sideWidth = showSidePanel
            ? _sidePanelWidth(
                viewportWidth: constraints.maxWidth,
                chatSettings: chatSettings,
              )
            : 0.0;
        final sidePanelOnLeft = _sidePanelOnLeft(chatSettings);

        return Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              left: sidePanelOnLeft ? sideWidth : 0,
              right: sidePanelOnLeft ? 0 : sideWidth,
              child: playback,
            ),
            if (chat case final chatWidget?)
              if (showSidePanel)
                Positioned(
                  top: 0,
                  left: sidePanelOnLeft ? 0 : null,
                  right: sidePanelOnLeft ? null : 0,
                  bottom: 0,
                  width: sideWidth,
                  child: RepaintBoundary(child: chatWidget),
                )
              else
                Positioned.fill(
                  child: RepaintBoundary(child: chatWidget),
                ),
          ],
        );
      },
    );
  }
}

double _sidePanelWidth({
  required double viewportWidth,
  required ChatSettings chatSettings,
}) {
  final safeWidth = viewportWidth.isFinite && viewportWidth > 0
      ? viewportWidth
      : 0.0;
  return math.max(
    0,
    safeWidth * chatSettings.chatSidePanelWidth.clamp(0, 100) / 100,
  );
}

bool _sidePanelOnLeft(ChatSettings chatSettings) {
  return chatSettings.chatSidePanelPositionX <= 50;
}
