part of 'channel_bloc.dart';

extension _ChannelBlocLoadHelpers on ChannelBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<ChannelState> emit,
  ) {
    return _loadHome(emit);
  }

  Future<void> _onAuthStateChanged(
    _AuthStateChanged event,
    Emitter<ChannelState> emit,
  ) async {
    emit(
      state.copyWith(
        isSignedIn: event.isSignedIn,
        myInfo: event.isSignedIn ? state.myInfo : null,
      ),
    );
    await _loadHome(emit);
  }

  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<ChannelState> emit,
  ) async {
    if (event.tab == state.selectedTab) {
      return;
    }

    emit(state.copyWith(selectedTab: event.tab, groupPanel: null));
    if (event.tab == ChannelTab.vod &&
        state.vod.status == ChannelLoadStatus.initial) {
      await _loadVod(emit);
    }
  }

  Future<void> _onVodSortSelected(
    _VodSortSelected event,
    Emitter<ChannelState> emit,
  ) async {
    if (state.selectedTab == ChannelTab.vod &&
        state.vodSortOption == event.option) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: ChannelTab.vod,
        vodSortOption: event.option,
        vod: channelPageLoading<Vod>(),
        groupPanel: null,
      ),
    );
    await _loadVod(emit, emitLoading: false);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<ChannelState> emit,
  ) {
    return switch (state.selectedTab) {
      ChannelTab.home => _loadHome(emit),
      ChannelTab.vod => _loadVod(emit),
    };
  }

  Future<void> _onLoadMoreRequested(
    _LoadMoreRequested event,
    Emitter<ChannelState> emit,
  ) async {
    return _loadMoreVod(emit);
  }

  Future<void> _loadHome(Emitter<ChannelState> emit) async {
    emit(
      state.copyWith(
        profileStatus: ChannelLoadStatus.loading,
        homeStatus: ChannelLoadStatus.loading,
        groupPanel: null,
      ),
    );

    try {
      final profile = await channelRepository.getChannel(channelId: channelId);
      final myInfo = await _myInfoForSignedIn();
      final latestPage = await channelRepository.getChannelVideos(
        channelId: channelId,
        sortType: ChannelVodSortOption.latest.sort,
        page: 0,
        size: ChannelBloc._latestVodCount,
      );
      final live = await _liveFor(profile);
      final latestVods = vodsFromChannelVideos(latestPage.items, profile);

      emit(
        state.copyWith(
          isSignedIn: state.isSignedIn,
          profileStatus: ChannelLoadStatus.ready,
          profile: profile,
          myInfo: myInfo,
          homeStatus: ChannelLoadStatus.ready,
          live: live,
          latestVods: latestVods,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          profileStatus: ChannelLoadStatus.failure,
          homeStatus: ChannelLoadStatus.failure,
        ),
      );
    }
  }

  Future<void> _loadVod(
    Emitter<ChannelState> emit, {
    bool emitLoading = true,
  }) async {
    if (emitLoading) {
      emit(state.copyWith(vod: channelPageLoading<Vod>(), groupPanel: null));
    }

    try {
      final profile = await _profileForMapping(emit);
      final page = await channelRepository.getChannelVideos(
        channelId: channelId,
        sortType: state.vodSortOption.sort,
        page: 0,
        size: ChannelBloc._vodPageSize,
      );

      emit(
        state.copyWith(
          vod: channelPageReady<Vod>(
            items: vodsFromChannelVideos(page.items, profile),
            nextPage: _nextPageFor(page),
          ),
        ),
      );
    } on Object {
      emit(state.copyWith(vod: channelPageFailure<Vod>()));
    }
  }
}
