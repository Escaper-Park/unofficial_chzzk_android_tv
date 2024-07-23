import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/dpad_widgets.dart';
import '../../../following/controller/following_controller.dart';
import '../../../following/model/following.dart';
import '../../../following/widgets/following_button.dart';
import '../../controller/channel_controller.dart';
import '../../model/channel.dart';

class ChannelFollowingButton extends HookConsumerWidget {
  /// Following button of a channel.
  const ChannelFollowingButton({
    super.key,
    required this.channel,
    required this.followingButtonFSN,
    required this.channelListFSN,
    required this.belowFSN,
  });

  final Channel channel;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode channelListFSN;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Get following list for checking channel is already following.
    final asyncFollowingChannels = ref.watch(followingControllerProvider);

    // Highlight border
    final focusNode = useFocusNode();

    return DpadFocusScopeNavigator(
      node: followingButtonFSN,
      dpadKeyFocusScopeNodeMap: {
        DpadAction.arrowLeft: channelListFSN,
        DpadAction.arrowDown: belowFSN,
      },
      onFocusChange: (value) {
        if (value) focusNode.requestFocus();
      },
      child: Align(
        alignment: Alignment.topRight,
        child: FollowingButton<Following>(
          focusNode: focusNode,
          asyncValue: asyncFollowingChannels,
          checkIsFollowing: (following) =>
              following.channelId == channel.channelId,
          unfollowWarning: '[${channel.channelName}] 채널 팔로우를 취소하시겠습니까?',
          onPressed: (isFollowing) async {
            // result of (un)following
            bool result = false;

            // Unfollow
            if (isFollowing) {
              result = await ref
                  .read(channelControllerProvider.notifier)
                  .unFollow(channel.channelId);
            }
            // Follow
            else {
              result = await ref
                  .read(channelControllerProvider.notifier)
                  .follow(channel.channelId);
            }

            // Refresh following list.
            if (result) {
              ref.invalidate(followingControllerProvider);
            }
          },
        ),
      ),
    );
  }
}
