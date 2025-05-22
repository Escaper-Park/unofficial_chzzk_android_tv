import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/ui/ui_widgets.dart';
import '../../../../utils/popup/popup_utils.dart';
import '../../../channel/model/channel.dart';
import '../../../following/model/following.dart';

import 'stream_control_icon_button.dart';

import '../../stream_common_state.dart';
import '../../stream_common_event.dart';

class StreamFollowingButton extends ConsumerWidget
    with StreamCommonEvent, StreamCommonState {
  const StreamFollowingButton({
    super.key,
    required this.channel,
    required this.resetOverlayTimer,
    required this.hideOverlay,
  });

  final Channel channel;
  final VoidCallback resetOverlayTimer;
  final VoidCallback hideOverlay;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingList = getAsyncFollowingList(ref);

    return asyncFollowingList.when(
      data: (data) {
        if (data == null) return const SizedBox.shrink();

        bool isFollowing = data.any(
          (Following following) => following.channelId == channel.channelId,
        );

        return StreamControlIconButton(
          iconData: isFollowing
              ? Icons.favorite_rounded
              : Icons.favorite_border_rounded,
          label: '팔로잉',
          resetOverlayTimer: resetOverlayTimer,
          onPressed: () async {
            // deactivate button to prevent multiple pressed.

            if (isFollowing && context.mounted) {
              hideOverlay();

              // Unfollow Warning
              await PopupUtils.showWidgetDialog(
                context: context,
                backgroundColor: AppColors.greyContainerColor,
                widget: (dialogContext) => Consumer(
                  builder: (context, ref, child) {
                    return IntrinsicHeight(
                      child: _followingDialog(
                        ref,
                        isFollowing,
                        dialogContext,
                      ),
                    );
                  },
                ),
              );
            } else {
              // Do Follow
              await toggleFollow(
                ref,
                isFollowing: isFollowing,
                channel: channel,
              );

              hideOverlay();
            }
          },
        );
      },
      error: (_, __) => const SizedBox.shrink(),
      loading: () => _iconButton(),
    );
  }

  Widget _followingDialog(
    WidgetRef ref,
    bool isFollowing,
    BuildContext dialogContext,
  ) {
    return Column(
      children: [
        HeaderText(
          text: '${channel.channelName} 채널 팔로우를 취소하시겠습니까?',
          fontSize: 16.0,
        ),
        const SizedBox(height: 10.0),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _actionButton(
              true,
              '닫기',
              () {
                if (dialogContext.mounted) Navigator.pop(dialogContext);
              },
            ),
            const SizedBox(width: 10.0),
            _actionButton(false, '팔로우 취소', () async {
              // Do unFollow
              await toggleFollow(
                ref,
                isFollowing: isFollowing,
                channel: channel,
              );

              if (dialogContext.mounted) Navigator.pop(dialogContext);
            }),
          ],
        ),
      ],
    );
  }

  Widget _actionButton(
    bool autofocus,
    String actionText,
    VoidCallback onPressed,
  ) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      backgroundColor: AppColors.categoryTagBackgroundColor,
      padding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      onPressed: onPressed,
      child: Text(
        actionText,
        style: TextStyle(
          fontSize: 14.0,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _iconButton() {
    return StreamControlIconButton(
      iconData: Icons.favorite_border_rounded,
      resetOverlayTimer: resetOverlayTimer,
      label: '팔로잉',
      onPressed: () {},
    );
  }
}
