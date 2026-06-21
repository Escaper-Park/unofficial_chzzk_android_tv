part of 'player_chat_message_bubble.dart';

class _PlayerChatMetaRow extends StatelessWidget {
  const _PlayerChatMetaRow({
    required this.message,
    required this.nickname,
    required this.metaStyle,
    required this.nicknameStyle,
    required this.showUserBadges,
    required this.showNicknameMarks,
  });

  final PlayerChatMessage message;
  final String? nickname;
  final TextStyle metaStyle;
  final TextStyle nicknameStyle;
  final bool showUserBadges;
  final bool showNicknameMarks;

  @override
  Widget build(BuildContext context) {
    final iconSize = math.max(
      PlayerChatPanelDesign.iconSize,
      (nicknameStyle.fontSize ?? 12) + 2,
    );
    return Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        if (showUserBadges)
          for (final imageUrl in message.userBadgeImageUrls) ...[
            OptimizedImage.network(
              imageUrl,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
              errorFallback: const SizedBox.shrink(),
              placeholder: const SizedBox.shrink(),
            ),
            const SizedBox(width: PlayerChatPanelDesign.metaItemGap),
          ],
        if (showNicknameMarks)
          if (message.nicknameBadgeImageUrl case final imageUrl?) ...[
            OptimizedImage.network(
              imageUrl,
              width: iconSize,
              height: iconSize,
              fit: BoxFit.contain,
              errorFallback: const SizedBox.shrink(),
              placeholder: const SizedBox.shrink(),
            ),
            const SizedBox(width: PlayerChatPanelDesign.metaItemGap),
          ],
        if (nickname case final value?)
          Flexible(
            child: Text(
              value,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: nicknameStyle,
            ),
          ),
        if (showNicknameMarks && message.verifiedMark) ...[
          const SizedBox(width: PlayerChatPanelDesign.metaItemGap),
          OptimizedImage.asset(
            PlayerChatPanelDesign.verifiedMarkAsset,
            width: iconSize,
            height: iconSize,
            fit: BoxFit.contain,
          ),
        ],
      ],
    );
  }
}
