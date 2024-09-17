import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../live/model/live.dart';
import '../../../live/repository/live_repository.dart';
import '../../../live/widgets/live_container/live_container.dart';
import '../../controller/search_controller.dart';

class SearchTagLiveList extends ConsumerWidget {
  const SearchTagLiveList({
    super.key,
    required this.tag,
    required this.sortType,
    required this.gridViewFSN,
    required this.sidebarFSN,
  });

  final String tag;
  final LiveSortType sortType;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncSearchTagResults = ref.watch(
      searchTagControllerProvider(
        tag: tag,
        sortType: sortType,
      ),
    );

    return VideoGridViewWithAsyncValue<LiveInfo>(
      asyncValue: asyncSearchTagResults,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      emptyText: '검색 결과가 없습니다',
      errorText: '검색 결과가 없습니다',
      fetchMore: () async {
        ref
            .read(searchTagControllerProvider(tag: tag, sortType: sortType)
                .notifier)
            .fetchMore();
      },
      itemBuilder: (context, index, object) {
        return LiveContainer(
          autofocus: index == 0 ? true : false,
          liveInfo: object,
          channel: object.channel!,
        );
      },
    );
  }
}
