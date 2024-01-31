import 'package:flutter/material.dart';

import '../../../../constants/styles.dart';
import '../../../../model/live/live.dart';
import '../../../common/circle_avatar_profile_image.dart';
import '../../../common/custom_outline_button.dart';
import '../../../common/live_badge.dart';

class MultiViewInfo extends StatelessWidget {
  const MultiViewInfo({
    super.key,
    required this.liveDetail,
    required this.onPressed,
    this.autofocuse = false,
  });

  final LiveDetail liveDetail;
  final VoidCallback onPressed;
  final bool autofocuse;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      autofocus: autofocuse,
      onPressed: onPressed,
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded( // Check
            child: CircleAvatarProfileImage(
              profileImageUrl: liveDetail.channel.channelImageUrl,
              hasBorder: true,
              radius: 20.0,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            liveDetail.channel.channelName,
            style: const TextStyle(
              fontSize: 13.0,
              color: AppColors.greyColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          Text(
            liveDetail.liveTitle,
            style: const TextStyle(
              fontSize: 11.0,
              color: AppColors.whiteColor,
              overflow: TextOverflow.ellipsis,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 5.0),
          LiveBadge(
            text: (liveDetail.liveCategoryValue == null ||
                    liveDetail.liveCategoryValue!.isEmpty)
                ? '?'
                : liveDetail.liveCategoryValue!,
            backgroundColor: AppColors.greyContainerColor,
          )
        ],
      ),
    );
  }
}
