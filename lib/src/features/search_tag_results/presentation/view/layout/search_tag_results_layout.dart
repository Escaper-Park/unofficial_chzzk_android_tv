import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/search_tag_feed.dart';
import '../../bloc/search_tag_results_bloc.dart';
import '../../search_tag_results_screen_design.dart';
import '../../search_tag_results_screen_string.dart';
import '../sections/grid/search_tag_results_grid_section.dart';
import '../sections/tabs/search_tag_results_tabs_section.dart';

class SearchTagResultsLayout extends StatelessWidget {
  const SearchTagResultsLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.gridNode,
    required this.onTabSelected,
    required this.onSortPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final SearchTagResultsState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode gridNode;
  final ValueChanged<SearchTagResultsTab> onTabSelected;
  final VoidCallback onSortPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<SearchTagLive> onLivePressed;
  final ValueChanged<SearchTagVideo> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<SearchTagResultsTab>(
      tabsNode: tabsNode,
      contentNode: gridNode,
      tabs: [
        for (final tab in SearchTagResultsTab.values)
          TvTabItem(
            value: tab,
            label: SearchTagResultsScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: SearchTagResultsScreenDesign.headerRowPadding,
      headerContentGap: SearchTagResultsScreenDesign.headerContentGap,
      actions: [
        SearchTagResultsSortAction(
          key: ValueKey(state.selectedTab),
          state: state,
          onPressed: onSortPressed,
        ),
      ],
      content: SearchTagResultsGridSection(
        state: state,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onLivePressed: onLivePressed,
        onVodPressed: onVodPressed,
      ),
    );
  }
}
