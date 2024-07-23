import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../../common/widgets/dpad_widgets.dart';
import '../../../vod/model/vod.dart';
import '../../../vod/repository/vod_repository.dart';
import '../../controller/channel_controller.dart';
import '../../model/channel.dart';
import 'channel_vod_container.dart';

class ChannelVodList extends ConsumerWidget {
  /// Channel data screen's vod list.
  ///
  /// Default VodSortType is 'LATEST'
  const ChannelVodList({
    super.key,
    required this.channel,
    required this.vodListFSN,
    required this.channelListFSN,
    required this.showMoreFSN,
  });

  final Channel channel;
  final FocusScopeNode vodListFSN;
  final FocusScopeNode channelListFSN;
  final FocusScopeNode showMoreFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncChannelVods = ref.watch(
      channelVodControllerProvider(
          channelId: channel.channelId, sortType: VodSortType.latest),
    );

    return DpadHorizontalListViewContainer<Vod>(
      asyncValue: asyncChannelVods,
      emptyText: '채널에 동영상이 없습니다',
      errorText: '채널 동영상을 불러올 수 없습니다',
      listFSN: vodListFSN,
      aboveFSN: showMoreFSN,
      sidebarFSN: channelListFSN,
      itemBuilder: (index, focusNode, object) {
        return ChannelVodContainer(
          autofocus: channel.openLive == true
              ? false
              : index == 0
                  ? true
                  : false,
          focusNode: focusNode,
          vod: object,
        );
      },
    );
  }
}
