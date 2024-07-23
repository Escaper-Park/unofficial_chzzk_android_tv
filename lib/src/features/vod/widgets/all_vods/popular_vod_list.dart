import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../controller/vod_controller.dart';
import '../../model/vod.dart';
import '../vod_container/vod_container.dart';
import '../vod_container/vod_info.dart';

class PopularVodList extends ConsumerWidget {
  const PopularVodList({
    super.key,
    required this.gridViewFSN,
    required this.sidebarFSN,
  });

  final FocusScopeNode gridViewFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncPopularVods = ref.watch(popularVodControllerProvider);

    return VideoGridViewWithAsyncValue<Vod>(
      asyncValue: asyncPopularVods,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      emptyText: '인기 동영상을 불러올 수 없습니다',
      errorText: '인기 동영상을 불러올 수 없습니다',
      itemBuilder: (context, index, object) {
        return VodContainer(
          autofocus: index == 0 ? true : false,
          vod: object,
          infoWidget: VodInfoWithChannel(vod: object),
        );
      },
    );
  }
}
