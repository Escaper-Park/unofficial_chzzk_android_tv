import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/dpad_widgets.dart';
import '../../../utils/popup/popup_utils.dart';
import '../../channel/controller/channel_controller.dart';
import '../../channel/model/channel.dart';
import '../../following/controller/following_controller.dart';
import '../../following/widgets/following_button.dart';

class StreamChannelFollowingButton extends HookConsumerWidget {
  const StreamChannelFollowingButton({
    super.key,
    required this.channel,
    required this.followingButtonFSN,
    required this.videoListFSN,
    required this.pauseTimer,
    required this.restartTimer,
  });

  final Channel channel;
  final FocusScopeNode followingButtonFSN;
  final FocusScopeNode videoListFSN;

  /// Pause video player controller's timer when the popup dialog has focus.
  final VoidCallback pauseTimer;

  /// Pause video player controller's timer when the popup dialog has focus.
  final VoidCallback restartTimer;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingChannel = ref.watch(followingControllerProvider);

    final focusNode = useFocusNode();
    final isLoading = useState<bool>(false);

    return asyncFollowingChannel.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();

        bool isFollowing =
            data.any((following) => following.channelId == channel.channelId);

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
            onPressed: () async {
              // deactivate button to prevent multiple pressed.
              isLoading.value = true;
              bool result = false;

              // unfollow
              if (isFollowing && context.mounted) {
                // Pause timer
                pauseTimer();

                await PopupUtils.showButtonDialog(
                  context: context,
                  buttonType: DialogButtonType.doubleButton,
                  titleText: '팔로우 취소',
                  confirmText: '팔로우 취소',
                  cancelText: '닫기',
                  contentText: '[${channel.channelName}] 채널 팔로우를 취소하시겠습니까?',
                  confirmCallback: () async {
                    result = await ref
                        .read(channelControllerProvider.notifier)
                        .unFollow(channel.channelId);

                    restartTimer();
                  },
                  cancelFallback: () {
                    restartTimer();
                  },
                );
              }
              // follow
              else {
                result = await ref
                    .read(channelControllerProvider.notifier)
                    .follow(channel.channelId);
              }

              // restartTimer();
              if (result) ref.invalidate(followingControllerProvider);

              isLoading.value = false;
            },
          ),
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => const SizedBox.shrink(),
    );
  }
}
