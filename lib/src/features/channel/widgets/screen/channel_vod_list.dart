part of '../../channel_screen.dart';

class _ChannelVodList extends StatelessWidget {
  const _ChannelVodList({
    required this.baseRoute,
    required this.openLive,
    required this.asyncChannelVodList,
    required this.itemNode,
    required this.leftFSN,
    required this.aboveFSN,
    required this.belowFSN,
  });

  final AppRoute baseRoute;
  final bool openLive;
  final AsyncValue<List<Vod>?> asyncChannelVodList;
  final FocusScopeNode itemNode;
  final FocusScopeNode? leftFSN;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context) {
    return DpadListViewWithAsyncValue<Vod>(
      asyncValue: asyncChannelVodList,
      itemWidth: Dimensions.videoContainerWidth,
      itemHeight: Dimensions.videoContainerHeight,
      listViewFSN: itemNode,
      aboveFSN: aboveFSN,
      belowFSN: belowFSN,
      sidebarFSN: leftFSN,
      emptyText: '채널에 다시보기가 없습니다',
      errorText: '다시보기를 불러올 수 없습니다',
      useExceptionFallbackWidget: true,
      fallbackAction: () {},
      itemBuilder: (index, focusNode, object) => VodContainer(
        appRoute: baseRoute,
        autofocus: (index == 0 && !openLive) ? true : false,
        focusNode: focusNode,
        vod: object,
        displayChannelData: false,
      ),
    );
  }
}
