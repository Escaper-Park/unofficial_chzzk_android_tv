part of 'browse_screen.dart';

Widget _browseScreenContent({
  required BuildContext context,
  required BrowseState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      BrowseLayout(
        state: state,
        tabsNode: tabsNode,
        gridNode: gridNode,
        onAuthPressed: () => context.go(AppRoute.auth.path),
        onTabSelected: (tab) {
          context.read<BrowseBloc>().add(
            BrowseEvent.tabSelected(tab),
          );
        },
        onSortPressed: () {
          showSortPanel.value = true;
          sortOverlayController.show();
        },
        onRetry: () {
          context.read<BrowseBloc>().add(
            const BrowseEvent.retryRequested(),
          );
        },
        onLoadMore: () {
          context.read<BrowseBloc>().add(
            const BrowseEvent.loadMoreRequested(),
          );
        },
        onLivePressed: (item) {
          unawaited(openLivePlayerFromCard(context, item));
        },
        onVodPressed: (item) {
          unawaited(openVodPlayerFromCard(context, item));
        },
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}
