import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../common/widgets/screen/screen_widgets.dart'
    show VideoGridSection, VideoGridViewScreen;
import '../../common/widgets/ui/ui_widgets.dart' show HeaderText;

import '../live/model/live_info.dart';
import '../live/widgets/live_widgets.dart';

import 'live_all_event.dart';
import 'live_all_state.dart';

class LiveAllScreen extends ConsumerWidget with LiveAllEvent, LiveAllState {
  const LiveAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridViewSidebarData = [
      ('인기순', VideoSortType.popular),
      ('최신순', VideoSortType.latest),
    ];

    final baseSection = VideoGridSection(
      getAsyncValue: (sortType) => getAsyncLivesSortBy(ref, sortType: sortType),
      fetchMore: (sortType) async => await fetchMore(ref, sortType: sortType),
      emptyText: '라이브를 불러올 수 없습니다',
      errorText: '라이브를 불러올 수 없습니다',
      itemBuilder: (context, index, node, object) {
        return LiveContainer(
          appRoute: AppRoute.liveAll,
          autofocus: index == 0,
          focusNode: node,
          channel: object.channel!,
          liveInfo: object,
        );
      },
    );

    return VideoGridViewScreen<LiveInfo>(
      baseRoute: AppRoute.liveAll,
      gridViewSidebarData: gridViewSidebarData,
      sectionBuilder: (sortType) => baseSection,
      headerWidget: HeaderText(text: '전체 라이브', horizontalPadding: 16.0),
      popAction: () => goHome(ref, context),
    );
  }
}
