part of 'category_screen.dart';

Widget _categoryScreenContent({
  required BuildContext context,
  required CategoryState state,
  required FocusScopeNode gridNode,
  required String? snackbarMessage,
}) {
  return Stack(
    children: [
      CategoryLayout(
        state: state,
        gridNode: gridNode,
        navigationNode: AppShellFocusScope.navigationOf(context),
        onRetry: () {
          context.read<CategoryBloc>().add(
            const CategoryEvent.retryRequested(),
          );
        },
        onLoadMore: () {
          context.read<CategoryBloc>().add(
            const CategoryEvent.loadMoreRequested(),
          );
        },
        onCategoryPressed: (item) => _openCategory(context, item),
      ),
      if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
    ],
  );
}

void _openCategory(BuildContext context, CategoryItem item) {
  unawaited(
    context.pushNamed(
      AppRoute.categoryDetail.name,
      pathParameters: {
        'categoryType': item.categoryType,
        'categoryId': item.categoryId,
      },
    ),
  );
}
