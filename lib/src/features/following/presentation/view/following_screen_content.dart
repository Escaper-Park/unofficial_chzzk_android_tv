part of 'following_screen.dart';

Widget _followingScreenContent({
  required BuildContext context,
  required FollowingState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
  required FollowingChannelFocusRegistry focusRegistry,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      FollowingLayout(
        state: state,
        tabsNode: tabsNode,
        gridNode: gridNode,
        focusRegistry: focusRegistry,
        onAuthPressed: () => context.go(AppRoute.auth.path),
        onTabSelected: (tab) {
          context.read<FollowingBloc>().add(
            FollowingEvent.tabSelected(tab),
          );
        },
        onSortPressed: () {
          showSortPanel.value = true;
          sortOverlayController.show();
        },
        onRetry: () {
          context.read<FollowingBloc>().add(
            const FollowingEvent.retryRequested(),
          );
        },
        onLoadMore: () {
          context.read<FollowingBloc>().add(
            const FollowingEvent.loadMoreRequested(),
          );
        },
        onLivePressed: (item) {
          unawaited(openLivePlayerFromCard(context, item));
        },
        onVodPressed: (item) {
          unawaited(openVodPlayerFromCard(context, item));
        },
        onChannelPressed: (channel, index) {
          context.read<FollowingBloc>().add(
            FollowingEvent.channelModalOpened(
              channel: channel,
              index: index,
            ),
          );
        },
        onCategoryPressed: (item) => _openCategory(context, item),
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}
