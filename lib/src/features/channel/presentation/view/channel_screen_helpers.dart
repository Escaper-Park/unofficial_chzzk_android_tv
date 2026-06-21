part of 'channel_screen.dart';

void _handleBack({
  required BuildContext context,
  required ChannelState state,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required FocusScopeNode tabsNode,
  required FocusScopeNode homeStateNode,
  required FocusScopeNode homeLiveNode,
  required FocusScopeNode homeVodNode,
  required FocusScopeNode vodGridNode,
}) {
  if (showSortPanel.value) {
    showSortPanel.value = false;
    if (sortOverlayController.isShowing) {
      sortOverlayController.hide();
    }
    requestTvSectionFocus(tabsNode);
    return;
  }

  if (state.groupPanel != null) {
    context.read<ChannelBloc>().add(const ChannelEvent.groupPanelDismissed());
    requestTvSectionFocus(tabsNode);
    return;
  }

  if (state.selectedTab == ChannelTab.vod && vodGridNode.hasFocus) {
    requestTvSectionFocus(tabsNode);
    return;
  }

  if (state.selectedTab == ChannelTab.home) {
    if (homeVodNode.hasFocus) {
      requestTvSectionFocus(tabsNode);
      return;
    }

    if (homeLiveNode.hasFocus || homeStateNode.hasFocus) {
      requestTvSectionFocus(tabsNode);
      return;
    }
  }

  _popOrHome(context);
}

Future<void> _handleFollowPressed({
  required BuildContext context,
  required ChannelState state,
}) async {
  if (!state.canUseFollowAction) {
    return;
  }

  if (!state.isFollowing) {
    context.read<ChannelBloc>().add(const ChannelEvent.followRequested());
    return;
  }

  final channelName = state.profile?.channelName.trim();
  final result = await showTvDialog(
    context: context,
    type: TvDialogType.alert,
    title: ChannelScreenString.confirmUnfollowTitle,
    content: ChannelScreenString.confirmUnfollowContent(
      channelName == null || channelName.isEmpty
          ? ChannelScreenString.fallbackChannelName
          : channelName,
    ),
    primaryLabel: ChannelScreenString.confirmUnfollowPrimary,
    secondaryLabel: ChannelScreenString.confirmUnfollowSecondary,
    icon: Icons.favorite_border_rounded,
  );

  if (!context.mounted || result != TvDialogResult.primary) {
    return;
  }

  context.read<ChannelBloc>().add(const ChannelEvent.unfollowRequested());
}

void _popOrHome(BuildContext context) {
  if (context.canPop()) {
    context.pop();
    return;
  }

  context.go(AppRoute.home.path);
}
