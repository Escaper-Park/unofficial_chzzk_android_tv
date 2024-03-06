import 'package:flutter/material.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../../common/widgets/rounded_container.dart';
import '../../../../../features/live/model/live.dart';
import '../../../../../features/live/widgets/live_badge.dart';

class LiveStreamInfo extends StatelessWidget {
  const LiveStreamInfo({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    const double profileImageRadius = 20.0;

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IntrinsicWidth(
          child: RoundedContainer(
            height: Dimensions.liveStreamingInfoContainerHeight,
            backgroundColor: AppColors.blackColor.withOpacity(0.75),
            padding: const EdgeInsets.symmetric(
              horizontal: 20.0,
              vertical: 10.0,
            ),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: profileImageRadius * 2,
                  child: CircleAvatarProfileImage(
                    profileImageUrl: liveDetail.channel.channelImageUrl,
                    radius: profileImageRadius,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        liveDetail.channel.channelName,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      Text(
                        liveDetail.liveTitle.replaceAll('\n', ' '),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      LiveBadge(
                        text: liveDetail.liveCategoryValue ?? '?',
                        backgroundColor: AppColors.greyContainerColor,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
