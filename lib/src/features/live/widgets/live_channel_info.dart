import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/optimized_image.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../channel/model/channel.dart';
import '../model/live.dart';

class LiveChannelInfo extends StatelessWidget {
  const LiveChannelInfo({super.key, required this.liveDetail});

  final LiveDetail liveDetail;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 10.0,
        vertical: 5.0,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          // Profile image
          SizedBox(
            width: 30.0,
            child: CircleAvatarProfileImage(
                profileImageUrl: liveDetail.channel.channelImageUrl),
          ),
          const SizedBox(width: 15.0),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Live title
                _LiveTitle(liveTitle: liveDetail.liveTitle),
                const SizedBox(height: 3.0),
                // Channel name
                _ChannelName(channel: liveDetail.channel),
                // Category
                const SizedBox(height: 3.0),
                _LiveCategory(liveCategoryValue: liveDetail.liveCategoryValue),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _LiveTitle extends StatelessWidget {
  const _LiveTitle({required this.liveTitle});

  final String liveTitle;

  @override
  Widget build(BuildContext context) {
    return Text(
      liveTitle.replaceAll('\n', ' '),
      style: const TextStyle(
        fontSize: 13.0,
        overflow: TextOverflow.ellipsis,
        color: AppColors.whiteColor,
        fontWeight: FontWeight.w600,
      ),
    );
  }
}

class _ChannelName extends StatelessWidget {
  const _ChannelName({required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    return channel.verifiedMark == true
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

  Widget _channelName() {
    return Text(
      channel.channelName,
      style: const TextStyle(
        fontSize: 13.0,
        overflow: TextOverflow.ellipsis,
        color: AppColors.greyColor,
        fontWeight: FontWeight.w800,
      ),
    );
  }
}

class _LiveCategory extends StatelessWidget {
  const _LiveCategory({required this.liveCategoryValue});

  final String? liveCategoryValue;

  @override
  Widget build(BuildContext context) {
    return RoundedContainer(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      borderRadius: 3.0,
      backgroundColor: (liveCategoryValue == null || liveCategoryValue!.isEmpty)
          ? Colors.transparent
          : Colors.black54,
      child: Text(
        liveCategoryValue ?? '?',
        style: const TextStyle(
          fontSize: 12.0,
          color: AppColors.greyColor,
          overflow: TextOverflow.ellipsis,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
