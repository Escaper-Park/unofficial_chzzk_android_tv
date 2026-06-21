part of 'category_detail_bloc.dart';

enum CategoryDetailTab {
  live,
  vod,
}

enum CategoryDetailLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum CategoryDetailPaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum CategoryDetailFeedbackType {
  noMoreData,
  loadMoreFailure,
  followSuccess,
  followFailure,
  unfollowSuccess,
  unfollowFailure,
}

@freezed
abstract class CategoryDetailState with _$CategoryDetailState {
  const CategoryDetailState._();

  const factory CategoryDetailState({
    required String categoryType,
    required String categoryId,
    required bool isSignedIn,
    required CategoryDetailTab selectedTab,
    CategoryInfo? info,
    required CategoryDetailPageData<CategoryLive, CategoryLiveCursor> live,
    required CategoryDetailPageData<CategoryVideo, CategoryVideoCursor> vod,
    CategoryDetailFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _CategoryDetailState;

  factory CategoryDetailState.initial({
    bool isSignedIn = false,
  }) {
    return CategoryDetailState(
      categoryType: '',
      categoryId: '',
      isSignedIn: isSignedIn,
      selectedTab: CategoryDetailTab.live,
      live: categoryDetailPageInitial<CategoryLive, CategoryLiveCursor>(),
      vod: categoryDetailPageInitial<CategoryVideo, CategoryVideoCursor>(),
    );
  }

  bool get hasCategory => categoryType.isNotEmpty && categoryId.isNotEmpty;

  bool get isFollowing => info?.following ?? false;

  bool get canUseFollowAction => isSignedIn && info != null;
}

@freezed
abstract class CategoryDetailPageData<T, C>
    with _$CategoryDetailPageData<T, C> {
  const CategoryDetailPageData._();

  const factory CategoryDetailPageData({
    required CategoryDetailLoadStatus status,
    required List<T> items,
    C? cursor,
    required CategoryDetailPaginationStatus paginationStatus,
  }) = _CategoryDetailPageData<T, C>;

  bool get canLoadMore {
    return cursor != null &&
        paginationStatus != CategoryDetailPaginationStatus.loading &&
        paginationStatus != CategoryDetailPaginationStatus.exhausted;
  }
}

CategoryDetailPageData<T, C> categoryDetailPageInitial<T, C>() {
  return CategoryDetailPageData<T, C>(
    status: CategoryDetailLoadStatus.initial,
    items: <T>[],
    paginationStatus: CategoryDetailPaginationStatus.idle,
  );
}

CategoryDetailPageData<T, C> categoryDetailPageLoading<T, C>() {
  return CategoryDetailPageData<T, C>(
    status: CategoryDetailLoadStatus.loading,
    items: <T>[],
    paginationStatus: CategoryDetailPaginationStatus.idle,
  );
}

CategoryDetailPageData<T, C> categoryDetailPageReady<T, C>({
  required List<T> items,
  C? cursor,
}) {
  return CategoryDetailPageData<T, C>(
    status: CategoryDetailLoadStatus.ready,
    items: items,
    cursor: cursor,
    paginationStatus: cursor == null
        ? CategoryDetailPaginationStatus.exhausted
        : CategoryDetailPaginationStatus.idle,
  );
}

CategoryDetailPageData<T, C> categoryDetailPageFailure<T, C>() {
  return CategoryDetailPageData<T, C>(
    status: CategoryDetailLoadStatus.failure,
    items: <T>[],
    paginationStatus: CategoryDetailPaginationStatus.idle,
  );
}
