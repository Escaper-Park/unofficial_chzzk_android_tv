import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../following/controller/following_controller.dart';
import '../../following/model/following.dart';
import '../../live/widgets/live_container/live_container.dart';
import 'home_list_view_container.dart';

class HomeFollowingLives extends ConsumerWidget {
  const HomeFollowingLives({
    super.key,
    required this.listFSN,
    required this.sidebarFSN,
    required this.aboveFSN,
    required this.belowFSN,
  });

  final FocusScopeNode listFSN;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode aboveFSN;
  final FocusScopeNode belowFSN;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncFollowingLives = ref.watch(followingLivesControllerProvider);

    return HomeListViewContainer<Following>(
      headerText: '팔로잉 채널 라이브',
      asyncValue: asyncFollowingLives,
      emptyText: '생방송 채널이 없습니다',
      errorText: '팔로잉 채널 라이브를 불러올 수 없습니다',
      listFSN: listFSN,
      sidebarFSN: sidebarFSN,
      aboveFSN: aboveFSN,
      belowFSN: belowFSN,
      itemBuilder: (index, focusNode, object) {
        return LiveContainer(
          autofocus: index == 0 ? true : false,
          focusNode: focusNode,
          liveInfo: object.liveInfo,
          channel: object.channel,
        );
      },
    );
  }
}
