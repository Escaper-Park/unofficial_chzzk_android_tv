import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../model/following/following.dart';
import '../../../common/circle_avatar_profile_image.dart';
import '../../../common/custom_outline_button.dart';

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
    return CustomOutlineButton(
      autofocus: autofocus,
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Row(
          children: [
            // Profile Image
            CircleAvatarProfileImage(
              profileImageUrl: following.channel.channelImageUrl,
              hasBorder: following.streamer.openLive,
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
            // Current user count
            if (following.streamer.openLive)
              Expanded(
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
              ),
          ],
        ),
      ),
    );
  }
}
