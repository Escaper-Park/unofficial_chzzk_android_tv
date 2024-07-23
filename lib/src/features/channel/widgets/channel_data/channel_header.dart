import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../common/widgets/tag_badge.dart';
import '../../../../utils/formatter/formatter.dart';

import '../../model/channel.dart';
import 'channel_name_with_verified_mark.dart';

class ChannelHeader extends StatelessWidget {
  /// Channel Header info.
  ///
  /// Profile image, name, follower count, etc...
  const ChannelHeader({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    const double profileImageRadius = 45.0;

    return Padding(
      padding: const EdgeInsets.only(bottom: 10.0),
      child: Row(
        children: [
          SizedBox(
            width: profileImageRadius * 2,
            height: profileImageRadius * 2 +
                5.0, // padding +5.0 for the live badge,
            child:
                _ChannelProfileImageWithLiveBadge(channel, profileImageRadius),
          ),
          const SizedBox(width: 16.0),
          Expanded(
            child: _ChannelInfo(channel),
          ),
        ],
      ),
    );
  }
}

class _ChannelProfileImageWithLiveBadge extends StatelessWidget {
  /// Channel's profile image with a live badge.
  ///
  /// If channel is broadcasting, show the live badge.
  const _ChannelProfileImageWithLiveBadge(
      this.channel, this.profileImageRadius);

  final Channel channel;
  final double profileImageRadius;

  @override
  Widget build(BuildContext context) {
    return channel.openLive == true
        ? Stack(
            children: [
              _profileImage(),
              const TagBadge(
                alignment: Alignment.bottomCenter,
                text: 'LIVE',
              ),
            ],
          )
        : _profileImage();
  }

  Widget _profileImage() {
    return CircleAvatarProfileImage(
      radius: profileImageRadius,
      useBorder: channel.openLive ?? false,
      profileImageUrl: channel.channelImageUrl,
    );
  }
}

class _ChannelInfo extends StatelessWidget {
  /// Channel name, follower count, description.
  const _ChannelInfo(this.channel);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    // follower count
    final String followerCounter =
        '팔로워 ${channel.followerCount.commaFormat()}명';

    // channel description
    final channelDescription = channel.channelDescription == null
        ? ''
        : channel.channelDescription!.replaceAll('\n', ' ');

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Name
        ChannelNameWithVerifiedMark(
          channel: channel,
          fontSize: 24.0,
          fontColor: AppColors.whiteColor,
        ),
        const SizedBox(height: 5.0),
        // Follower count
        Text(
          followerCounter,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 5.0),
        // Description
        Text(
          channelDescription,
          style: const TextStyle(
            fontSize: 13.0,
            color: AppColors.greyColor,
            overflow: TextOverflow.clip,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}
