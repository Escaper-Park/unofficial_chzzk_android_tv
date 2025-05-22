import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart'
    show AppRoute, FilterType, VideoSortType;
import '../../common/widgets/screen/screen_widgets.dart';

import '../../common/widgets/screen/video_grid_view/video_grid_view_filter.dart'
    show VideoGridViewFilter;
import '../../common/widgets/ui/header_text.dart' show HeaderText;
import '../live/model/live_info.dart';
import '../live/widgets/live_container.dart' show LiveContainer;
import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart';
import 'search_tag_result_event.dart';
import 'search_tag_result_state.dart';

class SearchTagResultScreen extends HookConsumerWidget
    with SearchTagResultEvent, SearchTagResultState {
  const SearchTagResultScreen({super.key, required this.tag});

  final String tag;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();
    final filterFSN = useFocusScopeNode();

    final gridViewSidebarData = [
      ('라이브', VideoSortType.live),
      ('동영상', VideoSortType.vod),
    ];

    // [Sidebar] VideoSortType(live, vod) [Top Order] FilterType(order);
    final sortState = useState<(int, int)>((0, 0));
    final sortIndex = sortState.value.$2;

    final List<FilterType> orderList = [
      FilterType.popular,
      FilterType.latest,
    ];

    final currentOrderType = orderList[sortIndex];

    final baseLiveSection = VideoGridSection<Object>(
      getAsyncValue: (_) =>
          getAsyncTagLives(ref, tag: tag, sortType: currentOrderType),
      fetchMore: (_) async => await liveFetchMore(
        ref,
        tag: tag,
        sortType: currentOrderType,
      ),
      emptyText: "'$tag' 태그를 가진 라이브가 없습니다",
      errorText: "'$tag' 태그 라이브를 불러올 수 없습니다",
      itemBuilder: (context, index, node, item) {
        final liveInfo = item as LiveInfo;

        return LiveContainer(
          appRoute: AppRoute.searchTagResult,
          autofocus: index == 0,
          focusNode: node,
          channel: liveInfo.channel!,
          liveInfo: liveInfo,
        );
      },
    );

    final baseVodSection = VideoGridSection<Object>(
      getAsyncValue: (sortType) =>
          getAsyncTagVods(ref, tag: tag, sortType: currentOrderType),
      fetchMore: (_) async =>
          await vodFetchMore(ref, tag: tag, sortType: currentOrderType),
      emptyText: "'$tag' 태그를 가진 동영상이 없습니다",
      errorText: "'$tag' 태그 동영상을을 불러올 수 없습니다",
      itemBuilder: (context, index, node, item) {
        final vod = item as Vod;

        return VodContainer(
          appRoute: AppRoute.searchTagResult,
          autofocus: index == 0,
          focusNode: node,
          vod: vod,
        );
      },
    );

    return VideoGridViewScreen<Object>(
      baseRoute: AppRoute.searchTagResult,
      gridViewSidebarData: gridViewSidebarData,
      headerFSN: filterFSN,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      currentSortState: sortState,
      sectionBuilder: (sortType) => switch (sortType) {
        VideoSortType.live => baseLiveSection,
        VideoSortType.vod => baseVodSection,
        _ => throw UnimplementedError(),
      },
      headerWidget: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(
            text: "'$tag' 태그 검색 결과",
            horizontalPadding: 10.0,
            verticalPadding: 10.0,
          ),
          Divider(),
          VideoGridViewFilter(
            filterList: orderList,
            currentIndex: sortIndex,
            sidebarFSN: sidebarFSN,
            belowFSN: gridViewFSN,
            filterFSN: filterFSN,
            onPressed: (index) => sortState.value = (sortState.value.$1, index),
          ),
        ],
      ),
      popAction: () => pop(context),
    );
  }
}
