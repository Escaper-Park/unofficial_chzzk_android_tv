import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card.dart';
import '../../../../../live/presentation/view/shared/live_card_design.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../../vod/presentation/view/shared/vod_card_design.dart';
import '../../../bloc/browse_bloc.dart';
import '../../../browse_screen_design.dart';
import '../../../browse_screen_string.dart';
import '../../../browse_screen_ui_mapper.dart';
import 'browse_tab_grid.dart';

part 'browse_grid_content.dart';
part 'browse_grid_state_views.dart';

class BrowseGridSection extends StatelessWidget {
  const BrowseGridSection({
    super.key,
    required this.state,
    required this.gridNode,
    required this.tabsNode,
    required this.onAuthPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final BrowseState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onAuthPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;

  @override
  Widget build(BuildContext context) {
    if (state.selectedContentRequiresAuth) {
      return _AuthGuidance(
        gridNode: gridNode,
        tabsNode: tabsNode,
        onAuthPressed: onAuthPressed,
      );
    }

    return switch (state.selectedTab) {
      BrowseTab.live => _LiveGrid(
        data: state.live,
        gridNode: gridNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
        onLoadMore: onLoadMore,
        onPressed: onLivePressed,
      ),
      BrowseTab.vod => _VodGrid(
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
