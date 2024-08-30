import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../../../common/constants/styles.dart';
import '../../../../../../common/widgets/focused_widget.dart';
import '../../../../../channel/model/channel.dart';
import '../../../../common/stream_channel_following_button.dart';
import '../../../controller/live_overlay_controller.dart';

class LiveStreamFollowingButton extends ConsumerWidget {
  const LiveStreamFollowingButton({
    super.key,
    required this.channel,
    required this.followingButtonFocusNode,
    required this.videoFocusNode,
    required this.controlsFSN,
  });

  final Channel channel;
  final FocusNode followingButtonFocusNode;
  final FocusNode videoFocusNode;
  final FocusScopeNode controlsFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return StreamChannelFollowingButton(
      channel: channel,
      pauseTimer: () {
        ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
              seconds: 600, // Keep focus 10m
              overlayType: LiveOverlayType.main,
              videoFocusNode: controlsFSN,
            );
      },
      restartTimer: () {
        ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
              overlayType: LiveOverlayType.main,
              videoFocusNode: followingButtonFocusNode,
            );

        followingButtonFocusNode.requestFocus();
      },
      cancelTimer: () {
        ref.read(liveOverlayControllerProvider.notifier).changeOverlay(
              seconds: 0,
              overlayType: LiveOverlayType.none,
              videoFocusNode: videoFocusNode,
            );
      },
      placeHolder: _followingButtonFrame(
        focusNode: null,
        isFollowing: false,
        onPressed: () {},
      ),
      childBuilder: (context, onPressed, isFollowing) {
        return _followingButtonFrame(
          focusNode: followingButtonFocusNode,
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
