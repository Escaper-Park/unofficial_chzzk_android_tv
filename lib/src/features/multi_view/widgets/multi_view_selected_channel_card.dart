import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/circle_avatar_profile_image.dart';
import '../../../common/widgets/focused_outline_button.dart';
import '../../live/model/live.dart';
import '../controller/multi_view_controller.dart';
import '../../../utils/video_player/controller/multi_view_stream_controller.dart';

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
    final volumeControls = ref.watch(multiViewVolumeControllerProvider);

    const double iconBoxSize = 35.0;

    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatarProfileImage(
            profileImageUrl: liveDetail.channel.channelImageUrl,
            useBorder: true,
            radius: 30.0,
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
                child: FocusedOutlineButton(
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
                child: FocusedOutlineButton(
                  onPressed: () {
                    ref
                        .read(multiViewVolumeControllerProvider.notifier)
                        .muteOrUnmute(
                          index: index,
                          init: true,
                        );
                  },
                  child: Center(
                    child: Icon(
                      volumeControls[index] == 0.0
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
