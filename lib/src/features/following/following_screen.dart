import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/dimensions.dart';
import '../../common/widgets/center_widgets.dart';
import '../dashboard/dashboard_screen.dart';
import './controller/following_controller.dart';

import './widgets/following_widgets.dart';

class FollowingScreen extends HookConsumerWidget {
  const FollowingScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final channelDataFSN = useFocusScopeNode();
    final followingListFSN = useFocusScopeNode();

    final asyncFollowingList = ref.watch(followingControllerProvider);

    return DashboardScreen(
      sidebarFSN: sidebarFSN,
      contentScreenFSN: followingListFSN,
      contentScreen: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10.0,
          vertical: 6.0,
        ),
        child: switch (asyncFollowingList) {
          AsyncData(:final value) => value == null
              ? const CenteredText(text: '팔로잉 채널이 없습니다')
              : Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Following List
                    SizedBox(
                      width: Dimensions.followingListWidth,
                      child: FollowingList(
                        followingList: value,
                        followingListFSN: followingListFSN,
                        sidebarFSN: sidebarFSN,
                        channelDataFSN: channelDataFSN,
                      ),
                    ),
                    // Following Channel Data
                    Expanded(
                      child: FollowingChannelData(
                        channelListFSN: followingListFSN,
                        channelDataFSN: channelDataFSN,
                      ),
                    ),
                  ],
                ),
          AsyncError() => const CenteredText(text: '팔로잉 목록을 불러오는데 실패했습니다'),
          _ => const SizedBox.shrink(),
        },
      ),
    );
  }
}
