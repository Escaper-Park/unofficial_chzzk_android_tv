import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../../live/domain/entities/live_feed.dart';
import '../../../../vod/domain/entities/vod_feed.dart';
import '../../bloc/channel_bloc.dart';
import '../../channel_screen_design.dart';
import '../../channel_screen_string.dart';
import '../sections/home/channel_home_section.dart';
import '../sections/tabs/channel_tab_actions.dart';
import '../sections/vod/channel_vod_grid_section.dart';

class ChannelLayout extends StatelessWidget {
  const ChannelLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.homeStateNode,
    required this.homeLiveNode,
    required this.homeVodNode,
    required this.homePreferredContentNode,
    required this.vodGridNode,
    required this.onTabSelected,
    required this.onSortPressed,
    required this.onFollowPressed,
    required this.onGroupPressed,
    required this.onRetry,
    required this.onLoadMore,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final ChannelState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode homeStateNode;
  final FocusScopeNode homeLiveNode;
  final FocusScopeNode homeVodNode;
  final FocusScopeNode? homePreferredContentNode;
  final FocusScopeNode vodGridNode;
  final ValueChanged<ChannelTab> onTabSelected;
  final VoidCallback onSortPressed;
  final VoidCallback onFollowPressed;
  final VoidCallback onGroupPressed;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;

  @override
  Widget build(BuildContext context) {
    final contentNode = _contentNodeForState();

    return TvTabbedContentLayout<ChannelTab>(
      tabsNode: tabsNode,
      contentNode: contentNode,
      tabs: [
        for (final tab in ChannelTab.values)
          TvTabItem(
            value: tab,
            label: ChannelScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: ChannelScreenDesign.tabRowPadding,
      headerContentGap: ChannelScreenDesign.headerContentGapForTabs,
      contentFocusAlignment: _contentFocusAlignmentForNode(contentNode),
      contentEnsureVisible: _contentEnsureVisibleForNode(contentNode),
      contentEnsureVisibleScope: _contentEnsureVisibleScopeForNode(contentNode),
      actions: _actionsForSelectedTab(),
      content: switch (state.selectedTab) {
        ChannelTab.home => ChannelHomeSection(
          state: state,
          stateNode: homeStateNode,
          liveNode: homeLiveNode,
          latestVodNode: homeVodNode,
          tabsNode: tabsNode,
          onRetry: onRetry,
          onLivePressed: onLivePressed,
          onVodPressed: onVodPressed,
        ),
        ChannelTab.vod => ChannelVodGridSection(
          state: state,
          gridNode: vodGridNode,
          tabsNode: tabsNode,
          onRetry: onRetry,
          onLoadMore: onLoadMore,
          onPressed: onVodPressed,
        ),
      },
    );
  }

  FocusScopeNode _contentNodeForState() {
    return switch (state.selectedTab) {
      ChannelTab.vod => vodGridNode,
      ChannelTab.home when state.homeStatus != ChannelLoadStatus.ready =>
        homeStateNode,
      ChannelTab.home => _homeContentNodeForReadyState(),
    };
  }

  FocusScopeNode _homeContentNodeForReadyState() {
    final preferred = homePreferredContentNode;
    if (preferred == homeLiveNode && state.live != null) {
      return homeLiveNode;
    }

    if (preferred == homeVodNode && state.latestVods.isNotEmpty) {
      return homeVodNode;
    }

    if (state.live != null) {
      return homeLiveNode;
    }

    if (state.latestVods.isNotEmpty) {
      return homeVodNode;
    }

    return homeStateNode;
  }

  double? _contentFocusAlignmentForNode(FocusScopeNode contentNode) {
    if (contentNode == homeLiveNode ||
        (contentNode == homeVodNode && state.live != null)) {
      return ChannelScreenDesign.liveFocusAlignment;
    }

    return null;
  }

  bool _contentEnsureVisibleScopeForNode(FocusScopeNode contentNode) {
    return contentNode == homeLiveNode ||
        (contentNode == homeVodNode && state.live != null);
  }

  bool _contentEnsureVisibleForNode(FocusScopeNode contentNode) {
    return contentNode != homeVodNode || state.live != null;
  }

  List<Widget> _actionsForSelectedTab() {
    return switch (state.selectedTab) {
      ChannelTab.home => [
        ChannelFollowAction(
          state: state,
          onPressed: onFollowPressed,
        ),
        ChannelGroupAction(onPressed: onGroupPressed),
      ],
      ChannelTab.vod => [
        ChannelSortAction(
          state: state,
          onPressed: onSortPressed,
        ),
      ],
    };
  }
}
