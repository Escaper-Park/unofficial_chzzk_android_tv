part of '../following_channel_info_card.dart';

class _FollowingChannelProfileImage extends StatelessWidget {
  const _FollowingChannelProfileImage({
    required this.openLive,
    required this.profileImageUrl,
  });

  final bool openLive;
  final String? profileImageUrl;

  @override
  Widget build(BuildContext context) {
    return CircleAvatarProfileImage(
      radius: Dimensions.followingListChannelProfileImageRadius,
      useBorder: openLive,
      profileImageUrl: profileImageUrl,
    );
  }
}
