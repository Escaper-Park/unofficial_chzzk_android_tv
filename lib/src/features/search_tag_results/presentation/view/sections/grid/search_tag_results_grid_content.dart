part of 'search_tag_results_grid_section.dart';

class _LiveGrid extends StatelessWidget {
  const _LiveGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onPressed,
  });

  final SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<SearchTagLive> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: SearchTagResultsTab.live,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: SearchTagResultsTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore:
            data.paginationStatus == SearchTagResultsPaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return LiveCard(
            item: searchTagLiveCardItem(item),
            autofocus: index == 0,
            focusedScale: LiveCardDesign.gridFocusedScale,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}

class _VodGrid extends StatelessWidget {
  const _VodGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onPressed,
  });

  final SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<SearchTagVideo> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: SearchTagResultsTab.vod,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: SearchTagResultsTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore:
            data.paginationStatus == SearchTagResultsPaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return VodCard(
            item: searchTagVideoCardItem(item),
            watchProgressSeconds: item.watchTimeline,
            autofocus: index == 0,
            focusedScale: VodCardDesign.gridFocusedScale,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}
