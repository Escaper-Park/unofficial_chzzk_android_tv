import 'package:flutter/material.dart';

import '../../../../../core/tv/focus/focus.dart';
import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/category_item.dart';
import '../../bloc/category_bloc.dart';
import '../../category_screen_string.dart';
import '../sections/grid/category_grid_section.dart';

class CategoryLayout extends StatelessWidget {
  const CategoryLayout({
    super.key,
    required this.state,
    required this.gridNode,
    required this.navigationNode,
    required this.onRetry,
    required this.onLoadMore,
    required this.onCategoryPressed,
  });

  final CategoryState state;
  final FocusScopeNode gridNode;
  final FocusScopeNode navigationNode;
  final VoidCallback onRetry;
  final VoidCallback onLoadMore;
  final ValueChanged<CategoryItem> onCategoryPressed;

  @override
  Widget build(BuildContext context) {
    if (state.loadStatus == CategoryLoadStatus.loading ||
        state.loadStatus == CategoryLoadStatus.initial) {
      return TvFocusSection.list(
        node: gridNode,
        up: navigationNode,
        child: const ContentStateView.loading(
          message: CategoryScreenString.loading,
        ),
      );
    }

    if (state.loadStatus == CategoryLoadStatus.failure) {
      return _CategoryStateSection(
        gridNode: gridNode,
        navigationNode: navigationNode,
        child: ContentStateView.error(
          message: CategoryScreenString.error,
          action: TvButton.label(
            text: CategoryScreenString.retry,
            onPressed: onRetry,
            autofocus: true,
          ),
        ),
      );
    }

    if (!state.hasItems) {
      return _CategoryStateSection(
        gridNode: gridNode,
        navigationNode: navigationNode,
        child: ContentStateView.empty(
          message: CategoryScreenString.empty,
          action: TvButton.label(
            text: CategoryScreenString.retry,
            onPressed: onRetry,
            autofocus: true,
          ),
        ),
      );
    }

    return CategoryGridSection(
      items: state.items,
      gridNode: gridNode,
      navigationNode: navigationNode,
      hasMore: state.canLoadMore,
      isLoadingMore: state.paginationStatus == CategoryPaginationStatus.loading,
      onLoadMore: onLoadMore,
      onCategoryPressed: onCategoryPressed,
    );
  }
}

class _CategoryStateSection extends StatelessWidget {
  const _CategoryStateSection({
    required this.gridNode,
    required this.navigationNode,
    required this.child,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode navigationNode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: gridNode,
      up: navigationNode,
      child: child,
    );
  }
}
