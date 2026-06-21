part of 'search_tag_results_bloc.dart';

extension _SearchTagResultsBlocLoadHelpers on SearchTagResultsBloc {
  Future<void> _loadSelectedTab(Emitter<SearchTagResultsState> emit) {
    return switch (state.selectedTab) {
      SearchTagResultsTab.live => _loadLive(emit),
      SearchTagResultsTab.vod => _loadVod(emit),
    };
  }

  Future<void> _loadLive(Emitter<SearchTagResultsState> emit) async {
    final tag = state.tag;
    final sortOption = state.liveSortOption;
    final requestSerial = _nextLiveRequestSerial();
    if (tag.isEmpty) {
      emit(
        state.copyWith(
          live: searchTagResultsPageReady<SearchTagLive, SearchTagLiveCursor>(
            items: const [],
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        live: searchTagResultsPageLoading<SearchTagLive, SearchTagLiveCursor>(),
      ),
    );

    try {
      final page = await repository.searchTagLives(
        tag: tag,
        size: SearchTagResultsBloc._pageSize,
        sortType: sortOption.sort,
      );
      if (!_isCurrentLiveRequest(
        emit,
        requestSerial,
        tag: tag,
        sortOption: sortOption,
      )) {
        return;
      }

      emit(
        state.copyWith(
          live: searchTagResultsPageReady<SearchTagLive, SearchTagLiveCursor>(
            items: page.items,
            cursor: page.cursor,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentLiveRequest(
        emit,
        requestSerial,
        tag: tag,
        sortOption: sortOption,
      )) {
        return;
      }

      emit(
        state.copyWith(
          live:
              searchTagResultsPageFailure<SearchTagLive, SearchTagLiveCursor>(),
        ),
      );
    }
  }

  Future<void> _loadVod(Emitter<SearchTagResultsState> emit) async {
    final tag = state.tag;
    final sortOption = state.vodSortOption;
    final requestSerial = _nextVodRequestSerial();
    if (tag.isEmpty) {
      emit(
        state.copyWith(
          vod: searchTagResultsPageReady<SearchTagVideo, SearchTagVideoCursor>(
            items: const [],
          ),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        vod:
            searchTagResultsPageLoading<SearchTagVideo, SearchTagVideoCursor>(),
      ),
    );

    try {
      final page = await repository.searchTagVideos(
        tag: tag,
        size: SearchTagResultsBloc._pageSize,
        sortType: sortOption.sort,
      );
      if (!_isCurrentVodRequest(
        emit,
        requestSerial,
        tag: tag,
        sortOption: sortOption,
      )) {
        return;
      }

      emit(
        state.copyWith(
          vod: searchTagResultsPageReady<SearchTagVideo, SearchTagVideoCursor>(
            items: page.items,
            cursor: page.cursor,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentVodRequest(
        emit,
        requestSerial,
        tag: tag,
        sortOption: sortOption,
      )) {
        return;
      }

      emit(
        state.copyWith(
          vod:
              searchTagResultsPageFailure<
                SearchTagVideo,
                SearchTagVideoCursor
              >(),
        ),
      );
    }
  }
}
