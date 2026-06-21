part of 'following_grid_section.dart';

class _LiveGrid extends StatelessWidget {
  const _LiveGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onPressed,
  });

  final FollowingSectionData<Live> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final ValueChanged<Live> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: FollowingTab.live,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: FollowingTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        variant: TvGridVariant.feedCard,
        itemCount: data.items.length,
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

  final FollowingVodSectionData data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Vod> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: FollowingTab.vod,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: FollowingTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        variant: TvGridVariant.feedCard,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore:
            data.paginationStatus == FollowingPaginationStatus.loading,
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

class _ChannelGrid extends StatelessWidget {
  const _ChannelGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.focusRegistry,
    required this.onRetry,
    required this.onPressed,
  });

  final FollowingSectionData<FollowingChannel> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final FollowingChannelFocusRegistry focusRegistry;
  final VoidCallback onRetry;
  final void Function(FollowingChannel channel, int index) onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: FollowingTab.channel,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: FollowingTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        variant: TvGridVariant.category,
        itemCount: data.items.length,
        mainAxisExtent: FollowingScreenDesign.channelCardHeight,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return _RegisteredFollowingChannelCard(
            key: ValueKey('following-channel-focus-${item.channelId}'),
            item: item,
            focusRegistry: focusRegistry,
            autofocus: index == 0,
            onPressed: () => onPressed(item, index),
          );
        },
      ),
    );
  }
}

class _CategoryGrid extends StatelessWidget {
  const _CategoryGrid({
    required this.data,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onPressed,
  });

  final FollowingSectionData<CategoryItem> data;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final ValueChanged<CategoryItem> onPressed;

  @override
  Widget build(BuildContext context) {
    return _SectionStateBuilder(
      tab: FollowingTab.category,
      status: data.status,
      isEmpty: data.items.isEmpty,
      gridNode: gridNode,
      tabsNode: tabsNode,
      onRetry: onRetry,
      child: FollowingTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        variant: TvGridVariant.category,
        itemCount: data.items.length,
        mainAxisExtent: FollowingScreenDesign.categoryCardHeight,
        itemBuilder: (context, index) {
          final item = data.items[index];
          return CategoryPosterCard(
            item: item,
            autofocus: index == 0,
            focusedScale: FollowingScreenDesign.itemFocusedScale,
            badgeTextStyle: CategoryPosterCardDesign.compactBadgeTextStyle,
            onPressed: () => onPressed(item),
          );
        },
      ),
    );
  }
}
