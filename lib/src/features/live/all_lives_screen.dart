import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/video_grid_view_screen.dart';
import '../../utils/router/app_router.dart';
import '../dashboard/controller/dashboard_controller.dart';

import './repository/live_repository.dart';
import 'widgets/all_lives/all_live_list.dart';
import './controller/live_controller.dart';

class AllLivesScreen extends HookConsumerWidget {
  const AllLivesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sidebarFSN = useFocusScopeNode();
    final gridViewFSN = useFocusScopeNode();

    final liveType = useState<LiveSortType>(LiveSortType.popular);

    final List<VideoScreenSidebarItem> sidebarItems = [
      (
        '인기순',
        () {
          if (liveType.value != LiveSortType.popular) {
            liveType.value = LiveSortType.popular;
          }
        },
      ),
      (
        '최신순',
        () {
          if (liveType.value != LiveSortType.latest) {
            liveType.value = LiveSortType.latest;
          }
        },
      ),
    ];

    return VideoGridViewScreen(
      onPopInvoked: (_) {
        if (sidebarFSN.hasFocus) {
          ref
              .read(dashboardControllerProvider.notifier)
              .changeScreen(context, AppRoute.home);
        } else {
          sidebarFSN.requestFocus();
        }
      },
      headerWidget: const HeaderText(
          text: '전체 라이브', fontSize: 24.0, horizontalPadding: 5.0),
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sidebarItems: sidebarItems,
      loadingStateProvider: liveFetchMoreLoadingStateProvider,
      videoGridView: AllLivesList(
        sortType: liveType.value,
        gridViewFSN: gridViewFSN,
        sidebarFSN: sidebarFSN,
      ),
    );
  }
}
