import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../controller/live_controller.dart';
import '../../model/live.dart';
import '../../repository/live_repository.dart';
import '../live_container/live_container.dart';

class AllLivesList extends ConsumerWidget {
  const AllLivesList({
    super.key,
    required this.sortType,
    required this.gridViewFSN,
    required this.sidebarFSN,
  });

  final LiveSortType sortType;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncAllLives =
        ref.watch(allLivesControllerProvider(sortType: sortType));

    return VideoGridViewWithAsyncValue<LiveInfo>(
      asyncValue: asyncAllLives,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      emptyText: '라이브를 불러올 수 없습니다',
      errorText: '라이브를 불러올 수 없습니다',
      fetchMore: () async {
        ref
            .read(allLivesControllerProvider(sortType: sortType).notifier)
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
