import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../controller/vod_controller.dart';
import '../../model/vod.dart';
import '../vod_container/vod_container.dart';
import '../vod_container/vod_info.dart';

class FollowingVodList extends ConsumerWidget {
  const FollowingVodList({
    super.key,
    required this.gridViewFSN,
    required this.sidebarFSN,
  });

  final FocusScopeNode gridViewFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingVods = ref.watch(followingVodControllerProvider);

    return VideoGridViewWithAsyncValue<Vod>(
      asyncValue: asyncFollowingVods,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      emptyText: '팔로잉 채널 또는 동영상이 없습니다',
      errorText: '동영상을 불러올 수 없습니다',
      fetchMore: () async {
        await ref.read(followingVodControllerProvider.notifier).fetchMore();
      },
      itemBuilder: (context, index, object) {
        return VodContainer(
          autofocus: index == 0 ? true : false,
          vod: object,
          infoWidget: (hasFocus) => VodInfoWithChannel(
            hasFocus: hasFocus,
            vod: object,
          ),
        );
      },
    );
  }
}
