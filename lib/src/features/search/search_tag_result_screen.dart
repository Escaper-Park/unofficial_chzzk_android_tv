import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/video_grid_view_screen.dart';
import '../../utils/router/app_router.dart';
import '../live/repository/live_repository.dart';
import './controller/search_controller.dart';
import './widgets/search_tags/search_tag_live_list.dart';

class SearchTagResultScreen extends HookConsumerWidget {
  const SearchTagResultScreen({
    super.key,
    required this.tag,
  });

  final String tag;

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
      onPopInvoked: (didPop) {
        if (sidebarFSN.hasFocus) {
          if (!didPop) context.pop();
        } else {
          sidebarFSN.requestFocus();
        }
      },
      headerWidget: HeaderText(
          text: "'$tag' 검색 결과", fontSize: 24.0, horizontalPadding: 5.0),
      sidebarFSN: sidebarFSN,
      gridViewFSN: gridViewFSN,
      sidebarItems: sidebarItems,
      loadingStateProvider: searchTagLiveFetchMoreLoadingStateProvider,
      videoGridView: SearchTagLiveList(
        tag: tag,
        sortType: liveType.value,
        gridViewFSN: gridViewFSN,
        sidebarFSN: sidebarFSN,
      ),
    );
  }
}
