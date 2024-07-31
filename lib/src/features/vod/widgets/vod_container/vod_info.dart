import 'package:flutter/material.dart';

import '../../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../../utils/formatter/formatter.dart';
import '../../../../common/constants/styles.dart';
import '../../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../../model/vod.dart';
import './vod_title.dart';

class VodInfo extends StatelessWidget {
  /// Vod info
  const VodInfo({
    super.key,
    this.showChannelName = false,
    this.hasFocus,
    required this.vod,
  });

  final bool? hasFocus;

  /// Show channe name and verified mark.
  final bool showChannelName;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    final String readCount = vod.readCount.commaFormat();
    // yyyy-MM-dd
    final String publishDate = vod.publishDate.split(' ')[0];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Vod title
        Expanded(
          child: VodTitle(
            // useMarquee: showChannelName,
            hasFocus: hasFocus,
            vodTitle: vod.videoTitle,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(height: 3.0),
        // Channel name
        if (showChannelName) ChannelNameWithVerifiedMark(channel: vod.channel),
        if (showChannelName) const SizedBox(height: 1.0),
        // Read count and publishDate
        Text(
          '조회수 $readCount회 \u00B7 $publishDate',
          style: const TextStyle(
            color: AppColors.greyColor,
            fontSize: 11.0,
            // overflow: TextOverflow.ellipsis,
          ),
        ),
      ],
    );
  }
}

class VodInfoWithChannel extends StatelessWidget {
  /// Vod info with the channel profile.
  const VodInfoWithChannel({
    super.key,
    required this.hasFocus,
    required this.vod,
  });

  final bool? hasFocus;
  final Vod vod;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            width: 30.0,
            child: Center(
              child: CircleAvatarProfileImage(
                radius: 15.0,
                profileImageUrl: vod.channel.channelImageUrl,
              ),
            ),
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: VodInfo(
              hasFocus: hasFocus,
              vod: vod,
              showChannelName: true,
            ),
          ),
        ],
      ),
    );
  }
}
