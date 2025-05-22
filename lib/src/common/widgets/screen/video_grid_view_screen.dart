import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../constants/dimensions.dart';
import '../../constants/enums.dart' show AppRoute, VideoSortType;
import 'adaptive_grid_view/adaptive_grid_view.dart';
import 'adaptive_grid_view/adaptive_grid_view_sidebar.dart';
import 'screen_widgets.dart';

part 'video_grid_view/video_grid_view_body.dart';
part 'video_grid_view/video_grid_view.dart';

class VideoGridViewScreen<T> extends HookWidget {
  const VideoGridViewScreen({
    super.key,
    required this.baseRoute,
    required this.gridViewSidebarData,
    required this.sectionBuilder,
    this.currentSortState,
    this.sidebarFSN,
    this.gridViewFSN,
    this.headerFSN,
    required this.headerWidget,
    required this.popAction,
  });

  final AppRoute baseRoute;
  final List<(String, VideoSortType)> gridViewSidebarData;
  final VideoGridSection<T> Function(VideoSortType sortType) sectionBuilder;

  final ValueNotifier<(int orderIndex, int filterIndex)>? currentSortState;
  final FocusScopeNode? sidebarFSN;
  final FocusScopeNode? gridViewFSN;
  final FocusScopeNode? headerFSN;
  final Widget headerWidget;
  final VoidCallback popAction;

  @override
  Widget build(BuildContext context) {
    final widgetSidebarFSN = sidebarFSN ?? useFocusScopeNode();
    final widgetGridViewFSN = gridViewFSN ?? useFocusScopeNode();

    final sortState = useState<VideoSortType>(gridViewSidebarData[0].$2);
    final config = sectionBuilder(sortState.value);
    final asyncList = config.getAsyncValue(sortState.value);

    final sidebarItems = buildSidebarItems(
      gridViewSidebarData,
      sortState.value,
      (newSort, newOrderIndex) {
        sortState.value = newSort;
        if (currentSortState != null) {
          currentSortState?.value = (newOrderIndex, currentSortState!.value.$2);
        }
      },
    );

    return _VideoGridViewBody(
      baseRoute: baseRoute,
      onPopInvoked: (handler) {
        handler.sidebarFocusAndPop(
          node: widgetSidebarFSN,
          popAction: popAction,
        );
      },
      sidebarFSN: widgetSidebarFSN,
      gridViewFSN: widgetGridViewFSN,
      headerWidget: headerWidget,
      headerFSN: headerFSN,
      sidebarItems: sidebarItems,
      gridView: _VideoGridView(
        crossAxisCount: config.crossAxisCount,
        mainAxisExtent: config.itemHeight,
        asyncList: asyncList,
        fetchMore: () async {
          if (config.fetchMore != null) {
            await config.fetchMore!(sortState.value);
          }
        },
        headerFSN: headerFSN,
        sidebarFSN: widgetSidebarFSN,
        gridViewFSN: widgetGridViewFSN,
        emptyText: config.emptyText,
        errorText: config.errorText,
        itemBuilder: config.itemBuilder,
      ),
    );
  }
}

class VideoGridSection<T> {
  final int crossAxisCount;
  final double itemHeight;

  final AsyncValue<List<T>?> Function(VideoSortType sortType) getAsyncValue;
  final Future<void> Function(VideoSortType sortType)? fetchMore;
  final String emptyText;
  final String errorText;

  final Widget Function(
    BuildContext context,
    int index,
    FocusNode node,
    T item,
  ) itemBuilder;

  VideoGridSection({
    this.crossAxisCount = 3,
    this.itemHeight = Dimensions.videoContainerHeight,
    required this.getAsyncValue,
    required this.fetchMore,
    required this.emptyText,
    required this.errorText,
    required this.itemBuilder,
  });

  VideoGridSection<T> copyWith({
    int? crossAxisCount,
    double? mainAxisExtent,
    AsyncValue<List<T>?> Function(VideoSortType sortType)? getAsyncValue,
    Future<void> Function(VideoSortType sortType)? fetchMore,
    String? emptyText,
    String? errorText,
    Widget Function(BuildContext context, int index, FocusNode node, T item)?
        itemBuilder,
  }) {
    return VideoGridSection(
      crossAxisCount: crossAxisCount ?? this.crossAxisCount,
      itemHeight: mainAxisExtent ?? this.itemHeight,
      getAsyncValue: getAsyncValue ?? this.getAsyncValue,
      fetchMore: fetchMore ?? this.fetchMore,
      emptyText: emptyText ?? this.emptyText,
      errorText: errorText ?? this.errorText,
      itemBuilder: itemBuilder ?? this.itemBuilder,
    );
  }
}
