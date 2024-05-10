import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../chat/model/chat.dart';

class ChatContainer extends StatefulWidget {
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
  _ChatContainerState createState() => _ChatContainerState();
}

class _ChatContainerState extends State<ChatContainer>
    with TickerProviderStateMixin {
  late final GifController controller;

  @override
  void initState() {
    controller = GifController(vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final Color nicknameColor = getNicknameColor(widget.chat.nickname);
    List<InlineSpan> textSpans = [];

    if (widget.chat.emojis == null) {
      textSpans.add(
        TextSpan(
          text: widget.chat.msg,
          style: TextStyle(
            fontSize: widget.fontSize,
          ),
        ),
      );
    }

    if (widget.chat.emojis != null) {
      widget.chat.msg.splitMapJoin(
        RegExp(r'\{:([^}]+):\}'),
        onMatch: (match) {
          final String? emojiKey = match.group(1);
          // Emoji
          if (widget.chat.emojis!.containsKey(emojiKey)) {
            final imageUrl = widget.chat.emojis![emojiKey]!;

            textSpans.add(WidgetSpan(
              child: imageUrl.contains('.gif')
                  ? OptimizedGifImage(
                      controller: controller,
                      imageUrl: imageUrl,
                      imageWidth: widget.fontSize + 5.0,
                      imageHeight: widget.fontSize + 5.0,
                    )
                  : OptimizedNetworkImage(
                      imageUrl: imageUrl,
                      imageWidth: widget.fontSize + 5.0,
                      imageHeight: widget.fontSize + 5.0,
                    ),
            ));
          } else {
            textSpans.add(
              TextSpan(
                text: match.group(0),
                style: TextStyle(
                  fontSize: widget.fontSize,
                ),
              ),
            );
          }
          return '';
        },
        // Chat
        onNonMatch: (nonMatch) {
          textSpans.add(
            TextSpan(
              text: nonMatch,
              style: TextStyle(
                fontSize: widget.fontSize,
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
        vertical: widget.verticalInterval / 2,
      ),
      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.chat.nickname,
              style: TextStyle(
                fontSize: widget.fontSize,
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
