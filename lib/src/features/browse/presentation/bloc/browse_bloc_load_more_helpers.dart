part of 'browse_bloc.dart';

extension _BrowseBlocLoadMoreHelpers on BrowseBloc {
  Future<void> _loadMoreLive(Emitter<BrowseState> emit) async {
    final live = state.live;
    if (!_canRequestMore(live)) {
      return;
    }

    final cursor = live.cursor;
    if (cursor == null) {
      _emitNoMoreLive(emit);
      return;
    }

    emit(
      state.copyWith(
        live: live.copyWith(paginationStatus: BrowsePaginationStatus.loading),
      ),
    );

    try {
      final page = await liveRepository.getLives(
        size: BrowseBloc._pageSize,
        sortType: state.liveSortOption.sort,
        cursor: cursor,
      );
      emit(
        state.copyWith(
          live: browsePageReady<Live, LiveCursor>(
            items: [...state.live.items, ...page.items],
            cursor: page.cursor,
          ),
          feedbackType: page.cursor == null
              ? BrowseFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          live: state.live.copyWith(
            paginationStatus: BrowsePaginationStatus.failure,
          ),
        ),
      );
    }
  }

  Future<void> _loadMoreVod(Emitter<BrowseState> emit) async {
    final vod = state.vod;
    if (!_canRequestMore(vod)) {
      return;
    }

    final cursor = vod.cursor;
    if (cursor == null) {
      _emitNoMoreVod(emit);
      return;
    }

    emit(
      state.copyWith(
        vod: vod.copyWith(paginationStatus: BrowsePaginationStatus.loading),
      ),
    );

    try {
      final page = await _fetchVodPage(cursor: cursor);
      emit(
        state.copyWith(
          vod: page.copyWith(items: [...state.vod.items, ...page.items]),
          feedbackType: page.cursor == null
              ? BrowseFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          vod: state.vod.copyWith(
            paginationStatus: BrowsePaginationStatus.failure,
          ),
        ),
      );
    }
  }
}
