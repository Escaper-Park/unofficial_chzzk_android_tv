part of 'following_screen.dart';

Widget _channelModalFor({
  required FollowingState state,
  required FocusScopeNode modalNode,
  required FollowingChannelFocusRegistry focusRegistry,
  required ValueChanged<FollowingChannel> onWatchLive,
  required ValueChanged<FollowingChannel> onMoveToChannel,
  required ValueChanged<FollowingChannel> onFollow,
  required ValueChanged<FollowingChannel> onUnfollow,
  required ValueChanged<FollowingChannel> onShowGroupList,
  required void Function(FollowingChannel channel, GroupItem group)
  onAddToGroup,
  required VoidCallback onDismiss,
}) {
  final activeModal = state.activeChannelModal;
  if (activeModal == null) {
    return const SizedBox.shrink();
  }

  return FollowingChannelModal(
    modalState: activeModal,
    node: modalNode,
    openerNode: focusRegistry.maybeNodeFor(activeModal.channel.channelId),
    anchorLink: focusRegistry.linkFor(activeModal.channel.channelId),
    onWatchLive: onWatchLive,
    onMoveToChannel: onMoveToChannel,
    onFollow: onFollow,
    onUnfollow: onUnfollow,
    onShowGroupList: onShowGroupList,
    onAddToGroup: onAddToGroup,
    onDismiss: onDismiss,
  );
}

void _handleBack({
  required BuildContext context,
  required FollowingState state,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
  required FollowingChannelFocusRegistry focusRegistry,
}) {
  final navigationNode = AppShellFocusScope.maybeNavigationOf(context);
  if (navigationNode?.hasFocus ?? false) {
    return;
  }

  if (showSortPanel.value) {
    showSortPanel.value = false;
    if (sortOverlayController.isShowing) {
      sortOverlayController.hide();
    }
    requestTvSectionFocus(tabsNode);
    return;
  }

  final activeModal = state.activeChannelModal;
  if (activeModal != null) {
    context.read<FollowingBloc>().add(
      const FollowingEvent.channelModalClosed(),
    );
    focusRegistry.maybeNodeFor(activeModal.channel.channelId)?.requestFocus();
    return;
  }

  if (gridNode.hasFocus) {
    requestTvSectionFocus(tabsNode);
    return;
  }

  navigationNode?.requestFocus();
}

Future<void> _confirmChannelUnfollow(
  BuildContext context,
  FollowingChannel channel,
) async {
  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: FollowingScreenString.confirmUnfollowTitle,
    content: FollowingScreenString.confirmUnfollowContent(
      channel.channelName,
    ),
    primaryLabel: FollowingScreenString.confirmUnfollowPrimary,
    secondaryLabel: FollowingScreenString.confirmUnfollowSecondary,
    icon: Icons.favorite_border_rounded,
  );

  if (!context.mounted || result != TvDialogResult.primary) {
    return;
  }

  context.read<FollowingBloc>().add(
    FollowingEvent.channelUnfollowRequested(channel),
  );
}

void _openChannel(BuildContext context, FollowingChannel channel) {
  unawaited(
    context.pushNamed(
      AppRoute.channel.name,
      pathParameters: {'channelId': channel.channelId},
    ),
  );
}

void _openCategory(BuildContext context, CategoryItem item) {
  unawaited(
    context.pushNamed(
      AppRoute.categoryDetail.name,
      pathParameters: {
        'categoryType': item.categoryType,
        'categoryId': item.categoryId,
      },
    ),
  );
}
