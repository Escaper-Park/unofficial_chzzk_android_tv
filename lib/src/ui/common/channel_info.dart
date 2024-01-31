import 'package:flutter/material.dart';

import './circle_avatar_profile_image.dart';
import './optimized_image.dart';
import './rounded_container.dart';

import '../../constants/assets_path.dart';
import '../../constants/styles.dart';

import '../../model/live/live.dart';

class ChannelInfo extends StatelessWidget {
  const ChannelInfo({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 10.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // profile image
          CircleAvatarProfileImage(
            profileImageUrl: liveDetail.channel.channelImageUrl,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // live title
                Text(
                  liveDetail.liveTitle,
                  style: const TextStyle(
                    fontSize: 13.0,
                    overflow: TextOverflow.ellipsis,
                    color: AppColors.whiteColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                const SizedBox(height: 3.0),
                // channel name
                _channelNameWithMark(),
                const SizedBox(height: 3.0),
                // Category value
                RoundedContainer(
                  padding: const EdgeInsets.symmetric(horizontal: 5.0),
                  borderRadius: 3.0,
                  backgroundColor: (liveDetail.liveCategoryValue == null ||
                          liveDetail.liveCategoryValue!.isEmpty)
                      ? Colors.transparent
                      : AppColors.greyContainerColor,
                  child: Text(
                    liveDetail.liveCategoryValue ?? '',
                    style: const TextStyle(
                      fontSize: 12.0,
                      color: AppColors.greyColor,
                      overflow: TextOverflow.ellipsis,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _channelName() {
    return Text(
      liveDetail.channel.channelName,
      style: const TextStyle(
        fontSize: 13.0,
        overflow: TextOverflow.ellipsis,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  Widget _channelNameWithMark() {
    return liveDetail.channel.verifiedMark == true
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _channelName(),
              const SizedBox(width: 3.0),
              const OptimizedAssetImage(
                imagePath: AssetsPath.verifiedMark,
                imageWidth: 15.0,
              )
            ],
          )
        : _channelName();
  }
}
