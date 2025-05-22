part of '../../home_screen.dart';

class _HomeFollowingCategories extends StatelessWidget {
  const _HomeFollowingCategories({
    required this.asyncFollowingCategories,
    required this.aboveFSN,
    required this.listViewFSN,
    required this.sidebarFSN,
    required this.fallbackAction,
    required this.pushToCategoryDetail,
  });

  final AsyncValue<List<Category>?> asyncFollowingCategories;

  final FocusScopeNode aboveFSN;
  final FocusScopeNode listViewFSN;
  final FocusScopeNode sidebarFSN;

  final VoidCallback fallbackAction;
  final void Function(Category category) pushToCategoryDetail;

  @override
  Widget build(BuildContext context) {
    return HomeHorizontalListViewWithHeaderText(
      itemWidth: Dimensions.homeCategoryContainerWidth,
      itemHeight: Dimensions.homeCategoryContainerHeight,
      headerText: '팔로잉 카테고리',
      asyncList: asyncFollowingCategories,
      aboveFSN: aboveFSN,
      listViewFSN: listViewFSN,
      sidebarFSN: sidebarFSN,
      emptyText: '팔로잉 카테고리가 없습니다',
      errorText: '팔로잉 카테고리를 불러올 수 없습니다',
      fallbackAction: fallbackAction,
      itemBuilder: (index, focusNode, object) => HomeFollowingCategoryItem(
        category: object,
        focusNode: focusNode,
        onPressed: () => pushToCategoryDetail(object),
      ),
    );
  }
}
