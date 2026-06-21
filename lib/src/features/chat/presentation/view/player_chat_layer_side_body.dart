part of 'player_chat_layer_body.dart';

class _SidePanelChatBody extends StatelessWidget {
  const _SidePanelChatBody({
    required this.chatSettings,
    required this.messages,
    required this.statusText,
    required this.style,
  });

  final ChatSettings chatSettings;
  final List<PlayerChatMessage> messages;
  final String? statusText;
  final PlayerChatPanelStyle style;

  @override
  Widget build(BuildContext context) {
    final badgeMode = chatSettings.useBadgeCollector;
    if (badgeMode == 2) {
      if (!showsPlayerChatBadgeCollector(chatSettings)) {
        return const SizedBox.shrink();
      }

      return SizedBox.expand(
        child: _badgeCollectorPanel(messages: messages, style: style),
      );
    }
    if (!showsPlayerChatBadgeCollector(chatSettings)) {
      return SizedBox.expand(
        child: _chatPanel(
          messages: messages,
          statusText: statusText,
          style: style,
        ),
      );
    }

    return LayoutBuilder(
      builder: (context, constraints) {
        final collectorHeight = playerChatCollectorHeight(
          maxHeight: constraints.maxHeight,
          chatSettings: chatSettings,
        );
        if (collectorHeight >= constraints.maxHeight) {
          return SizedBox.expand(
            child: _badgeCollectorPanel(messages: messages, style: style),
          );
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: _chatPanel(
                messages: messages,
                statusText: statusText,
                style: style,
              ),
            ),
            const Divider(
              height: 6,
              thickness: 1,
              color: PlayerChatPanelDesign.panelBorderColor,
            ),
            SizedBox(
              height: collectorHeight,
              child: _badgeCollectorPanel(messages: messages, style: style),
            ),
          ],
        );
      },
    );
  }
}
