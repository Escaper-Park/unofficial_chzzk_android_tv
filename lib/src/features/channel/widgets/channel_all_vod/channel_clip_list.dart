import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../clip/controller/clip_controller.dart';
import '../../../clip/model/clip.dart';
import '../../../clip/widgets/clip_container.dart';
import '../../../vod/repository/vod_repository.dart';

class ChannelClipList extends ConsumerWidget {
  const ChannelClipList({
    super.key,
    required this.channelId,
    required this.sortType,
    required this.gridViewFSN,
    required this.sidebarFSN,
  });

  final String channelId;
  final VodSortType sortType;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode sidebarFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChannelClips = ref.watch(channelClipControllerProvider(
      channelId: channelId,
      sortType: sortType.value,
    ));

    return Stack(
      children: [
        VideoGridViewWithAsyncValue<NaverClip>(
          asyncValue: asyncChannelClips,
          sidebarFSN: sidebarFSN,
          gridViewFSN: gridViewFSN,
          emptyText: '카테고리에 클립이 없습니다',
          errorText: '카테고리 클립을 불러올 수 없습니다',
          fetchMore: () async {
            await ref
                .read(channelClipControllerProvider(
                        channelId: channelId, sortType: sortType.value)
                    .notifier)
                .fetchMore();
          },
          itemBuilder: (context, index, object) {
            return ClipContainer(
              autofocus: index == 0 ? true : false,
              clip: object,
            );
          },
        ),
      ],
    );
  }
}
