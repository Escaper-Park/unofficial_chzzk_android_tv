part of '../video_grid_view_screen.dart';

class _VideoGridView<T> extends StatelessWidget {
  const _VideoGridView({
    required this.crossAxisCount,
    this.mainAxisExtent = Dimensions.videoContainerHeight,
    required this.asyncList,
    this.fetchMore,
    required this.sidebarFSN,
    required this.gridViewFSN,
    this.headerFSN,
    required this.emptyText,
    required this.errorText,
    required this.itemBuilder,
  });

  final int crossAxisCount;
  final double mainAxisExtent;
  final AsyncValue<List<T>?> asyncList;
  final Future<void> Function()? fetchMore;

  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;
  final FocusScopeNode? headerFSN;

  final String emptyText;
  final String errorText;

  final Widget Function(
    BuildContext context,
    int index,
    FocusNode node,
    T object,
  ) itemBuilder;

  @override
  Widget build(BuildContext context) {
    return AdaptiveGridViewWithAsyncValue<T>(
      crossAxisCount: crossAxisCount,
      mainAxisExtent: mainAxisExtent,
      asyncValue: asyncList,
      useFetchMore: true,
      fetchMore: fetchMore,
      gridViewFSN: gridViewFSN,
      leftFSN: sidebarFSN,
      headerFSN: headerFSN,
      emptyText: emptyText,
      errorText: errorText,
      itemBuilder: itemBuilder,
    );
  }
}
