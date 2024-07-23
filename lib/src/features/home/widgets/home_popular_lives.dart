import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../live/controller/live_controller.dart';
import '../../live/model/live.dart';
import '../../live/widgets/live_container/live_container.dart';
import './home_list_view_container.dart';

class HomePopularLives extends ConsumerWidget {
  const HomePopularLives({
    super.key,
    required this.autofocus,
    required this.listFSN,
    required this.sidebarFSN,
    required this.aboveFSN,
    required this.belowFSN,
  });

  final bool autofocus;
  final FocusScopeNode listFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncHomePopularLives = ref.watch(homePopularLivesControllerProvider);

    return HomeListViewContainer<LiveInfo>(
      headerText: '인기 채널 라이브',
      asyncValue: asyncHomePopularLives,
      emptyText: '인기 채널을 불러올 수 없습니다',
      errorText: '인기 채널을 불러올 수 없습니다',
      listFSN: listFSN,
      sidebarFSN: sidebarFSN,
      aboveFSN: aboveFSN,
      belowFSN: belowFSN,
      itemBuilder: (index, focusNode, object) {
        return LiveContainer(
          autofocus: index == 0 ? autofocus : false,
          focusNode: focusNode,
          liveInfo: object,
          channel: object.channel!,
        );
      },
    );
  }
}
