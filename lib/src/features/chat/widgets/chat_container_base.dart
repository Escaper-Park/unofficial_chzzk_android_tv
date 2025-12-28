import 'package:flutter/material.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/extensions/custom_extensions.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart';
import '../../settings/model/chat_settings.dart';
import '../model/base_chat.dart';

class ChatContainerBase extends StatelessWidget {
  const ChatContainerBase({
    super.key,
    required this.chat,
    required this.chatSettings,
    required this.nickname,
    required this.nicknameColor,
    required this.backgroundColor,
    this.chatTime,
    this.isDonation = false,
  });

  final BaseChat chat;
  final ChatSettings chatSettings;
  final String nickname;
  final Color nicknameColor;
  final String? chatTime;
  final Color backgroundColor;
  final bool isDonation;

  @override
  Widget build(BuildContext context) {
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
      borderRadius: 10.0,
      backgroundColor: backgroundColor.withValues(
        alpha: (100 - chatSettings.singleChatContainerTransparency) * 0.01,
      ),
      padding: chatSettings.singleChatContainerTransparency == 100
          ? EdgeInsets.zero
          : const EdgeInsets.all(6.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (chatSettings.showNickname == 1)
            RichText(
              text: TextSpan(
                children: [
                  // Badge
                  if (chat.profile?.userRoleCode != 'common_user' &&
                      chat.profile != null)
                    _managerBadge(chat.profile?.badge?.imageUrl),
                  if (chat.profile?.userRoleCode != 'common_user' &&
                      chat.profile != null)
                    const WidgetSpan(child: SizedBox(width: 5.0)),
                  // Nickname
                  _textSpan(
                    nickname,
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
                if (chatSettings.showChatTime == 1 && chatTime != null)
                  _textSpan(
                    chatTime,
                    color: AppColors.greyColor,
                  ),
                if (chatSettings.showChatTime == 1 && chatTime != null)
                  const WidgetSpan(child: SizedBox(width: 5.0)),
                // Message
                ...textSpans,
              ],
            ),
          ),
          if (isDonation) _cheeseAmount(chat.extras?.payAmount ?? 0),
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
              imageWidth: (chatSettings.chatFontSize + 2.0).toDouble(),
              imageHeight: (chatSettings.chatFontSize + 2.0).toDouble(),
              imageUrl: imageUrl,
              fit: BoxFit.fill,
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

  WidgetSpan _cheeseImage() {
    return WidgetSpan(
      alignment: PlaceholderAlignment.middle,
      child: OptimizedAssetImage(
        imageWidth: chatSettings.chatFontSize.toDouble(),
        imageHeight: chatSettings.chatFontSize.toDouble(),
        imagePath: AssetsPath.cheese,
      ),
    );
  }

  /// cheese donation
  Widget _cheeseAmount(int payAmount) {
    final Color color = Color.fromRGBO(
      (backgroundColor.red * 0.85).round(),
      (backgroundColor.green * 0.85).round(),
      (backgroundColor.blue * 0.85).round(),
      (100 - chatSettings.singleChatContainerTransparency) * 0.01,
    );

    return RoundedContainer(
      borderRadius: 12.0,
      backgroundColor: color,
      padding: const EdgeInsets.all(5.0),
      margin: const EdgeInsets.only(top: 5.0),
      child: RichText(
        text: TextSpan(
          children: [
            _cheeseImage(),
            WidgetSpan(child: SizedBox(width: 5.0)),
            _textSpan(payAmount.commaFormat()),
          ],
        ),
      ),
    );
  }
}
