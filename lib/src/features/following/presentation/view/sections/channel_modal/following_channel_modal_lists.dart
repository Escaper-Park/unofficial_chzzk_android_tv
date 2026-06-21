part of 'following_channel_modal.dart';

class _FollowingChannelActionList extends StatelessWidget {
  const _FollowingChannelActionList({
    required this.channel,
    required this.canWatchLive,
    required this.following,
    required this.onWatchLive,
    required this.onMoveToChannel,
    required this.onFollow,
    required this.onUnfollow,
    required this.onShowGroupList,
  });

  final FollowingChannel channel;
  final bool canWatchLive;
  final bool following;
  final ValueChanged<FollowingChannel> onWatchLive;
  final ValueChanged<FollowingChannel> onMoveToChannel;
  final ValueChanged<FollowingChannel> onFollow;
  final ValueChanged<FollowingChannel> onUnfollow;
  final ValueChanged<FollowingChannel> onShowGroupList;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TvDenseListItem(
          title: FollowingScreenString.watchLive,
          icon: Icons.play_arrow_rounded,
          enabled: canWatchLive,
          autofocus: canWatchLive,
          onPressed: () => onWatchLive(channel),
        ),
        TvDenseListItem(
          title: FollowingScreenString.moveToChannel,
          icon: Icons.open_in_new_rounded,
          autofocus: !canWatchLive,
          onPressed: () => onMoveToChannel(channel),
        ),
        TvDenseListItem(
          title: following
              ? FollowingScreenString.unfollow
              : FollowingScreenString.follow,
          icon: _followIconFor(channel),
          onPressed: () {
            if (following) {
              onUnfollow(channel);
              return;
            }

            onFollow(channel);
          },
        ),
        TvDenseListItem(
          title: FollowingScreenString.addToGroup,
          icon: Icons.group_add_rounded,
          onPressed: () => onShowGroupList(channel),
        ),
      ],
    );
  }
}

class _FollowingGroupList extends StatelessWidget {
  const _FollowingGroupList({
    required this.channel,
    required this.groups,
    required this.onAddToGroup,
    required this.onDismiss,
  });

  final FollowingChannel channel;
  final List<GroupItem> groups;
  final FollowingChannelGroupCallback onAddToGroup;
  final VoidCallback onDismiss;

  @override
  Widget build(BuildContext context) {
    if (groups.isEmpty) {
      return Column(
        children: [
          TvDenseListItem(
            title: FollowingScreenString.groupListEmpty,
            autofocus: true,
            onPressed: onDismiss,
          ),
        ],
      );
    }

    return ListView.builder(
      padding: EdgeInsets.zero,
      itemExtent: 40,
      itemCount: groups.length,
      itemBuilder: (context, index) {
        final group = groups[index];

        return TvDenseListItem(
          title: group.groupName,
          autofocus: index == 0,
          onPressed: () => onAddToGroup(channel, group),
        );
      },
    );
  }
}

IconData _followIconFor(FollowingChannel channel) {
  return _isFollowing(channel)
      ? Icons.favorite_rounded
      : Icons.favorite_border_rounded;
}

bool _isFollowing(FollowingChannel channel) {
  return channel.personalData?.following ?? true;
}
