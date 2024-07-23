import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/video_grid_view_screen.dart';
import '../vod/repository/vod_repository.dart';
import './controller/channel_controller.dart';
import './model/channel.dart';
import './widgets/channel_all_vod/channel_all_vod_list.dart';

class ChannelVodsScreen extends HookWidget {
  const ChannelVodsScreen({super.key, required this.channel});

  final Channel channel;

  @override
  Widget build(BuildContext context) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();

    final vodSortType = useState<VodSortType>(VodSortType.latest);

    final List<VideoScreenSidebarItem> sidebarItems = [
      (
        '최신순',
        () {
          if (vodSortType.value != VodSortType.latest) {
            vodSortType.value = VodSortType.latest;
          }
        }
      ),
      (
        '인기순',
        () {
          if (vodSortType.value != VodSortType.popular) {
            vodSortType.value = VodSortType.popular;
          }
        }
      ),
    ];

    return VideoGridViewScreen(
      onPopInvoked: (_) {
        if (sidebarFSN.hasFocus) {
          context.pop();
        } else {
          sidebarFSN.requestFocus();
        }
      },
      headerWidget: HeaderText(
        text: '${channel.channelName} 채널의 동영상',
        fontSize: 24.0,
        horizontalPadding: 5.0,
      ),
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sidebarItems: sidebarItems,
      loadingStateProvider: channelFetchMoreLoadingStateProvider,
      videoGridView: ChannelAllVodList(
        channelId: channel.channelId,
        sortType: vodSortType.value,
        gridViewFSN: gridViewFSN,
        sidebarFSN: sidebarFSN,
      ),
    );
  }
}
