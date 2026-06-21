import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../../live/presentation/view/shared/live_card_design.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../../vod/presentation/view/shared/vod_card_design.dart';
import '../../../../domain/entities/search_tag_feed.dart';
import '../../../bloc/search_tag_results_bloc.dart';
import '../../../search_tag_results_screen_string.dart';
import '../../../search_tag_results_screen_ui_mapper.dart';
import 'search_tag_results_card_mapper.dart';
import 'search_tag_results_tab_grid.dart';

part 'search_tag_results_grid_content.dart';
part 'search_tag_results_grid_state_views.dart';

class SearchTagResultsGridSection extends StatelessWidget {
  const SearchTagResultsGridSection({
    super.key,
    required this.state,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final SearchTagResultsState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<SearchTagLive> onLivePressed;
  final ValueChanged<SearchTagVideo> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return switch (state.selectedTab) {
      SearchTagResultsTab.live => _LiveGrid(
        data: state.live,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onPressed: onLivePressed,
      ),
      SearchTagResultsTab.vod => _VodGrid(
        data: state.vod,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onPressed: onVodPressed,
      ),
    };
  }
}
