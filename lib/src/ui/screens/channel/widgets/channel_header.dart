import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../constants/styles.dart';
import '../../../../model/channel/channel.dart';
import '../../../common/circle_avatar_profile_image.dart';
import '../../../common/live_badge.dart';

class ChannelHeader extends StatelessWidget {
  const ChannelHeader({
    super.key,
    required this.channel,
    this.profileImageRadius = 45.0,
  });

  final Channel channel;
  final double profileImageRadius;

  @override
  Widget build(BuildContext context) {
    final formatter = NumberFormat("#,###", 'en_US');

    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: profileImageRadius * 2 + 5.0,
          width: profileImageRadius * 2,
          child: _profileImageWithLiveBadge(),
        ),
        const SizedBox(width: 16.0),
        Expanded(
          child: Column(
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
                channel.channelDescription ?? '',
                style: const TextStyle(
                  fontSize: 14.0,
                  color: AppColors.greyColor,
                  overflow: TextOverflow.ellipsis,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        )
      ],
    );
  }

  Widget _profileImageWithLiveBadge() {
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
      hasBorder: channel.openLive ?? false,
      radius: profileImageRadius,
    );
  }
}
