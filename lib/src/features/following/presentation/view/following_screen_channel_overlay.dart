part of 'following_screen.dart';

Widget _followingScreenChannelOverlay({
  required BuildContext context,
  required FollowingState state,
  required FocusScopeNode modalNode,
  required FollowingChannelFocusRegistry focusRegistry,
}) {
  return _channelModalFor(
    state: state,
    modalNode: modalNode,
    focusRegistry: focusRegistry,
    onWatchLive: (channel) {
      context.read<FollowingBloc>().add(
        const FollowingEvent.channelModalClosed(),
      );
      unawaited(
        openLivePlayerFromChannel(
          context,
          channelId: channel.channelId,
          title: channel.liveInfo?.title ?? channel.channelName,
          thumbnailImageUrl:
              channel.liveInfo?.thumbnailImageUrl ??
              channel.liveInfo?.defaultThumbnailImageUrl,
        ),
      );
    },
    onMoveToChannel: (channel) {
      context.read<FollowingBloc>().add(
        const FollowingEvent.channelModalClosed(),
      );
      _openChannel(context, channel);
    },
    onFollow: (channel) {
      context.read<FollowingBloc>().add(
        FollowingEvent.channelFollowRequested(channel),
      );
    },
    onUnfollow: (channel) {
      unawaited(
        _confirmChannelUnfollow(context, channel),
      );
    },
    onShowGroupList: (channel) {
      context.read<FollowingBloc>().add(
        FollowingEvent.channelGroupListRequested(channel),
      );
    },
    onAddToGroup: (channel, group) {
      context.read<FollowingBloc>().add(
        FollowingEvent.channelAddToGroupRequested(
          channel: channel,
          group: group,
        ),
      );
    },
    onDismiss: () {
      context.read<FollowingBloc>().add(
        const FollowingEvent.channelModalClosed(),
      );
      final activeModal = state.activeChannelModal;
      if (activeModal != null) {
        focusRegistry
            .maybeNodeFor(activeModal.channel.channelId)
            ?.requestFocus();
      }
    },
  );
}
