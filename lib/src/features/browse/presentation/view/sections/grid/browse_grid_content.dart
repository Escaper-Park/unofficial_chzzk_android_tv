part of 'browse_grid_section.dart';

class _LiveGrid extends StatelessWidget {
  const _LiveGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onPressed,
  });

  final BrowsePageData<Live, LiveCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: BrowseTab.live,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: BrowseTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore: data.paginationStatus == BrowsePaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return LiveCard(
            item: item,
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

  final BrowsePageData<Vod, BrowseVodCursor> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Vod> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: BrowseTab.vod,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: BrowseTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore: data.paginationStatus == BrowsePaginationStatus.loading,
        onFocusedTail: onLoadMore,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return VodCard(
            item: item,
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
