import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../live/model/live.dart';
import '../../live/widgets/live_badge.dart';

class MultiViewLiveInfo extends StatelessWidget {
  const MultiViewLiveInfo({
    super.key,
    required this.liveDetail,
    required this.onPressed,
    this.autofocus = false,
  });

  final LiveDetail liveDetail;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlineButton(
      autofocus: true,
      onPressed: onPressed,
      padding: const EdgeInsets.all(5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            // Check
            child: CircleAvatarProfileImage(
              profileImageUrl: liveDetail.channel.channelImageUrl,
              useBorder: true,
              radius: 40.0,
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
