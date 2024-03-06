import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../model/following.dart';

class FollowingChannelInfoCard extends StatelessWidget {
  const FollowingChannelInfoCard({
    super.key,
    required this.following,
    required this.onPressed,
    this.autofocus = false,
  });

  final Following following;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlineButton(
      autofocus: autofocus,
      onPressed: onPressed,
      padding: const EdgeInsets.all(10.0),
      child: Row(
        children: [
          // Profile Image
          SizedBox(
            width: 30.0,
            child: CircleAvatarProfileImage(
              profileImageUrl: following.channel.channelImageUrl,
              hasBorder: following.streamer.openLive,
            ),
          ),
          const SizedBox(width: 10.0),
          // Channel name
          Expanded(
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
    return Expanded(
      flex: 1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Icon(
            Icons.circle,
            size: 5.0,
            color: AppColors.lightRedColor,
          ),
          const SizedBox(width: 5.0),
          Expanded(
            child: Align(
              alignment: Alignment.centerLeft,
              child: FittedBox(
                fit: BoxFit.scaleDown,
                child: Text(
                  following.liveInfo.concurrentUserCount.toString(),
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
