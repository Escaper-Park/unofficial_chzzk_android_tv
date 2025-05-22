import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/enums.dart' show AppRoute, VideoSortType;
import '../../common/widgets/screen/screen_widgets.dart'
    show VideoGridSection, VideoGridViewScreen;
import '../../common/widgets/ui/ui_widgets.dart' show HeaderText;

import '../vod/model/vod.dart';
import '../vod/widgets/vod_widgets.dart';

import 'channel_vod_event.dart';
import 'channel_vod_state.dart';

class ChannelVodScreen extends ConsumerWidget
    with ChannelVodEvent, ChannelVodState {
  const ChannelVodScreen({
    super.key,
    required this.channelId,
    required this.channelName,
  });

  final String channelId;
  final String channelName;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gridViewSidebarData = [
      ('인기순', VideoSortType.popular),
      ('최신순', VideoSortType.latest),
    ];

    final baseSection = VideoGridSection(
      getAsyncValue: (sortType) => getAsyncChannelVodsSortBy(
        ref,
        channelId: channelId,
        sortType: sortType,
      ),
      fetchMore: (sortType) async => await channelVodFetchMore(
        ref,
        channelId: channelId,
        sortType: sortType,
      ),
      emptyText: '동영상이 없습니다',
      errorText: '동영상을 불러올 수 없습니다',
      itemBuilder: (context, index, node, object) {
        return VodContainer(
          appRoute: AppRoute.channelVod,
          autofocus: index == 0,
          focusNode: node,
          vod: object,
        );
      },
    );

    return VideoGridViewScreen<Vod>(
      baseRoute: AppRoute.channelVod,
      gridViewSidebarData: gridViewSidebarData,
      sectionBuilder: (sortType) => switch (sortType) {
        VideoSortType.popular => baseSection,
        VideoSortType.latest => baseSection,
        _ => baseSection,
      },
      headerWidget:
          HeaderText(text: '$channelName 채널 동영상', horizontalPadding: 16.0),
      popAction: () => pop(context),
    );
  }
}
