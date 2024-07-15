import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../common/widgets/rounded_container.dart';
import '../../../../features/vod/model/vod.dart';

class VodStreamInfo extends StatelessWidget {
  const VodStreamInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    const double profileImageRadius = 20.0;

    final DateTime publishDate =
        DateFormat('yyyy-MM-dd HH:mm:ss').parse(vod.publishDate);

    final String publishDateString =
        '${publishDate.year} / ${publishDate.month.toString().padLeft(2, '0')} / ${publishDate.day.toString().padLeft(2, '0')}';

    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topLeft,
        child: IntrinsicWidth(
          child: RoundedContainer(
            height: Dimensions.vodStreamingInfoContainerHeight,
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
                    profileImageUrl: vod.channel.channelImageUrl,
                    radius: profileImageRadius * 2,
                  ),
                ),
                const SizedBox(width: 10.0),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Channel name
                      Text(
                        vod.channel.channelName,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: AppColors.whiteColor,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      // Vod title
                      Text(
                        vod.videoTitle.replaceAll('\n', ' '),
                        style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          color: AppColors.whiteColor,
                        ),
                      ),
                      const SizedBox(height: 5.0),
                      // Vod publishDate
                      Text(publishDateString),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
