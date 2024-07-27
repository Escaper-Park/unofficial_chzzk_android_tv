import 'package:flutter/material.dart';

import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../../common/widgets/rounded_container.dart';
import '../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../../utils/marquee/marquee.dart';
import '../../../../vod/model/vod.dart';
import './vod_stream_status.dart';

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
        child: RoundedContainer(
          width: 320.0,
          height: 85.0,
          backgroundColor: AppColors.blackColor.withOpacity(0.6),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            // Centered Profile image
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Profile image
              CircleAvatarProfileImage(
                profileImageUrl: vod.channel.channelImageUrl,
                useBorder: false,
                radius: 22.5,
              ),
              const SizedBox(width: 10.0),
              Expanded(
                child: Column(
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
                    VodStreamStatus(vod: vod),
                  ],
                ),
              )
            ],
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
    // Remove newline.
    final newlineRemovedTitle = videoTitle.replaceAll('\n', ' ');

    return Marquee(
      behavior: MarqueeBehavior.scroll,
      hasFocus: true,
      items: [
        Text(
          newlineRemovedTitle,
          style: const TextStyle(
            fontSize: 13.0,
            fontWeight: FontWeight.w600,
            color: AppColors.whiteColor,
          ),
        ),
      ],
    );
  }
}
