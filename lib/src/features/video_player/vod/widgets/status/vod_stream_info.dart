import 'package:flutter/material.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../../common/widgets/rounded_container.dart';
import '../../../../../common/widgets/tag_badge.dart';
import '../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../vod/model/vod.dart';
import 'vod_stream_status.dart';

class VodStreamInfo extends StatelessWidget {
  const VodStreamInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Align(
        alignment: Alignment.topLeft,
        // IntrinsicWidth to get dynamic sized container depends on the live title or something.
        child: IntrinsicWidth(
          child: RoundedContainer(
            height: Dimensions.vodStreamInfoContainerHeight,
            backgroundColor: AppColors.blackColor.withOpacity(0.6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment:
                  CrossAxisAlignment.center, // Centered Profile image
              children: [
                // Profile image
                CircleAvatarProfileImage(
                  profileImageUrl: vod.channel.channelImageUrl,
                  useBorder: false,
                  radius: 45.0,
                ),
                const SizedBox(width: 10.0),
                // do not need expanded because of the IntrinsicWidth
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Channel name
                    ChannelNameWithVerifiedMark(
                      channel: vod.channel,
                      fontSize: 14.0,
                      fontColor: AppColors.whiteColor,
                    ),
                    const SizedBox(height: 3.0),
                    _VodStreamTitle(vod.videoTitle),
                    const SizedBox(height: 3.0),
                    _VodStreamCategory(vod.videoCategoryValue),
                    const SizedBox(height: 3.0),
                    VodStreamStatus(vod: vod),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _VodStreamTitle extends StatelessWidget {
  const _VodStreamTitle(this.videoTitle);

  final String videoTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      videoTitle.replaceAll('\n', ' '), // Remove newline.
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
        overflow: TextOverflow.ellipsis,
      ),
    );
  }
}

class _VodStreamCategory extends StatelessWidget {
  const _VodStreamCategory(this.category);

  final String? category;

  @override
  Widget build(BuildContext context) {
    return TagBadge(
      text: category ?? '?',
      backgroundColor: Colors.black54,
      fontColor: AppColors.greyColor,
    );
  }
}
