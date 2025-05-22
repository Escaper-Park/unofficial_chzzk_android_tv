part of '../../home_screen.dart';

class _HomePopularLives extends StatelessWidget {
  const _HomePopularLives({
    required this.asyncPopularLives,
    required this.auth,
    required this.aboveFSN,
    required this.listViewFSN,
    required this.belowFSN,
    required this.sidebarFSN,
    required this.fallbackAction,
  });

  final AsyncValue<List<LiveInfo>?> asyncPopularLives;

  /// Get auth state for autofocus;
  final Auth? auth;

  final FocusScopeNode aboveFSN;
  final FocusScopeNode listViewFSN;
  final FocusScopeNode? belowFSN;
  final FocusScopeNode sidebarFSN;

  final VoidCallback fallbackAction;

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalListViewWithHeaderText(
      headerText: '인기 채널 라이브',
      asyncList: asyncPopularLives,
      listViewFSN: listViewFSN,
      sidebarFSN: sidebarFSN,
      aboveFSN: aboveFSN,
      belowFSN: belowFSN,
      emptyText: '인기 채널 라이브를 불러올 수 없습니다',
      errorText: '인기 채널 라이브를 불러올 수 없습니다',
      fallbackAction: fallbackAction,
      itemBuilder: (index, focusNode, object) => LiveContainer(
        appRoute: AppRoute.home,
        autofocus: (index == 0 && auth == null),
        focusNode: focusNode,
        channel: object.channel!,
        liveInfo: object,
      ),
    );
  }
}
