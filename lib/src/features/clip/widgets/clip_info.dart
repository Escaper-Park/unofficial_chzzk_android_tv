import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/tag_badge.dart';
import '../../channel/model/channel.dart';
import '../../channel/widgets/channel_data/channel_name_with_verified_mark.dart';
import '../model/clip.dart';

class ClipInfo extends StatelessWidget {
  const ClipInfo({super.key, required this.clip});

  final NaverClip clip;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 8.0,
        horizontal: 10.0,
      ),
      child: Row(
        children: [
          CircleAvatarProfileImage(
            profileImageUrl: clip.ownerChannel.channelImageUrl,
            radius: 15.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Clip Title
                Expanded(
                  child: Text(
                    clip.clipTitle,
                    style: const TextStyle(
                      fontSize: 13.0,
                      color: AppColors.whiteColor,
                      overflow: TextOverflow.clip,
                    ),
                  ),
                ),
                const SizedBox(height: 5.0),
                // Channel name and read count,
                ChannelNameWithVerifiedMark(
                  fontSize: 13.0,
                  channel: Channel(
                    channelId: clip.ownerChannelId,
                    channelName: clip.ownerChannel.channelName,
                    channelImageUrl: clip.ownerChannel.channelImageUrl,
                    verifiedMark: clip.ownerChannel.verifiedMark,
                    personalData: null,
                    followerCount: null,
                    openLive: false,
                    channelType: '',
                    channelDescription: '',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ClipStatus extends StatelessWidget {
  const ClipStatus({
    super.key,
    required this.clip,
  });

  final NaverClip clip;

  @override
  Widget build(BuildContext context) {
    return TagBadge(
      margin: const EdgeInsets.all(8.0),
      backgroundColor: AppColors.blackColor,
      text: '조회수 ${clip.readCount} \u00b7 ${clip.createdDate.split(' ')[0]}',
    );
  }
}
