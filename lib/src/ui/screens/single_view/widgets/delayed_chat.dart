import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../model/chat/chat.dart';

class DelayedChat extends StatelessWidget {
  const DelayedChat({super.key, required this.chat});

  final Chat chat;

  @override
  Widget build(BuildContext context) {
    final Color nicknameColor = getNicknameColor(chat.nickname);

    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: chat.nickname,
              style: TextStyle(
                fontSize: 14.0,
                color: nicknameColor,
                fontWeight: FontWeight.w600,
              ),
            ),
            const WidgetSpan(
              child: SizedBox(width: 10.0),
            ),
            TextSpan(
              text: chat.msg,
              style: const TextStyle(
                fontSize: 14.0,
                color: AppColors.chatColor,
                fontWeight: FontWeight.w600,
              ),
            )
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
