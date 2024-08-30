import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/video_grid_view_screen.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';

import './controller/vod_controller.dart';
import './repository/vod_repository.dart';
import './widgets/all_vods/following_vod_list.dart';
import './widgets/all_vods/popular_vod_list.dart';

class AllVodsScreen extends HookConsumerWidget {
  const AllVodsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();

    final vodSortType = useState<VodSortType>(VodSortType.following);

    final List<VideoScreenSidebarItem> sidebarItems = [
      (
        '팔로잉',
        () {
          if (vodSortType.value != VodSortType.following) {
            vodSortType.value = VodSortType.following;
          }
        },
      ),
      (
        '인기',
        () {
          if (vodSortType.value != VodSortType.popular) {
            vodSortType.value = VodSortType.popular;
          }
        },
      ),
    ];

    return VideoGridViewScreen(
      onPopInvoked: (_, __) {
        if (sidebarFSN.hasFocus) {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.home);
        } else {
          sidebarFSN.requestFocus();
        }
      },
      headerWidget: const HeaderText(
          text: '다시보기', fontSize: 24.0, horizontalPadding: 5.0),
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sidebarItems: sidebarItems,
      loadingStateProvider: followingVodFetchMoreStateProvider,
      videoGridView: vodSortType.value == VodSortType.following
          ? FollowingVodList(gridViewFSN: gridViewFSN, sidebarFSN: sidebarFSN)
          : PopularVodList(gridViewFSN: gridViewFSN, sidebarFSN: sidebarFSN),
    );
  }
}
