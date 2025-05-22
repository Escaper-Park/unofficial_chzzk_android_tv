part of '../../home_screen.dart';

class _HomeFollowingLives extends StatelessWidget {
  const _HomeFollowingLives({
    required this.asyncFollowingLives,
    required this.aboveFSN,
    required this.listViewFSN,
    required this.belowFSN,
    required this.sidebarFSN,
    required this.fallbackAction,
  });

  final AsyncValue<List<Following>?> asyncFollowingLives;

  final FocusScopeNode aboveFSN;
  final FocusScopeNode listViewFSN;
  final FocusScopeNode belowFSN;
  final FocusScopeNode sidebarFSN;

  final VoidCallback fallbackAction;

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalListViewWithHeaderText(
      headerText: '팔로잉 채널 라이브',
      asyncList: asyncFollowingLives,
      listViewFSN: listViewFSN,
      sidebarFSN: sidebarFSN,
      aboveFSN: aboveFSN,
      belowFSN: belowFSN,
      emptyText: '생방송 중인 팔로잉 채널이 없습니다',
      errorText: '팔로잉 채널 라이브를 불러올 수 없습니다',
      fallbackAction: fallbackAction,
      itemBuilder: (index, focusNode, object) => LiveContainer(
        appRoute: AppRoute.home,
        autofocus: index == 0,
        focusNode: focusNode,
        channel: object.channel,
        liveInfo: object.liveInfo,
      ),
    );
  }
}
