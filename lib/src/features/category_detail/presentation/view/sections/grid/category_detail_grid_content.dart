part of 'category_detail_grid_section.dart';

class _LiveGrid extends StatelessWidget {
  const _LiveGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onPressed,
  });

  final CategoryDetailPageData<CategoryLive, CategoryLiveCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryLive> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: CategoryDetailTab.live,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: CategoryDetailFeedGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore:
            data.paginationStatus == CategoryDetailPaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];

          return LiveCard(
            item: categoryDetailLiveCardItem(item),
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

  final CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryVideo> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: CategoryDetailTab.vod,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: CategoryDetailFeedGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore:
            data.paginationStatus == CategoryDetailPaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];

          return VodCard(
            item: categoryDetailVideoCardItem(item),
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
