part of 'browse_bloc.dart';

enum BrowseTab {
  live,
  vod,
}

enum BrowseLoadStatus {
  initial,
  loading,
  ready,
  failure,
}

enum BrowsePaginationStatus {
  idle,
  loading,
  failure,
  exhausted,
}

enum BrowseFeedbackType {
  noMoreData,
}

enum BrowseLiveSortOption {
  popular(LiveSort.popular),
  latest(LiveSort.latest);

  const BrowseLiveSortOption(this.sort);

  final LiveSort sort;
}

enum BrowseVodSortOption {
  popular(sort: VodSort.popular, requiresSignIn: false),
  latest(sort: VodSort.latest, requiresSignIn: false),
  following(sort: null, requiresSignIn: true),
  watchingHistory(sort: null, requiresSignIn: true);

  const BrowseVodSortOption({
    required this.sort,
    required this.requiresSignIn,
  });

  final VodSort? sort;
  final bool requiresSignIn;
}

@freezed
abstract class BrowseState with _$BrowseState {
  const BrowseState._();

  const factory BrowseState({
    required bool isSignedIn,
    required BrowseTab selectedTab,
    required BrowseLiveSortOption liveSortOption,
    required BrowseVodSortOption vodSortOption,
    required BrowsePageData<Live, LiveCursor> live,
    required BrowsePageData<Vod, BrowseVodCursor> vod,
    BrowseFeedbackType? feedbackType,
    @Default(0) int feedbackSerial,
  }) = _BrowseState;

  factory BrowseState.initial({
    BrowseTab selectedTab = BrowseTab.live,
    BrowseLiveSortOption liveSortOption = BrowseLiveSortOption.popular,
    BrowseVodSortOption vodSortOption = BrowseVodSortOption.popular,
  }) {
    return BrowseState(
      isSignedIn: false,
      selectedTab: selectedTab,
      liveSortOption: liveSortOption,
      vodSortOption: vodSortOption,
      live: browsePageInitial<Live, LiveCursor>(),
      vod: browsePageInitial<Vod, BrowseVodCursor>(),
    );
  }

  bool get selectedContentRequiresAuth {
    return selectedTab == BrowseTab.vod &&
        vodSortOption.requiresSignIn &&
        !isSignedIn;
  }
}

@freezed
abstract class BrowsePageData<T, C> with _$BrowsePageData<T, C> {
  const BrowsePageData._();

  const factory BrowsePageData({
    required BrowseLoadStatus status,
    required List<T> items,
    C? cursor,
    required BrowsePaginationStatus paginationStatus,
  }) = _BrowsePageData<T, C>;

  bool get hasItems => items.isNotEmpty;

  bool get canLoadMore {
    return cursor != null &&
        paginationStatus != BrowsePaginationStatus.loading &&
        paginationStatus != BrowsePaginationStatus.exhausted;
  }
}

@freezed
sealed class BrowseVodCursor with _$BrowseVodCursor {
  const factory BrowseVodCursor.vod(VodCursor cursor) = _BrowseVodCursorVod;

  const factory BrowseVodCursor.following(
    FollowingVodCursor cursor,
  ) = _BrowseVodCursorFollowing;

  const factory BrowseVodCursor.watchingHistory(
    WatchingHistoryCursor cursor,
  ) = _BrowseVodCursorWatchingHistory;
}

BrowsePageData<T, C> browsePageInitial<T, C>() {
  return BrowsePageData<T, C>(
    status: BrowseLoadStatus.initial,
    items: <T>[],
    paginationStatus: BrowsePaginationStatus.idle,
  );
}

BrowsePageData<T, C> browsePageLoading<T, C>() {
  return BrowsePageData<T, C>(
    status: BrowseLoadStatus.loading,
    items: <T>[],
    paginationStatus: BrowsePaginationStatus.idle,
  );
}

BrowsePageData<T, C> browsePageReady<T, C>({
  required List<T> items,
  C? cursor,
}) {
  return BrowsePageData<T, C>(
    status: BrowseLoadStatus.ready,
    items: items,
    cursor: cursor,
    paginationStatus: cursor == null
        ? BrowsePaginationStatus.exhausted
        : BrowsePaginationStatus.idle,
  );
}

BrowsePageData<T, C> browsePageFailure<T, C>() {
  return BrowsePageData<T, C>(
    status: BrowseLoadStatus.failure,
    items: <T>[],
    paginationStatus: BrowsePaginationStatus.idle,
  );
}
