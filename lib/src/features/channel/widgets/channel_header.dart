import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../live/widgets/live_badge.dart';
import '../model/channel.dart';

class ChannelHeader extends StatelessWidget {
  const ChannelHeader({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    const double profileImageRadius = 45.0;

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: profileImageRadius * 2 + 5.0,
          width: profileImageRadius * 2,
          child: _ProfileImageWithLiveBadge(channel, profileImageRadius),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: _ChannelInfo(channel),
        )
      ],
    );
  }
}

class _ChannelInfo extends StatelessWidget {
  const _ChannelInfo(this.channel);

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", 'en_US');

    final channelDescription = channel.channelDescription == null
        ? ''
        : channel.channelDescription!.replaceAll('\n', ' ');

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          channel.channelName,
          style: const TextStyle(
            fontSize: 24.0,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3.0),
        Text(
          '팔로워 ${formatter.format(channel.followerCount)}명',
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.greyColor,
            fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 3.0),
        Text(
          channelDescription,
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.greyColor,
            overflow: TextOverflow.clip,
            fontWeight: FontWeight.w700,
          ),
        ),
      ],
    );
  }
}

class _ProfileImageWithLiveBadge extends StatelessWidget {
  const _ProfileImageWithLiveBadge(
    this.channel,
    this.profileImageRadius,
  );

  final Channel channel;
  final double profileImageRadius;

  @override
  Widget build(BuildContext context) {
    return channel.openLive == true
        ? Stack(
            children: [
              _profileImage(),
              const Align(
                alignment: Alignment.bottomCenter,
                child: LiveBadge(
                  text: 'LIVE',
                  backgroundColor: AppColors.redColor,
                ),
              ),
            ],
          )
        : _profileImage();
  }

  Widget _profileImage() {
    return CircleAvatarProfileImage(
      profileImageUrl: channel.channelImageUrl,
      useBorder: channel.openLive ?? false,
      radius: profileImageRadius * 2,
    );
  }
}
