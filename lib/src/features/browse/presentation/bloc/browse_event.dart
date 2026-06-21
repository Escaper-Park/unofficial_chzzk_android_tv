part of 'browse_bloc.dart';

@freezed
sealed class BrowseEvent with _$BrowseEvent {
  const factory BrowseEvent.started({
    required bool isSignedIn,
  }) = _Started;

  const factory BrowseEvent.authStateChanged({
    required bool isSignedIn,
  }) = _AuthStateChanged;

  const factory BrowseEvent.tabSelected(BrowseTab tab) = _TabSelected;

  const factory BrowseEvent.liveSortSelected(
    BrowseLiveSortOption option,
  ) = _LiveSortSelected;

  const factory BrowseEvent.vodSortSelected(
    BrowseVodSortOption option,
  ) = _VodSortSelected;

  const factory BrowseEvent.retryRequested() = _RetryRequested;

  const factory BrowseEvent.loadMoreRequested() = _LoadMoreRequested;
}
