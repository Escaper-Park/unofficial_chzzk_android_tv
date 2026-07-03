import 'package:flutter/material.dart';

import '../../../settings/domain/entities/chat_settings.dart';
import '../../domain/entities/chat.dart';
import 'player_chat_layer_geometry.dart';
import 'player_chat_layer_style_mapper.dart';
import 'player_chat_panel.dart';
import 'player_chat_panel_design.dart';
import 'player_chat_panel_style.dart';
import 'player_chat_presentation_mode.dart';

part 'player_chat_layer_overlay_body.dart';
part 'player_chat_layer_side_body.dart';

class PlayerChatLayerBody extends StatelessWidget {
  const PlayerChatLayerBody({
    super.key,
    required this.mode,
    required this.chatSettings,
    required this.messages,
    required this.statusText,
  });

  final PlayerChatPresentationMode mode;
  final ChatSettings chatSettings;
  final List<PlayerChatMessage> messages;
  final String? statusText;

  @override
  Widget build(BuildContext context) {
    if (mode == PlayerChatPresentationMode.hidden) {
      return const IgnorePointer(child: SizedBox.shrink());
    }

    final style = playerChatPanelStyleFromSettings(chatSettings, mode: mode);

    return IgnorePointer(
      child: LayoutBuilder(
        builder: (context, constraints) {
          return switch (mode) {
            PlayerChatPresentationMode.hidden => const SizedBox.shrink(),
            PlayerChatPresentationMode.sidePanel => _SidePanelChatBody(
              chatSettings: chatSettings,
              messages: messages,
              statusText: statusText,
              style: style,
            ),
            PlayerChatPresentationMode.overlay => Stack(
              fit: StackFit.expand,
              children: _overlayChildren(
                constraints: constraints,
                chatSettings: chatSettings,
                chatMargin: style.panelMargin,
                panelBuilder: () => _chatPanel(
                  messages: messages,
                  statusText: statusText,
                  style: style,
                ),
                badgeCollectorBuilder: () => _badgeCollectorPanel(
                  messages: messages,
                  style: style,
                ),
              ),
            ),
          };
        },
      ),
    );
  }
}

Widget _chatPanel({
  required List<PlayerChatMessage> messages,
  required String? statusText,
  required PlayerChatPanelStyle style,
}) {
  return PlayerChatPanel(
    showTitle: false,
    messages: messages,
    statusText: statusText,
    style: style,
  );
}

Widget _badgeCollectorPanel({
  required List<PlayerChatMessage> messages,
  required PlayerChatPanelStyle style,
}) {
  return _PlayerChatBadgeCollectorPanel(
    messages: messages,
    style: style,
  );
}

class _PlayerChatBadgeCollectorPanel extends StatefulWidget {
  const _PlayerChatBadgeCollectorPanel({
    required this.messages,
    required this.style,
  });

  final List<PlayerChatMessage> messages;
  final PlayerChatPanelStyle style;

  @override
  State<_PlayerChatBadgeCollectorPanel> createState() {
    return _PlayerChatBadgeCollectorPanelState();
  }
}

class _PlayerChatBadgeCollectorPanelState
    extends State<_PlayerChatBadgeCollectorPanel> {
  List<PlayerChatMessage>? _sourceMessages;
  List<PlayerChatMessage>? _collectorMessages;

  @override
  Widget build(BuildContext context) {
    final messages = _collectorMessagesFor(widget.messages);

    return PlayerChatPanel(
      showTitle: false,
      messages: messages,
      style: widget.style.copyWith(
        showNickname: true,
        showUserBadges: true,
      ),
      filterDonations: false,
    );
  }

  List<PlayerChatMessage> _collectorMessagesFor(
    List<PlayerChatMessage> messages,
  ) {
    if (identical(_sourceMessages, messages)) {
      return _collectorMessages ?? const <PlayerChatMessage>[];
    }

    final collectorMessages = playerChatBadgeCollectorMessages(messages);
    _sourceMessages = messages;
    _collectorMessages = collectorMessages;
    return collectorMessages;
  }
}
