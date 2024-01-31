import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../constants/styles.dart';
import '../../../../controller/multi_view/multi_view_controller.dart';
import '../../../../model/live/live.dart';
import '../../../common/circle_avatar_profile_image.dart';
import '../../../common/custom_outline_button.dart';

class MultiViewSelectedChannelCard extends ConsumerWidget {
  const MultiViewSelectedChannelCard({
    super.key,
    required this.liveDetail,
    required this.index,
  });

  final LiveDetail liveDetail;
  final int index;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final soundControls = ref.watch(multiViewVolumeControlsProvider);

    const double iconBoxSize = 35.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatarProfileImage(
            profileImageUrl: liveDetail.channel.channelImageUrl,
            hasBorder: true,
            radius: 15.0,
          ),
          const SizedBox(width: 10.0),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  liveDetail.channel.channelName,
                  style: const TextStyle(
                    fontSize: 14.0,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                width: iconBoxSize,
                height: iconBoxSize,
                child: CustomOutlineButton(
                  onPressed: () {
                    ref
                        .read(multiViewControllerProvider.notifier)
                        .removeChannel(liveDetail.channel.channelId);
                  },
                  child: const Center(
                    child: Icon(
                      Icons.highlight_remove_rounded,
                      size: iconBoxSize - 10.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10.0),
              SizedBox(
                width: iconBoxSize,
                height: iconBoxSize,
                child: CustomOutlineButton(
                  onPressed: () {
                    ref
                        .read(multiViewVolumeControlsProvider.notifier)
                        .muteOrUnmute(
                          index: index,
                          init: true,
                        );
                  },
                  child: Center(
                    child: Icon(
                      soundControls[index] == 0.0
                          ? Icons.volume_off_rounded
                          : Icons.volume_up_rounded,
                      size: iconBoxSize - 10.0,
                      color: AppColors.whiteColor,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
