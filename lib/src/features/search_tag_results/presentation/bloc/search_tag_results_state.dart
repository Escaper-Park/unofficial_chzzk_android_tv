part of 'search_tag_results_bloc.dart';

enum SearchTagResultsTab {
  live,
  vod,
}

enum SearchTagResultsLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum SearchTagResultsPaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum SearchTagResultsFeedbackType {
  noMoreData,
}

enum SearchTagResultsLiveSortOption {
  popular(LiveSort.popular),
  latest(LiveSort.latest);

  const SearchTagResultsLiveSortOption(this.sort);

  final LiveSort sort;
}

enum SearchTagResultsVodSortOption {
  popular(VodSort.popular),
  latest(VodSort.latest);

  const SearchTagResultsVodSortOption(this.sort);

  final VodSort sort;
}

@freezed
abstract class SearchTagResultsState with _$SearchTagResultsState {
  const factory SearchTagResultsState({
    required String tag,
    required SearchTagResultsTab selectedTab,
    required SearchTagResultsLiveSortOption liveSortOption,
    required SearchTagResultsVodSortOption vodSortOption,
    required SearchTagResultsPageData<SearchTagLive, SearchTagLiveCursor> live,
    required SearchTagResultsPageData<SearchTagVideo, SearchTagVideoCursor> vod,
    SearchTagResultsFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _SearchTagResultsState;

  factory SearchTagResultsState.initial() {
    return SearchTagResultsState(
      tag: '',
      selectedTab: SearchTagResultsTab.live,
      liveSortOption: SearchTagResultsLiveSortOption.popular,
      vodSortOption: SearchTagResultsVodSortOption.popular,
      live: searchTagResultsPageInitial<SearchTagLive, SearchTagLiveCursor>(),
      vod: searchTagResultsPageInitial<SearchTagVideo, SearchTagVideoCursor>(),
    );
  }
}

@freezed
abstract class SearchTagResultsPageData<T, C>
    with _$SearchTagResultsPageData<T, C> {
  const SearchTagResultsPageData._();

  const factory SearchTagResultsPageData({
    required SearchTagResultsLoadStatus status,
    required List<T> items,
    C? cursor,
    required SearchTagResultsPaginationStatus paginationStatus,
  }) = _SearchTagResultsPageData<T, C>;

  bool get canLoadMore {
    return cursor != null &&
        paginationStatus != SearchTagResultsPaginationStatus.loading &&
        paginationStatus != SearchTagResultsPaginationStatus.exhausted;
  }
}

SearchTagResultsPageData<T, C> searchTagResultsPageInitial<T, C>() {
  return SearchTagResultsPageData<T, C>(
    status: SearchTagResultsLoadStatus.initial,
    items: <T>[],
    paginationStatus: SearchTagResultsPaginationStatus.idle,
  );
}

SearchTagResultsPageData<T, C> searchTagResultsPageLoading<T, C>() {
  return SearchTagResultsPageData<T, C>(
    status: SearchTagResultsLoadStatus.loading,
    items: <T>[],
    paginationStatus: SearchTagResultsPaginationStatus.idle,
  );
}

SearchTagResultsPageData<T, C> searchTagResultsPageReady<T, C>({
  required List<T> items,
  C? cursor,
}) {
  return SearchTagResultsPageData<T, C>(
    status: SearchTagResultsLoadStatus.ready,
    items: items,
    cursor: cursor,
    paginationStatus: cursor == null
        ? SearchTagResultsPaginationStatus.exhausted
        : SearchTagResultsPaginationStatus.idle,
  );
}

SearchTagResultsPageData<T, C> searchTagResultsPageFailure<T, C>() {
  return SearchTagResultsPageData<T, C>(
    status: SearchTagResultsLoadStatus.failure,
    items: <T>[],
    paginationStatus: SearchTagResultsPaginationStatus.idle,
  );
}
