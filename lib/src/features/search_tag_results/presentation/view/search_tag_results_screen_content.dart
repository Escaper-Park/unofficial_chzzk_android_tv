part of 'search_tag_results_screen.dart';

Widget _searchTagResultsScreenContent({
  required BuildContext context,
  required SearchTagResultsState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
  required ValueNotifier<bool> showSortPanel,
  required OverlayPortalController sortOverlayController,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchTagResultsHeader(tag: state.tag),
          Expanded(
            child: SearchTagResultsLayout(
              state: state,
              tabsNode: tabsNode,
              gridNode: gridNode,
              onTabSelected: (tab) {
                context.read<SearchTagResultsBloc>().add(
                  SearchTagResultsEvent.tabSelected(tab),
                );
              },
              onSortPressed: () {
                showSortPanel.value = true;
                sortOverlayController.show();
              },
              onRetry: () {
                context.read<SearchTagResultsBloc>().add(
                  const SearchTagResultsEvent.retryRequested(),
                );
              },
              onLoadMore: () {
                context.read<SearchTagResultsBloc>().add(
                  const SearchTagResultsEvent.loadMoreRequested(),
                );
              },
              onLivePressed: (item) {
                unawaited(
                  openLivePlayerFromCard(
                    context,
                    searchTagLiveCardItem(item),
                  ),
                );
              },
              onVodPressed: (item) {
                unawaited(
                  openVodPlayerFromCard(
                    context,
                    searchTagVideoCardItem(item),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}
