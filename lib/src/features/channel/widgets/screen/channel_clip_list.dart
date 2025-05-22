part of '../../channel_screen.dart';

class _ChannelClipList extends StatelessWidget {
  const _ChannelClipList({
    required this.appRoute,
    required this.asyncChannelClipList,
    required this.channelName,
    required this.itemFSN,
    this.leftFSN,
    required this.aboveFSN,
  });

  final AppRoute appRoute;
  final AsyncValue<List<NaverClip>?> asyncChannelClipList;
  final String channelName;
  final FocusScopeNode itemFSN;
  final FocusScopeNode? leftFSN;
  final FocusScopeNode aboveFSN;

  @override
  Widget build(BuildContext context) {
    return DpadListViewWithAsyncValue<NaverClip>(
      asyncValue: asyncChannelClipList,
      itemWidth: Dimensions.clipContainerWidth,
      itemHeight: Dimensions.clipContainerHeight,
      listViewFSN: itemFSN,
      aboveFSN: aboveFSN,
      sidebarFSN: leftFSN,
      emptyText: '채널에 클립이 없습니다',
      errorText: '클립을 불러올 수 없습니다',
      useExceptionFallbackWidget: false,
      itemBuilder: (index, focusNode, object) => ClipContainer(
        appRoute: appRoute,
        autofocus: false,
        focusNode: focusNode,
        clip: object,
        channelName: channelName,
      ),
    );
  }
}
