import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/dpad_widgets.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../../following/widgets/following_button.dart';
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
        VodStreamFollowingButton(
          channel: channel,
          videoFocusNode: videoFocusNode,
          followingButtonFSN: followingButtonFSN,
          videoListFSN: vodListFSN,
        ),
      ],
    );
  }
}

class VodStreamFollowingButton extends HookConsumerWidget {
  const VodStreamFollowingButton({
    super.key,
    required this.channel,
    required this.videoFocusNode,
    required this.followingButtonFSN,
    required this.videoListFSN,
  });

  final Channel channel;
  final FocusNode videoFocusNode;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode videoListFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return StreamChannelFollowingButton(
      channel: channel,
      pauseTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              seconds: 6000, // Keep Focus
              overlayType: VodOverlayType.channelData,
              videoFocusNode: followingButtonFSN,
            );
      },
      restartTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              overlayType: VodOverlayType.channelData,
              videoFocusNode: videoFocusNode,
            );
        focusNode.requestFocus();
      },
      cancelTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              seconds: 0,
              overlayType: VodOverlayType.none,
              videoFocusNode: videoFocusNode,
            );
      },
      childBuilder: (context, onPressed, isFollowing) {
        return DpadFocusScopeNavigator(
          node: followingButtonFSN,
          dpadKeyFocusScopeNodeMap: {DpadAction.arrowDown: videoListFSN},
          onFocusChange: (value) {
            if (value) focusNode.requestFocus();
          },
          child: FollowingButton(
            height: 30.0,
            width: 70.0,
            fontSize: 11.0,
            padding: 5.0,
            iconSize: 15.0,
            focusNode: focusNode,
            isFollowing: isFollowing,
            onPressed: onPressed,
          ),
        );
      },
      placeHolder: const SizedBox(height: 30.0, width: 70.0),
    );
  }
}
