part of 'player_chat_message_bubble.dart';

final _playerChatEmojiPattern = RegExp(r'\{:([^}]+):\}');

List<InlineSpan> _playerChatContentSpans({
  required PlayerChatMessage message,
  required PlayerChatPanelStyle style,
  required TextStyle contentStyle,
}) {
  final text = message.isBlind
      ? PlayerChatString.blindedMessage
      : message.content;
  if (!text.contains('{:')) {
    return <InlineSpan>[TextSpan(text: text)];
  }

  final spans = <InlineSpan>[];
  var start = 0;
  for (final match in _playerChatEmojiPattern.allMatches(text)) {
    if (match.start > start) {
      spans.add(TextSpan(text: text.substring(start, match.start)));
    }

    final key = match.group(1);
    final imageUrl = key == null ? null : message.emojis[key];
    if (imageUrl == null || imageUrl.isEmpty) {
      spans.add(TextSpan(text: match.group(0)));
    } else {
      spans.add(
        _playerChatEmojiSpan(
          imageUrl: imageUrl,
          style: style,
          contentStyle: contentStyle,
        ),
      );
    }

    start = match.end;
  }

  if (start < text.length) {
    spans.add(TextSpan(text: text.substring(start)));
  }

  return spans;
}

InlineSpan _playerChatEmojiSpan({
  required String imageUrl,
  required PlayerChatPanelStyle style,
  required TextStyle contentStyle,
}) {
  final fontSize = contentStyle.fontSize ?? style.messageFontSize;
  final size = math.max(
    PlayerChatPanelDesign.emojiMinSize,
    fontSize * 1.45,
  );

  return WidgetSpan(
    alignment: PlaceholderAlignment.middle,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 1),
      child: OptimizedImage.network(
        imageUrl,
        width: size,
        height: size,
        fit: BoxFit.contain,
        errorFallback: const SizedBox.shrink(),
        placeholder: const SizedBox.shrink(),
      ),
    ),
  );
}

class _PlayerChatContentRow extends StatelessWidget {
  const _PlayerChatContentRow({
    required this.timeLabel,
    required this.contentSpans,
    required this.metaStyle,
    required this.contentStyle,
  });

  final String? timeLabel;
  final List<InlineSpan> contentSpans;
  final TextStyle metaStyle;
  final TextStyle contentStyle;

  @override
  Widget build(BuildContext context) {
    final content = Text.rich(
      TextSpan(children: contentSpans),
      style: contentStyle,
    );
    final label = timeLabel;
    if (label == null) {
      return content;
    }

    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      children: [
        Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: contentStyle.copyWith(
            color: metaStyle.color,
            fontSize: math.max(1, (contentStyle.fontSize ?? 1) - 2),
          ),
        ),
        const SizedBox(width: 4),
        Expanded(child: content),
      ],
    );
  }
}
