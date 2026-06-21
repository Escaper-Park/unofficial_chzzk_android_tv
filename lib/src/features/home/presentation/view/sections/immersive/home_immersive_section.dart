import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card_formatters.dart';
import '../../../bloc/home_bloc.dart';
import '../../../home_screen_design.dart';
import '../../../home_screen_string.dart';
import '../shared/home_section_state_view.dart';
import 'home_immersive_list_exports.dart';
import 'home_immersive_thumbnail.dart';

class HomeImmersiveSection extends StatelessWidget {
  const HomeImmersiveSection({
    super.key,
    required this.node,
    required this.data,
    required this.activeIndex,
    required this.onActiveIndexChanged,
    required this.onRetry,
    required this.onItemPressed,
    this.actionFocusNode,
    this.actionProgress,
    this.up,
    this.down,
    this.autofocus = false,
  });

  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final HomeSectionData<Live> data;
  final int activeIndex;
  final ValueChanged<int> onActiveIndexChanged;
  final VoidCallback onRetry;
  final ValueChanged<Live> onItemPressed;
  final FocusNode? actionFocusNode;
  final double? actionProgress;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final items = data.items;

    if (data.status != HomeSectionLoadStatus.ready || items.isEmpty) {
      return HomeSectionStateView(
        sectionId: HomeSectionId.immersive,
        status: data.status,
        node: node,
        up: up,
        down: down,
        height: HomeScreenDesign.immersiveHeight,
        showTitle: false,
        autofocus: autofocus,
        onRetry: onRetry,
      );
    }

    final effectiveIndex = activeIndex >= items.length
        ? items.length - 1
        : activeIndex;

    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      upFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
      downFocusAlignment: HomeScreenDesign.verticalScrollAlignment,
      upEnsureVisibleScope: up != null,
      downEnsureVisibleScope: down != null,
      child: HomeImmersiveList(
        items: [
          for (final item in items) _immersiveItem(item),
        ],
        activeIndex: effectiveIndex,
        actionAutofocus: autofocus,
        actionFocusNode: actionFocusNode,
        actionProgress: actionProgress,
        showBackground: false,
        onActiveIndexChanged: onActiveIndexChanged,
        onActionPressed: () {
          onItemPressed(items[effectiveIndex]);
        },
      ),
    );
  }

  HomeImmersiveItem _immersiveItem(Live item) {
    final viewerCount = formatLiveCardGrouped(item.concurrentUserCount);
    final categoryValue = item.categoryValue;

    return HomeImmersiveItem(
      thumbnail: HomeImmersiveThumbnail(item: item),
      title: item.channel?.channelName ?? HomeScreenString.immersiveTitle,
      subtitle: item.title,
      actionLabel: HomeScreenString.openLive,
      channelVerified: item.channel?.verifiedMark ?? false,
      badges: [
        HomeScreenString.liveBadge,
        HomeScreenString.watchingCount(viewerCount),
      ],
      contentTags: [
        ?_nonEmptyText(categoryValue),
        ...item.tags.take(3),
      ],
    );
  }
}

String? _nonEmptyText(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}
