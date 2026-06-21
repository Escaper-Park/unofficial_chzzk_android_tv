part of 'player_chat_message_bubble.dart';

class _DonationAmountPill extends StatelessWidget {
  const _DonationAmountPill({
    required this.label,
    required this.style,
    required this.backgroundColor,
  });

  final String label;
  final TextStyle style;
  final Color backgroundColor;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: PlayerChatPanelDesign.donationAmountPadding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            const OptimizedImage.asset(
              PlayerChatPanelDesign.cheeseAsset,
              width: PlayerChatPanelDesign.cheeseIconSize,
              height: PlayerChatPanelDesign.cheeseIconSize,
              fit: BoxFit.contain,
            ),
            const SizedBox(width: PlayerChatPanelDesign.donationAmountGap),
            Text(
              label,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style: style.copyWith(fontWeight: FontWeight.w800),
            ),
          ],
        ),
      ),
    );
  }
}
