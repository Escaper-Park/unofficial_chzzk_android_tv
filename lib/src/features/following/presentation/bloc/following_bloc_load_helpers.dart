part of 'following_bloc.dart';

extension _FollowingBlocLoadHelpers on FollowingBloc {
  Future<void> _loadTab(
    FollowingTab tab,
    Emitter<FollowingState> emit, {
    bool emitLoading = true,
  }) {
    return switch (tab) {
      FollowingTab.live => _loadLive(emit, emitLoading: emitLoading),
      FollowingTab.vod => _loadVod(emit, emitLoading: emitLoading),
      FollowingTab.channel => _loadChannels(emit, emitLoading: emitLoading),
      FollowingTab.category => _loadCategories(emit, emitLoading: emitLoading),
    };
  }

  Future<void> _loadLive(
    Emitter<FollowingState> emit, {
    bool emitLoading = true,
  }) async {
    final requestSerial = ++_liveRequestSerial;
    final sortOption = state.liveSortOption;
    if (emitLoading) {
      emit(state.copyWith(live: followingSectionLoading<Live>()));
    }

    try {
      final page = await followingRepository.fetchFollowingLives(
        sortType: sortOption.sort,
      );
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.live,
        requestSerial: requestSerial,
        liveSortOption: sortOption,
      )) {
        return;
      }

      emit(
        state.copyWith(
          live: followingSectionReady([
            for (final item in page.items) ?_liveFromFollowingChannel(item),
          ]),
        ),
      );
    } on Object {
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.live,
        requestSerial: requestSerial,
        liveSortOption: sortOption,
      )) {
        return;
      }

      emit(state.copyWith(live: followingSectionFailure<Live>()));
    }
  }

  Future<void> _loadVod(
    Emitter<FollowingState> emit, {
    bool emitLoading = true,
  }) async {
    final requestSerial = ++_vodRequestSerial;
    if (emitLoading) {
      emit(state.copyWith(vod: followingVodSectionLoading()));
    }

    try {
      final page = await vodRepository.getFollowingVods(
        size: FollowingBloc._vodPageSize,
      );
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.vod,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(
        state.copyWith(
          vod: FollowingVodSectionData(
            status: FollowingLoadStatus.ready,
            items: page.items,
            cursor: page.cursor,
            paginationStatus: page.cursor == null
                ? FollowingPaginationStatus.exhausted
                : FollowingPaginationStatus.idle,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.vod,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(state.copyWith(vod: followingVodSectionFailure()));
    }
  }

  Future<void> _loadChannels(
    Emitter<FollowingState> emit, {
    bool emitLoading = true,
  }) async {
    final requestSerial = ++_channelRequestSerial;
    if (emitLoading) {
      emit(
        state.copyWith(channel: followingSectionLoading<FollowingChannel>()),
      );
    }

    try {
      final page = await followingRepository.fetchFollowingChannels();
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.channel,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(
        state.copyWith(
          channel: followingSectionReady(_sortedChannels(page.items)),
        ),
      );
    } on Object {
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.channel,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(
        state.copyWith(channel: followingSectionFailure<FollowingChannel>()),
      );
    }
  }

  Future<void> _loadCategories(
    Emitter<FollowingState> emit, {
    bool emitLoading = true,
  }) async {
    final requestSerial = ++_categoryRequestSerial;
    if (emitLoading) {
      emit(state.copyWith(category: followingSectionLoading<CategoryItem>()));
    }

    try {
      final items = await categoryRepository.fetchFollowingCategories();
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.category,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(state.copyWith(category: followingSectionReady(items)));
    } on Object {
      if (!_isCurrentTabRequest(
        emit,
        tab: FollowingTab.category,
        requestSerial: requestSerial,
      )) {
        return;
      }

      emit(state.copyWith(category: followingSectionFailure<CategoryItem>()));
    }
  }
}
