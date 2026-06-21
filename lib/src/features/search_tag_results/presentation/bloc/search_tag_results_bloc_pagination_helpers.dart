part of 'search_tag_results_bloc.dart';

extension _SearchTagResultsBlocPaginationHelpers on SearchTagResultsBloc {
  Future<void> _loadMoreLive(Emitter<SearchTagResultsState> emit) async {
    final live = state.live;
    if (!_canRequestMore(live)) {
      return;
    }

    final cursor = live.cursor;
    if (cursor == null) {
      _emitNoMoreLive(emit);
      return;
    }

    final tag = state.tag;
    final sortOption = state.liveSortOption;
    final requestSerial = _nextLiveRequestSerial();
    emit(
      state.copyWith(
        live: live.copyWith(
          paginationStatus: SearchTagResultsPaginationStatus.loading,
        ),
      ),
    );

    try {
      final page = await repository.searchTagLives(
        tag: tag,
        size: SearchTagResultsBloc._pageSize,
        sortType: sortOption.sort,
        cursor: cursor,
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
            items: [...live.items, ...page.items],
            cursor: page.cursor,
          ),
          feedbackType: page.cursor == null
              ? SearchTagResultsFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
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
          live: state.live.copyWith(
            paginationStatus: SearchTagResultsPaginationStatus.failure,
          ),
        ),
      );
    }
  }

  Future<void> _loadMoreVod(Emitter<SearchTagResultsState> emit) async {
    final vod = state.vod;
    if (!_canRequestMore(vod)) {
      return;
    }

    final cursor = vod.cursor;
    if (cursor == null) {
      _emitNoMoreVod(emit);
      return;
    }

    final tag = state.tag;
    final sortOption = state.vodSortOption;
    final requestSerial = _nextVodRequestSerial();
    emit(
      state.copyWith(
        vod: vod.copyWith(
          paginationStatus: SearchTagResultsPaginationStatus.loading,
        ),
      ),
    );

    try {
      final page = await repository.searchTagVideos(
        tag: tag,
        size: SearchTagResultsBloc._pageSize,
        sortType: sortOption.sort,
        cursor: cursor,
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
            items: [...vod.items, ...page.items],
            cursor: page.cursor,
          ),
          feedbackType: page.cursor == null
              ? SearchTagResultsFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
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
          vod: state.vod.copyWith(
            paginationStatus: SearchTagResultsPaginationStatus.failure,
          ),
        ),
      );
    }
  }
}
