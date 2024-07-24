import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/focused_widget.dart';
import '../../../utils/formatter/formatter.dart';

import '../model/following.dart';

class FollowingChannelInfoCard extends StatelessWidget {
  /// Following channel's profile, name, and concurrent live status.
  const FollowingChannelInfoCard({
    super.key,
    this.autofocus = false,
    required this.following,
    required this.onPressed,
  });

  final bool autofocus;

  /// Following channel
  final Following following;

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    const double profileImageRadius = 15.0;
    return FocusedOutlinedButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: (_) => Row(
        children: [
          // Profile image
          SizedBox(
            width: profileImageRadius * 2,
            child: CircleAvatarProfileImage(
              radius: profileImageRadius,
              profileImageUrl: following.channel.channelImageUrl,
              useBorder: following.streamer.openLive,
            ),
          ),
          const SizedBox(width: 10.0),
          // Channel Name,
          Expanded(
            // If openLive is true, Divide the channel name and concurrent user count area
            // in a 2:1 ratio.
            flex: 2,
            child: Text(
              following.channel.channelName,
              style: const TextStyle(
                fontSize: 12.0,
                color: AppColors.greyColor,
                overflow: TextOverflow.ellipsis,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const SizedBox(width: 5.0),
          if (following.streamer.openLive) _concurrentUserCount(),
        ],
      ),
    );
  }

  Widget _concurrentUserCount() {
    final String concurrentUserCount =
        following.liveInfo.concurrentUserCount.commaFormat();

    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Icon(
            Icons.circle,
            size: 5.0,
            color: AppColors.lightRedColor,
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Align(
              // Align to the right side.
              alignment: Alignment.centerRight,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  concurrentUserCount,
                  style: const TextStyle(
                    fontSize: 11.0,
                    color: AppColors.lightRedColor,
                    // overflow: TextOverflow.visible,
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
