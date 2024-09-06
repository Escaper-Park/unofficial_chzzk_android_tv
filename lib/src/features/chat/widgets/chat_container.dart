import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../utils/formatter/formatter.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../setting/model/chat_settings.dart';
import '../model/base_chat.dart';

class ChatContainer extends StatelessWidget {
  /// A single chat container.
  const ChatContainer({
    super.key,
    required this.chat,
    required this.chatSettings,
  });

  final BaseChat chat;
  final ChatSettings chatSettings;

  @override
  Widget build(BuildContext context) {
    final Color nicknameColor =
        _getNicknameColor(chat.profile?.nickname ?? '익명');

    // Use rich text for emoji
    List<InlineSpan> textSpans = [];

    // Only text
    if (chat.extras?.emojis == null) {
      textSpans.add(_textSpan(chat.msg));
    }
    // Handle Emoji
    else {
      chat.msg.splitMapJoin(
        RegExp(r'\{:([^}]+):\}'), // Emojis consists of {} patterns.
        // Emoji
        onMatch: (match) {
          // Check again if the emoji exists
          final String? emojiKey = match.group(1);

          // Handle Emoji
          if (chat.extras!.emojis!.containsKey(emojiKey)) {
            final String imageUrl = chat.extras!.emojis![emojiKey]!;
            textSpans.add(_emojiSpan(context, imageUrl));
          }
          // Chat
          else {
            textSpans.add(_textSpan(match.group(0)));
          }

          return '';
        },
        // Chat
        onNonMatch: (nonMatch) {
          textSpans.add(_textSpan(nonMatch));
          return '';
        },
      );
    }

    return RoundedContainer(
      backgroundColor: AppColors.blackColor.withOpacity(
          (100 - chatSettings.singleChatContainerTransparency) * 0.01),
      padding: chatSettings.singleChatContainerTransparency == 100
          ? EdgeInsets.zero
          : const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chatSettings.showNickname == 1)
            RichText(
              text: TextSpan(
                children: [
                  // Badge
                  if (chat.profile?.userRoleCode != 'common_user')
                    _managerBadge(chat.profile?.badge?.imageUrl),
                  if (chat.profile?.userRoleCode != 'common_user')
                    const WidgetSpan(child: SizedBox(width: 5.0)),
                  // Nickname
                  _textSpan(
                    chat.profile?.nickname ?? '익명',
                    color: nicknameColor,
                    fontWeight: FontWeight.w600,
                  ),
                  if (chat.profile?.verifiedMark == true)
                    const WidgetSpan(child: SizedBox(width: 3.0)),
                  if (chat.profile?.verifiedMark == true) _partnerBadge(),
                ],
              ),
            ),
          RichText(
            text: TextSpan(
              children: [
                // Created time
                if (chatSettings.showChatTime == 1)
                  _textSpan(chat.ctime.hhmm(), color: AppColors.greyColor),
                if (chatSettings.showChatTime == 1)
                  const WidgetSpan(child: SizedBox(width: 5.0)),
                // Message
                ...textSpans,
              ],
            ),
          ),
        ],
      ),
    );
  }

  TextSpan _textSpan(
    String? text, {
    Color color = AppColors.whiteColor,
    FontWeight? fontWeight,
  }) {
    return TextSpan(
      text: text,
      style: TextStyle(
        fontSize: chatSettings.chatFontSize.toDouble(),
        color: color,
        fontWeight: fontWeight,
      ),
    );
  }

  WidgetSpan _emojiSpan(BuildContext context, String imageUrl) {
    final imageSize = (chatSettings.chatFontSize * 2).toDouble();

    // final bool isGif = imageUrl.toLowerCase().contains('.gif');

    return WidgetSpan(
      child: OptimizedNetworkImage(
        imageHeight: imageSize,
        imageWidth: imageSize,
        imageUrl: imageUrl,
        fit: BoxFit.fill,
      ),
    );
  }

  /// Manager or Streamer Badge
  WidgetSpan _managerBadge(String? imageUrl) {
    return WidgetSpan(
      child: imageUrl == null
          ? const SizedBox.shrink()
          : OptimizedNetworkImage(
              imageWidth: chatSettings.chatFontSize - 5.0,
              imageHeight: chatSettings.chatFontSize - 5.0,
              imageUrl: imageUrl,
            ),
    );
  }

  /// partner badge
  WidgetSpan _partnerBadge() {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: OptimizedAssetImage(
        imageWidth: chatSettings.chatFontSize.toDouble(),
        imageHeight: chatSettings.chatFontSize.toDouble(),
        imagePath: AssetsPath.verifiedMark,
      ),
    );
  }

  /// Get nickname color calculated by nickname
  Color _getNicknameColor(String nickname) {
    int colorIndex = nickname.runes.reduce((a, b) => a + b) % 50;

    return AppColors.nicknameColors[colorIndex];
  }
}
