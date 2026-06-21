import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../../category/domain/entities/category_live.dart';
import '../../../../category/domain/entities/category_video.dart';
import '../../bloc/category_detail_bloc.dart';
import '../../category_detail_screen_design.dart';
import '../../category_detail_screen_string.dart';
import '../sections/grid/category_detail_grid_section.dart';
import '../sections/tabs/category_detail_follow_action.dart';

class CategoryDetailLayout extends StatelessWidget {
  const CategoryDetailLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.gridNode,
    required this.onTabSelected,
    required this.onFollowPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final CategoryDetailState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode gridNode;
  final ValueChanged<CategoryDetailTab> onTabSelected;
  final VoidCallback onFollowPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryLive> onLivePressed;
  final ValueChanged<CategoryVideo> onVodPressed;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<CategoryDetailTab>(
      tabsNode: tabsNode,
      contentNode: gridNode,
      tabs: [
        for (final tab in CategoryDetailTab.values)
          TvTabItem(
            value: tab,
            label: CategoryDetailScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerContentGap: CategoryDetailScreenDesign.tabHeaderContentGap,
      actions: [
        CategoryDetailFollowAction(
          state: state,
          onPressed: onFollowPressed,
        ),
      ],
      content: CategoryDetailGridSection(
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
