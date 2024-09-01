import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../channel/controller/channel_controller.dart';
import '../../channel/model/channel.dart';
import '../../following/controller/following_controller.dart';

class StreamChannelFollowingButton extends HookConsumerWidget {
  const StreamChannelFollowingButton({
    super.key,
    required this.channel,
    required this.pauseTimer,
    required this.restartTimer,
    required this.cancelTimer,
    required this.childBuilder,
    required this.placeHolder,
  });

  final Channel channel;

  /// Pause video player controller's timer when the popup dialog has focus.
  final VoidCallback pauseTimer;

  /// Pause video player controller's timer when the popup dialog has focus.
  final VoidCallback restartTimer;

  /// Timer ends when you do unfollow
  final VoidCallback cancelTimer;

  /// Placeholder for loading state.
  final Widget placeHolder;

  /// child with onPressed function.
  final Widget Function(
          BuildContext context, VoidCallback onPressed, bool isFollowing)
      childBuilder;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingChannel = ref.watch(followingControllerProvider);

    final isLoading = useState<bool>(false);

    return asyncFollowingChannel.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();

        bool isFollowing =
            data.any((following) => following.channelId == channel.channelId);

        return childBuilder(context,
            () => onPressed(context, ref, isLoading, isFollowing), isFollowing);
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => placeHolder,
    );
  }

  Future<void> onPressed(
    BuildContext context,
    WidgetRef ref,
    ValueNotifier<bool> isLoading,
    bool isFollowing,
  ) async {
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

          cancelTimer();
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
  }
}
