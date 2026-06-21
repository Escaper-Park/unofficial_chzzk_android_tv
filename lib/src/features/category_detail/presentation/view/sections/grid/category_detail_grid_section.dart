import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../category/domain/entities/category_live.dart';
import '../../../../../category/domain/entities/category_video.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../../live/presentation/view/shared/live_card_design.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../../vod/presentation/view/shared/vod_card_design.dart';
import '../../../bloc/category_detail_bloc.dart';
import '../../../category_detail_screen_string.dart';
import '../../../category_detail_screen_ui_mapper.dart';
import 'category_detail_card_mapper.dart';
import 'category_detail_feed_grid.dart';

part 'category_detail_grid_content.dart';
part 'category_detail_grid_state_views.dart';

class CategoryDetailGridSection extends StatelessWidget {
  const CategoryDetailGridSection({
    super.key,
    required this.state,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final CategoryDetailState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryLive> onLivePressed;
  final ValueChanged<CategoryVideo> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return switch (state.selectedTab) {
      CategoryDetailTab.live => _LiveGrid(
        data: state.live,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onPressed: onLivePressed,
      ),
      CategoryDetailTab.vod => _VodGrid(
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
