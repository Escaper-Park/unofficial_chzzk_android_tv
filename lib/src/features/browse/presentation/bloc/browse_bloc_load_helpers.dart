part of 'browse_bloc.dart';

extension _BrowseBlocLoadHelpers on BrowseBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<BrowseState> emit,
  ) async {
    emit(state.copyWith(isSignedIn: event.isSignedIn));
    await _loadSelectedTab(emit);
  }

  Future<void> _onAuthStateChanged(
    _AuthStateChanged event,
    Emitter<BrowseState> emit,
  ) async {
    emit(state.copyWith(isSignedIn: event.isSignedIn));

    if (_selectedTabRequiresAuth(state)) {
      return;
    }

    await _loadSelectedTab(emit);
  }

  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<BrowseState> emit,
  ) async {
    emit(state.copyWith(selectedTab: event.tab));
    await _loadSelectedTab(emit);
  }

  Future<void> _onLiveSortSelected(
    _LiveSortSelected event,
    Emitter<BrowseState> emit,
  ) async {
    if (state.selectedTab == BrowseTab.live &&
        state.liveSortOption == event.option) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: BrowseTab.live,
        liveSortOption: event.option,
        live: browsePageLoading<Live, LiveCursor>(),
      ),
    );
    await _loadLive(emit);
  }

  Future<void> _onVodSortSelected(
    _VodSortSelected event,
    Emitter<BrowseState> emit,
  ) async {
    if (state.selectedTab == BrowseTab.vod &&
        state.vodSortOption == event.option) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: BrowseTab.vod,
        vodSortOption: event.option,
        vod: browsePageInitial<Vod, BrowseVodCursor>(),
      ),
    );

    if (_selectedTabRequiresAuth(state)) {
      return;
    }

    await _loadVod(emit);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<BrowseState> emit,
  ) async {
    if (_selectedTabRequiresAuth(state)) {
      return;
    }

    await _loadSelectedTab(emit);
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<BrowseState> emit,
  ) async {
    if (_selectedTabRequiresAuth(state)) {
      return;
    }

    switch (state.selectedTab) {
      case BrowseTab.live:
        await _loadMoreLive(emit);
      case BrowseTab.vod:
        await _loadMoreVod(emit);
    }
  }

  Future<void> _loadSelectedTab(Emitter<BrowseState> emit) {
    if (_selectedTabRequiresAuth(state)) {
      return Future<void>.value();
    }

    return switch (state.selectedTab) {
      BrowseTab.live => _loadLive(emit),
      BrowseTab.vod => _loadVod(emit),
    };
  }

  Future<void> _loadLive(Emitter<BrowseState> emit) async {
    emit(state.copyWith(live: browsePageLoading<Live, LiveCursor>()));

    try {
      final page = await liveRepository.getLives(
        size: BrowseBloc._pageSize,
        sortType: state.liveSortOption.sort,
      );
      emit(
        state.copyWith(
          live: browsePageReady<Live, LiveCursor>(
            items: page.items,
            cursor: page.cursor,
          ),
        ),
      );
    } on Object {
      emit(state.copyWith(live: browsePageFailure<Live, LiveCursor>()));
    }
  }

  Future<void> _loadVod(Emitter<BrowseState> emit) async {
    emit(state.copyWith(vod: browsePageLoading<Vod, BrowseVodCursor>()));

    try {
      final data = await _fetchVodPage();
      emit(state.copyWith(vod: data));
    } on Object {
      emit(state.copyWith(vod: browsePageFailure<Vod, BrowseVodCursor>()));
    }
  }
}
