part of 'search_tag_results_bloc.dart';

@freezed
sealed class SearchTagResultsEvent with _$SearchTagResultsEvent {
  const factory SearchTagResultsEvent.started({
    required String tag,
  }) = _Started;

  const factory SearchTagResultsEvent.tabSelected(
    SearchTagResultsTab tab,
  ) = _TabSelected;

  const factory SearchTagResultsEvent.liveSortSelected(
    SearchTagResultsLiveSortOption option,
  ) = _LiveSortSelected;

  const factory SearchTagResultsEvent.vodSortSelected(
    SearchTagResultsVodSortOption option,
  ) = _VodSortSelected;

  const factory SearchTagResultsEvent.retryRequested() = _RetryRequested;

  const factory SearchTagResultsEvent.loadMoreRequested() = _LoadMoreRequested;
}
