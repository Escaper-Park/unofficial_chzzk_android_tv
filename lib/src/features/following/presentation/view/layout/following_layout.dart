import 'package:flutter/material.dart';

import '../../../../../core/tv/focus/focus.dart';
import '../../../../../core/ui/ui.dart';
import '../../../../category/domain/entities/category_item.dart';
import '../../../../live/domain/entities/live_feed.dart';
import '../../../../vod/domain/entities/vod_feed.dart';
import '../../../domain/entities/following_feed.dart';
import '../../bloc/following_bloc.dart';
import '../../following_screen_design.dart';
import '../../following_screen_string.dart';
import '../sections/grid/following_grid_section.dart';
import '../sections/signed_out/following_signed_out_section.dart';
import '../sections/tabs/following_tabs_section.dart';
import '../shared/following_channel_focus_registry.dart';

class FollowingLayout extends StatelessWidget {
  const FollowingLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.gridNode,
    required this.focusRegistry,
    required this.onAuthPressed,
    required this.onTabSelected,
    required this.onSortPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
    required this.onChannelPressed,
    required this.onCategoryPressed,
  });

  final FollowingState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode gridNode;
  final FollowingChannelFocusRegistry focusRegistry;
  final VoidCallback onAuthPressed;
  final ValueChanged<FollowingTab> onTabSelected;
  final VoidCallback onSortPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;
  final void Function(FollowingChannel channel, int index) onChannelPressed;
  final ValueChanged<CategoryItem> onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    if (!state.isSignedIn) {
      return TvFocusSection.list(
        node: tabsNode,
        child: FollowingSignedOutSection(onAuthPressed: onAuthPressed),
      );
    }

    return TvTabbedContentLayout<FollowingTab>(
      tabsNode: tabsNode,
      contentNode: gridNode,
      tabs: [
        for (final tab in FollowingTab.values)
          TvTabItem(
            value: tab,
            label: FollowingScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: FollowingScreenDesign.headerRowPadding,
      headerContentGap: FollowingScreenDesign.headerContentGap,
      actions: [
        if (state.selectedTab == FollowingTab.live)
          FollowingSortAction(
            option: state.liveSortOption,
            onPressed: onSortPressed,
          ),
      ],
      content: FollowingGridSection(
        state: state,
        gridNode: gridNode,
        tabsNode: tabsNode,
        focusRegistry: focusRegistry,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onLivePressed: onLivePressed,
        onVodPressed: onVodPressed,
        onChannelPressed: onChannelPressed,
        onCategoryPressed: onCategoryPressed,
      ),
    );
  }
}
