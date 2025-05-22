part of '../../category_screen.dart';

class _CategoryGridView extends ConsumerWidget with CategoryState {
  const _CategoryGridView({
    required this.crossAxisCount,
    required this.crossAxisSpacing,
    required this.mainAxisSpacing,
    required this.horizontalPadding,
    this.fetchMore,
    required this.sidebarFSN,
    required this.gridViewFSN,
    required this.pushCategoryDetail,
  });

  final int crossAxisCount;
  final double crossAxisSpacing;
  final double mainAxisSpacing;
  final double horizontalPadding;

  final Future<void> Function()? fetchMore;
  final FocusScopeNode sidebarFSN;
  final FocusScopeNode gridViewFSN;

  final void Function(Category category) pushCategoryDetail;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncCategories = getAsyncCategoryList(ref);

    final double screenWidth = context.screenWidth -
        Dimensions.collapsedSidebarWidth -
        horizontalPadding * 2;

    const double borderWidth = Dimensions.focusedBorderWidth;
    const double infoCardHeight = Dimensions.categoryInfoCardHeight;

    final double posterWidth = ImageUtils.calcImageWidthByCrossAxisCount(
      context,
      screenWidth: screenWidth,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
    );

    final double posterHeight =
        ImageUtils.calcImageHeightByRatio(w: 3, h: 4, imageWidth: posterWidth);

    final double categoryContainerHeight =
        posterHeight + infoCardHeight + borderWidth * 2;
    final double categoryConatinerWidth = posterWidth + borderWidth * 2;

    return AdaptiveGridViewWithAsyncValue(
      asyncValue: asyncCategories,
      crossAxisCount: crossAxisCount,
      crossAxisSpacing: crossAxisSpacing,
      mainAxisExtent: categoryContainerHeight,
      mainAxisSpacing: mainAxisSpacing,
      useFetchMore: true,
      fetchMore: fetchMore,
      gridViewFSN: gridViewFSN,
      leftFSN: sidebarFSN,
      emptyText: '카테고리가 없습니다',
      errorText: '카테고리를 불러올 수 없습니다',
      itemBuilder: (context, index, node, object) {
        return CategoryContainer(
          autofocus: index == 0,
          onPressed: () => pushCategoryDetail(object),
          focusNode: node,
          category: object,
          containerWidth: categoryConatinerWidth,
          containerHeight: categoryContainerHeight,
          posterWidth: posterWidth,
          posterHeight: posterHeight,
        );
      },
    );
  }
}
