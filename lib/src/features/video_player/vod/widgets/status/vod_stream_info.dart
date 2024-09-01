import 'package:flutter/material.dart';

import '../../../../../common/constants/dimensions.dart';
import '../../../../../common/constants/styles.dart';
import '../../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../../../vod/model/vod.dart';
import '../../../common/controls_overlay_container.dart';
import './vod_stream_status.dart';

class VodStreamInfo extends StatelessWidget {
  const VodStreamInfo({super.key, required this.vod});

  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return ControlsOverlayContainer(
      alignment: Alignment.topLeft,
      height: Dimensions.vodStreamInfoContainerHeight,
      backgroundColor: AppColors.greyContainerColor,
      backgroundOpacity: 0.7,
      margin: const EdgeInsets.all(20.0),
      padding: const EdgeInsets.all(10.0),
      borderRadius: 12.0,
      useTopBorder: true,
      useBottomBorder: true,
      child: IntrinsicWidth(
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
                  const SizedBox(height: 5.0),
                  // Vod title
                  _VodStreamTitle(vod.videoTitle),
                  const SizedBox(height: 5.0),
                  // Vod Status
                  VodStreamStatus(vod: vod),
                ],
              ),
            )
          ],
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

    return Text(
      newlineRemovedTitle,
      style: const TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w600,
        color: AppColors.whiteColor,
      ),
    );
  }
}
