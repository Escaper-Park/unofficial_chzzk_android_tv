part of 'category_detail_screen.dart';

List<Widget> _categoryDetailScreenContent({
  required BuildContext context,
  required CategoryDetailState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode gridNode,
  required String? snackbarMessage,
}) {
  return [
    Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        CategoryDetailHeader(state: state),
        Expanded(
          child: CategoryDetailLayout(
            state: state,
            tabsNode: tabsNode,
            gridNode: gridNode,
            onTabSelected: (tab) {
              context.read<CategoryDetailBloc>().add(
                CategoryDetailEvent.tabSelected(tab),
              );
            },
            onFollowPressed: () {
              unawaited(
                _handleFollowPressed(
                  context: context,
                  state: state,
                ),
              );
            },
            onRetry: () {
              context.read<CategoryDetailBloc>().add(
                const CategoryDetailEvent.retryRequested(),
              );
            },
            onLoadMore: () {
              context.read<CategoryDetailBloc>().add(
                const CategoryDetailEvent.loadMoreRequested(),
              );
            },
            onLivePressed: (item) {
              unawaited(
                openLivePlayerFromCard(
                  context,
                  categoryDetailLiveCardItem(item),
                ),
              );
            },
            onVodPressed: (item) {
              unawaited(
                openVodPlayerFromCard(
                  context,
                  categoryDetailVideoCardItem(item),
                ),
              );
            },
          ),
        ),
      ],
    ),
    if (snackbarMessage != null) TvSnackbar(message: snackbarMessage),
  ];
}
