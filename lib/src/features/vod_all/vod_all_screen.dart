import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../common/widgets/screen/screen_widgets.dart'
    show VideoGridSection, VideoGridViewScreen;
import '../../common/widgets/ui/ui_widgets.dart' show HeaderText;

import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart';

import '../watching_history/controller/watching_history_controller.dart';
import '../watching_history/model/watching_history.dart';
import 'controller/following_vod_controller.dart';
import 'vod_all_event.dart';
import 'vod_all_state.dart';
import 'controller/vod_all_controller.dart';

class VodAllScreen extends ConsumerWidget with VodAllEvent, VodAllState {
  const VodAllScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridViewSidebarData = [
      ('팔로잉', VideoSortType.following),
      ('인기순', VideoSortType.popular),
      ('최신순', VideoSortType.latest),
      ('시청기록', VideoSortType.watchingHistory),
    ];

    final baseSection = VideoGridSection<dynamic>(
      getAsyncValue: (_) => getAsyncFollowingVods(ref),
      fetchMore: (_) async => await followingVodFetchMore(ref),
      emptyText: '동영상이 없습니다',
      errorText: '동영상을 불러올 수 없습니다',
      itemBuilder: (context, index, node, item) {
        return VodContainer(
          appRoute: AppRoute.vodAll,
          autofocus: index == 0,
          focusNode: node,
          vod: item as Vod,
          onVideoPop: () => ref.invalidate(followingVodControllerProvider),
        );
      },
    );

    return VideoGridViewScreen<dynamic>(
      baseRoute: AppRoute.vodAll,
      gridViewSidebarData: gridViewSidebarData,
      sectionBuilder: (sortType) {
        return switch (sortType) {
          VideoSortType.following => baseSection,
          VideoSortType.popular => baseSection.copyWith(
            getAsyncValue: (sortType) =>
                getAsyncVodsSortBy(ref, sortType: sortType),
            fetchMore: (sortType) async =>
            await vodAllFetchMore(ref, sortType: sortType),
            itemBuilder: (context, index, node, item) {
              return VodContainer(
                appRoute: AppRoute.vodAll,
                autofocus: index == 0,
                focusNode: node,
                vod: item as Vod,
                onVideoPop: () => ref.invalidate(
                  vodAllControllerProvider(sortType: sortType),
                ),
              );
            },
          ),
          VideoSortType.latest => baseSection.copyWith(
            getAsyncValue: (sortType) =>
                getAsyncVodsSortBy(ref, sortType: sortType),
            fetchMore: (sortType) async =>
            await vodAllFetchMore(ref, sortType: sortType),
            itemBuilder: (context, index, node, item) {
              return VodContainer(
                appRoute: AppRoute.vodAll,
                autofocus: index == 0,
                focusNode: node,
                vod: item as Vod,
                onVideoPop: () => ref.invalidate(
                  vodAllControllerProvider(sortType: sortType),
                ),
              );
            },
          ),
          VideoSortType.watchingHistory => baseSection.copyWith(
            getAsyncValue: (sortType) => getAsyncWatchingHistories(ref),
            fetchMore: (sortType) async =>
            await watchingHistoryFetchMore(ref),
            itemBuilder: (context, index, node, item) {
              final WatchingHistory history = item as WatchingHistory;

              return VodContainer(
                appRoute: AppRoute.vodAll,
                autofocus: index == 0,
                focusNode: node,
                vod: history.videoResponse,
                onVideoPop: () => ref.invalidate(watchingHistoryControllerProvider),
              );
            },
          ),
          _ => throw UnimplementedError(),
        };
      },
      headerWidget: HeaderText(text: '전체 동영상', horizontalPadding: 16.0),
      popAction: () => goHome(ref, context),
    );
  }
}