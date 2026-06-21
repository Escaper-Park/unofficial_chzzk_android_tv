import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../../live/domain/entities/live_feed.dart';
import '../../../../vod/domain/entities/vod_feed.dart';
import '../../bloc/browse_bloc.dart';
import '../../browse_screen_design.dart';
import '../../browse_screen_string.dart';
import '../sections/grid/browse_grid_section.dart';
import '../sections/tabs/browse_tabs_section.dart';

class BrowseLayout extends StatelessWidget {
  const BrowseLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.gridNode,
    required this.onAuthPressed,
    required this.onTabSelected,
    required this.onSortPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final BrowseState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode gridNode;
  final VoidCallback onAuthPressed;
  final ValueChanged<BrowseTab> onTabSelected;
  final VoidCallback onSortPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<BrowseTab>(
      tabsNode: tabsNode,
      contentNode: gridNode,
      tabs: [
        for (final tab in BrowseTab.values)
          TvTabItem(
            value: tab,
            label: BrowseScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: BrowseScreenDesign.headerRowPadding,
      headerContentGap: BrowseScreenDesign.headerContentGap,
      actions: [
        BrowseSortAction(
          state: state,
          onPressed: onSortPressed,
        ),
      ],
      content: BrowseGridSection(
        state: state,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onAuthPressed: onAuthPressed,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onLivePressed: onLivePressed,
        onVodPressed: onVodPressed,
      ),
    );
  }
}
