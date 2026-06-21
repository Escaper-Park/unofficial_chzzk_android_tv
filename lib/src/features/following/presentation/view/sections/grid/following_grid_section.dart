import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../category/domain/entities/category_item.dart';
import '../../../../../category/presentation/view/shared/category_poster_card.dart';
import '../../../../../category/presentation/view/shared/category_poster_card_design.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../../live/presentation/view/shared/live_card_design.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../../vod/presentation/view/shared/vod_card_design.dart';
import '../../../../domain/entities/following_feed.dart';
import '../../../bloc/following_bloc.dart';
import '../../../following_screen_design.dart';
import '../../../following_screen_string.dart';
import '../../../following_screen_ui_mapper.dart';
import '../../shared/following_channel_focus_registry.dart';
import '../shared/following_channel_card.dart';
import 'following_tab_grid.dart';

part 'following_grid_channel_card_registration.dart';
part 'following_grid_section_state.dart';
part 'following_grid_tab_grids.dart';

class FollowingGridSection extends StatelessWidget {
  const FollowingGridSection({
    super.key,
    required this.state,
    required this.gridNode,
    required this.tabsNode,
    required this.focusRegistry,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
    required this.onChannelPressed,
    required this.onCategoryPressed,
  });

  final FollowingState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final FollowingChannelFocusRegistry focusRegistry;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;
  final void Function(FollowingChannel channel, int index) onChannelPressed;
  final ValueChanged<CategoryItem> onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    return switch (state.selectedTab) {
      FollowingTab.live => _LiveGrid(
        data: state.live,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onPressed: onLivePressed,
      ),
      FollowingTab.vod => _VodGrid(
        data: state.vod,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onPressed: onVodPressed,
      ),
      FollowingTab.channel => _ChannelGrid(
        data: state.channel,
        gridNode: gridNode,
        tabsNode: tabsNode,
        focusRegistry: focusRegistry,
        onRetry: onRetry,
        onPressed: onChannelPressed,
      ),
      FollowingTab.category => _CategoryGrid(
        data: state.category,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onPressed: onCategoryPressed,
      ),
    };
  }
}
