part of 'following_channel_card.dart';

class _FollowingChannelCardBody extends StatelessWidget {
  const _FollowingChannelCardBody(this.item);

  final FollowingChannel item;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: FollowingScreenDesign.channelCardPadding,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: FollowingScreenDesign.channelCardContentGap,
        children: [
          _FollowingChannelAvatar(item: item),
          _FollowingChannelName(
            item: item,
            style: FollowingScreenDesign.channelNameStyle(context),
          ),
        ],
      ),
    );
  }
}

class _FollowingChannelAvatar extends StatelessWidget {
  const _FollowingChannelAvatar({
    required this.item,
  });

  final FollowingChannel item;

  @override
  Widget build(BuildContext context) {
    return TvChannelAvatar(
      imageUrl: item.channelImageUrl,
      radius: FollowingScreenDesign.channelAvatarRadius,
      openLive: item.openLive,
      liveBadgeHeight: FollowingScreenDesign.channelAvatarBadgeHeight,
      liveBadgeOverlap: FollowingScreenDesign.channelAvatarBadgeOverlap,
    );
  }
}

class _FollowingChannelName extends StatelessWidget {
  const _FollowingChannelName({
    required this.item,
    required this.style,
  });

  final FollowingChannel item;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: FollowingScreenDesign.channelNameHeight,
      child: Center(
        child: TvMediaChannelName(
          channelName: item.channelName,
          verified: item.verifiedMark,
          textAlign: TextAlign.center,
          mainAxisAlignment: MainAxisAlignment.center,
          style: style,
        ),
      ),
    );
  }
}

class _LiveCountBadge extends StatelessWidget {
  const _LiveCountBadge({
    required this.item,
  });

  final FollowingChannel item;

  @override
  Widget build(BuildContext context) {
    final count = formatFollowingCount(item.liveInfo?.concurrentUserCount ?? 0);

    return Positioned(
      left: FollowingScreenDesign.channelLiveBadgeLeft,
      top: FollowingScreenDesign.channelLiveBadgeTop,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: TvMediaCardDesign.scrimBadgeColor,
          borderRadius: TvRadius.sm.borderRadius,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: 4,
            children: [
              const Icon(
                Icons.circle,
                size: 6,
                color: TvMediaCardDesign.liveBadgeColor,
              ),
              Text(
                count,
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                  color: AppColorTokens.neutral100,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
