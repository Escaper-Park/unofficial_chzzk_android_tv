import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/focused_widget.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../common/stream_channel_following_button.dart';
import '../../../controller/vod_overlay_controller.dart';

class VodStreamFollowingButton extends HookConsumerWidget {
  const VodStreamFollowingButton({
    super.key,
    required this.channel,
    required this.videoFocusNode,
    required this.controlsFSN,
    required this.playbackSliderFSN,
  });

  final Channel channel;
  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;
  final FocusScopeNode playbackSliderFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusNode = useFocusNode();

    return StreamChannelFollowingButton(
      channel: channel,
      pauseTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              seconds: 600, // Keep Focus
              overlayType: VodOverlayType.main,
              videoFocusNode: controlsFSN,
            );
      },
      restartTimer: () {
        ref.read(vodOverlayControllerProvider.notifier).changeOverlay(
              overlayType: VodOverlayType.main,
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
      placeHolder: _followingButtonFrame(
        focusNode: null,
        isFollowing: false,
        onPressed: () {},
      ),
      childBuilder: (context, onPressed, isFollowing) {
        // return DpadFocusScopeNavigator(
        //   node: followingButtonFSN,
        //   dpadKeyFocusScopeNodeMap: {DpadAction.arrowDown: videoListFSN},
        //   onFocusChange: (value) {
        //     if (value) focusNode.requestFocus();
        //   },
        //   child: FollowingButton(
        //     height: 30.0,
        //     width: 70.0,
        //     fontSize: 11.0,
        //     padding: 5.0,
        //     iconSize: 15.0,
        //     focusNode: focusNode,
        //     isFollowing: isFollowing,
        //     onPressed: onPressed,
        //   ),
        // );
        return _followingButtonFrame(
          focusNode: focusNode,
          isFollowing: isFollowing,
          onPressed: onPressed,
        );
      },
    );
  }

  Widget _followingButtonFrame({
    required FocusNode? focusNode,
    required bool isFollowing,
    required VoidCallback onPressed,
  }) {
    return FocusedOutlinedButton(
      focusNode: focusNode,
      onPressed: onPressed,
      focusedBackgroundColor: Colors.transparent,
      padding: const EdgeInsets.all(5.0),
      child: (_) => SizedBox(
        width: 40.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isFollowing
                  ? Icons.favorite_rounded
                  : Icons.favorite_border_rounded,
              size: 25.0,
              color: AppColors.whiteColor,
            ),
            const SizedBox(height: 5.0),
            const Text(
              '팔로잉',
              style: TextStyle(
                fontSize: 11.0,
                overflow: TextOverflow.ellipsis,
                color: AppColors.whiteColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
