part of 'category_bloc.dart';

enum CategoryLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum CategoryPaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum CategoryFeedbackType {
  noMoreData,
  loadMoreFailure,
}

@freezed
abstract class CategoryState with _$CategoryState {
  const CategoryState._();

  const factory CategoryState({
    @Default(CategoryLoadStatus.initial) CategoryLoadStatus loadStatus,
    @Default(<CategoryItem>[]) List<CategoryItem> items,
    CategoryPageCursor? cursor,
    @Default(CategoryPaginationStatus.idle)
    CategoryPaginationStatus paginationStatus,
    CategoryFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _CategoryState;

  bool get hasItems => items.isNotEmpty;

  bool get canLoadMore {
    return cursor != null &&
        paginationStatus != CategoryPaginationStatus.loading &&
        paginationStatus != CategoryPaginationStatus.exhausted;
  }
}
