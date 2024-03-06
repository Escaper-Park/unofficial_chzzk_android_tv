import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../chat/model/chat.dart';

class ChatContainer extends StatelessWidget {
  const ChatContainer({
    super.key,
    required this.chat,
    required this.fontSize,
    required this.verticalInterval,
  });

  final Chat chat;
  final double fontSize;
  final double verticalInterval;

  @override
  Widget build(BuildContext context) {
    final Color nicknameColor = getNicknameColor(chat.nickname);
    List<InlineSpan> textSpans = [];

    if (chat.emojis != null) {
      chat.msg.splitMapJoin(
        RegExp(r'\{:([^}]+):\}'),
        onMatch: (match) {
          final String? emojiKey = match.group(1);
          if (chat.emojis!.containsKey(emojiKey)) {
            textSpans.add(WidgetSpan(
              child: OptimizedNetworkImage(
                imageUrl: chat.emojis![emojiKey]!,
                imageWidth: fontSize + 5.0,
                imageHeight: fontSize + 5.0,
              ),
            ));
          } else {
            textSpans.add(
              TextSpan(
                text: match.group(0),
                style: TextStyle(
                  fontSize: fontSize,
                ),
              ),
            );
          }
          return '';
        },
        onNonMatch: (nonMatch) {
          textSpans.add(
            TextSpan(
              text: nonMatch,
              style: TextStyle(
                fontSize: fontSize,
              ),
            ),
          );
          return '';
        },
      );
    }

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 5.0,
        vertical: verticalInterval / 2,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: chat.nickname,
              style: TextStyle(
                fontSize: fontSize,
                color: nicknameColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const WidgetSpan(
              child: SizedBox(width: 5.0),
            ),
            ...textSpans,
          ],
        ),
      ),
    );
  }

  Color getNicknameColor(String nickname) {
    int colorIndex = nickname.runes.reduce((a, b) => a + b) % 50;

    return AppColors.nicknameColors[colorIndex];
  }
}
