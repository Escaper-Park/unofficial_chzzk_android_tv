import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../common/stream_channel_following_button.dart';
import '../../../controller/vod_player_controller.dart';

class VodStreamChannelNameWithFollowingButton extends ConsumerWidget {
  const VodStreamChannelNameWithFollowingButton({
    super.key,
    required this.channel,
    required this.videoFocusNode,
    required this.followingButtonFSN,
    required this.vodListFSN,
  });

  final Channel channel;
  final FocusNode videoFocusNode;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode vodListFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          '[${channel.channelName}] 채널의 동영상',
          style: const TextStyle(
            fontSize: 14.0,
            color: AppColors.whiteColor,
            fontWeight: FontWeight.w600,
          ),
        ),
        // Following Button
        StreamChannelFollowingButton(
          channel: channel,
          followingButtonFSN: followingButtonFSN,
          videoListFSN: vodListFSN,
          pauseTimer: () {
            ref.read(vodPlayerControllerProvider.notifier).changeOverlay(
                  seconds: 6000, // Keep Focus
                  overlayType: VodOverlayType.channelData,
                  videoFocusNode: followingButtonFSN,
                );
          },
          restartTimer: () {
            ref.read(vodPlayerControllerProvider.notifier).changeOverlay(
                  overlayType: VodOverlayType.channelData,
                  videoFocusNode: videoFocusNode,
                  seconds: 0,
                );
          },
        ),
      ],
    );
  }
}
