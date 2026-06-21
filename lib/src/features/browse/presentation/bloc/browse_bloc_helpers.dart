part of 'browse_bloc.dart';

extension _BrowseBlocHelpers on BrowseBloc {
  Future<BrowsePageData<Vod, BrowseVodCursor>> _fetchVodPage({
    BrowseVodCursor? cursor,
  }) async {
    return switch (state.vodSortOption) {
      BrowseVodSortOption.popular ||
      BrowseVodSortOption.latest => _fetchSortedVods(cursor),
      BrowseVodSortOption.following => _fetchFollowingVods(cursor),
      BrowseVodSortOption.watchingHistory => _fetchWatchingHistoryVods(cursor),
    };
  }

  Future<BrowsePageData<Vod, BrowseVodCursor>> _fetchSortedVods(
    BrowseVodCursor? cursor,
  ) async {
    final page = await vodRepository.getVods(
      size: BrowseBloc._pageSize,
      sortType: state.vodSortOption.sort,
      cursor: cursor?.mapOrNull(vod: (value) => value.cursor),
    );

    return browsePageReady<Vod, BrowseVodCursor>(
      items: page.items,
      cursor: page.cursor == null ? null : BrowseVodCursor.vod(page.cursor!),
    );
  }

  Future<BrowsePageData<Vod, BrowseVodCursor>> _fetchFollowingVods(
    BrowseVodCursor? cursor,
  ) async {
    final page = await vodRepository.getFollowingVods(
      size: BrowseBloc._pageSize,
      cursor: cursor?.mapOrNull(following: (value) => value.cursor),
    );

    return browsePageReady<Vod, BrowseVodCursor>(
      items: page.items,
      cursor: page.cursor == null
          ? null
          : BrowseVodCursor.following(page.cursor!),
    );
  }

  Future<BrowsePageData<Vod, BrowseVodCursor>> _fetchWatchingHistoryVods(
    BrowseVodCursor? cursor,
  ) async {
    final page = await watchingHistoryRepository.fetchWatchingHistory(
      size: BrowseBloc._pageSize,
      cursor: cursor?.mapOrNull(watchingHistory: (value) => value.cursor),
    );

    return browsePageReady<Vod, BrowseVodCursor>(
      items: [
        for (final item in page.items) ?vodFromWatchingHistoryItem(item),
      ],
      cursor: page.cursor == null
          ? null
          : BrowseVodCursor.watchingHistory(page.cursor!),
    );
  }

  bool _selectedTabRequiresAuth(BrowseState state) {
    return state.selectedTab == BrowseTab.vod &&
        state.vodSortOption.requiresSignIn &&
        !state.isSignedIn;
  }

  bool _canRequestMore<T, C>(BrowsePageData<T, C> data) {
    return data.status == BrowseLoadStatus.ready &&
        data.paginationStatus != BrowsePaginationStatus.loading &&
        data.paginationStatus != BrowsePaginationStatus.exhausted;
  }

  void _emitNoMoreLive(Emitter<BrowseState> emit) {
    emit(
      state.copyWith(
        live: state.live.copyWith(
          paginationStatus: BrowsePaginationStatus.exhausted,
        ),
        feedbackType: BrowseFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _emitNoMoreVod(Emitter<BrowseState> emit) {
    emit(
      state.copyWith(
        vod: state.vod.copyWith(
          paginationStatus: BrowsePaginationStatus.exhausted,
        ),
        feedbackType: BrowseFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }
}
