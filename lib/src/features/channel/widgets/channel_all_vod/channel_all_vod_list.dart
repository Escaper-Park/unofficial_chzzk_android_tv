import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/video_grid_view_screen.dart';
import '../../../vod/model/vod.dart';
import '../../../vod/repository/vod_repository.dart';
import '../../../vod/widgets/vod_container/vod_container.dart';
import '../../../vod/widgets/vod_container/vod_info.dart';
import '../../controller/channel_controller.dart';

class ChannelAllVodList extends ConsumerWidget {
  const ChannelAllVodList({
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
    final asyncChannelVods = ref.watch(
      channelVodControllerProvider(channelId: channelId, sortType: sortType),
    );

    return VideoGridViewWithAsyncValue<Vod>(
      asyncValue: asyncChannelVods,
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      emptyText: '채널에 동영상이 없습니다',
      errorText: '동영상을 불러올 수 없습니다',
      fetchMore: () async {
        await ref
            .read(channelVodControllerProvider(
              channelId: channelId,
              sortType: sortType,
            ).notifier)
            .fetchMore();
      },
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
