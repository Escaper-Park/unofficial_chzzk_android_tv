part of 'player_chat_layer_body.dart';

List<Widget> _overlayChildren({
  required BoxConstraints constraints,
  required ChatSettings chatSettings,
  required EdgeInsetsGeometry chatMargin,
  required Widget Function() panelBuilder,
  required Widget Function() badgeCollectorBuilder,
}) {
  if (chatSettings.useBadgeCollector == 2) {
    if (!showsPlayerChatBadgeCollector(chatSettings)) {
      return const <Widget>[];
    }

    return [
      Positioned.fromRect(
        rect: playerChatOverlayBadgeCollectorRect(
          constraints: constraints,
          chatSettings: chatSettings,
        ),
        child: Padding(
          padding: chatMargin,
          child: badgeCollectorBuilder(),
        ),
      ),
    ];
  }

  if (!showsPlayerChatBadgeCollector(chatSettings)) {
    return [
      Positioned.fromRect(
        rect: playerChatOverlayChatRect(
          constraints: constraints,
          chatSettings: chatSettings,
        ),
        child: Padding(
          padding: chatMargin,
          child: panelBuilder(),
        ),
      ),
    ];
  }

  final layout = playerChatWithBadgeOverlayLayout(
    constraints: constraints,
    chatSettings: chatSettings,
  );

  return [
    Positioned.fromRect(
      rect: layout.rect,
      child: _ChatWithBadgeCollector(
        chatHeight: layout.chatHeight,
        collectorHeight: layout.collectorHeight,
        gap: layout.gap,
        chatMargin: chatMargin,
        panel: panelBuilder(),
        badgeCollector: badgeCollectorBuilder(),
      ),
    ),
  ];
}

class _ChatWithBadgeCollector extends StatelessWidget {
  const _ChatWithBadgeCollector({
    required this.chatHeight,
    required this.collectorHeight,
    required this.gap,
    required this.chatMargin,
    required this.panel,
    required this.badgeCollector,
  });

  final double chatHeight;
  final double collectorHeight;
  final double gap;
  final EdgeInsetsGeometry chatMargin;
  final Widget panel;
  final Widget badgeCollector;

  @override
  Widget build(BuildContext context) {
    final resolvedMargin = chatMargin.resolve(Directionality.of(context));
    final chatPadding = EdgeInsets.fromLTRB(
      resolvedMargin.left,
      resolvedMargin.top,
      resolvedMargin.right,
      0,
    );
    final collectorPadding = EdgeInsets.fromLTRB(
      resolvedMargin.left,
      0,
      resolvedMargin.right,
      resolvedMargin.bottom,
    );

    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
          height: chatHeight,
          child: Padding(
            padding: chatPadding,
            child: panel,
          ),
        ),
        if (gap > 0) SizedBox(height: gap),
        SizedBox(
          height: collectorHeight,
          child: Padding(
            padding: collectorPadding,
            child: badgeCollector,
          ),
        ),
      ],
    );
  }
}
