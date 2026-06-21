import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../../../vod/presentation/view/shared/vod_card_design.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_string.dart';
import '../../../channel_screen_ui_mapper.dart';
import 'channel_vod_tab_grid.dart';

class ChannelVodGridSection extends StatelessWidget {
  const ChannelVodGridSection({
    super.key,
    required this.state,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onPressed,
  });

  final ChannelState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<Vod> onPressed;

  @override
  Widget build(BuildContext context) {
    final data = state.vod;

    return switch (data.status) {
      ChannelLoadStatus.initial || ChannelLoadStatus.loading =>
        ContentStateView.loading(message: channelVodStateMessage(data.status)),
      ChannelLoadStatus.failure => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.error(
          message: channelVodStateMessage(data.status),
          action: TvButton.label(
            text: ChannelScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      ChannelLoadStatus.ready when data.items.isEmpty => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.empty(
          message: channelVodStateMessage(data.status),
          action: TvButton.label(
            text: ChannelScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      ChannelLoadStatus.ready => ChannelVodTabGrid(
        gridNode: gridNode,
        tabsNode: tabsNode,
        itemCount: data.items.length,
        hasMore: data.canLoadMore,
        isLoadingMore: data.paginationStatus == ChannelPaginationStatus.loading,
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
    };
  }
}

class _FocusableStateView extends StatelessWidget {
  const _FocusableStateView({
    required this.gridNode,
    required this.tabsNode,
    required this.child,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: gridNode,
      up: tabsNode,
      child: child,
    );
  }
}
