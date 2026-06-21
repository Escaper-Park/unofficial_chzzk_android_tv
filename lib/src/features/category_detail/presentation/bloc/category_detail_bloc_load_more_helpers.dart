part of 'category_detail_bloc.dart';

extension _CategoryDetailBlocLoadMoreHelpers on CategoryDetailBloc {
  Future<void> _loadMoreLive(Emitter<CategoryDetailState> emit) async {
    final live = state.live;
    if (!_canRequestMore(live)) {
      return;
    }

    final cursor = live.cursor;
    if (cursor == null) {
      _emitNoMoreLive(emit);
      return;
    }

    final key = _currentRequestKey();
    final requestSerial = _nextLiveRequestSerial();
    emit(
      state.copyWith(
        live: live.copyWith(
          paginationStatus: CategoryDetailPaginationStatus.loading,
        ),
      ),
    );

    try {
      final page = await repository.fetchCategoryLives(
        categoryType: key.categoryType,
        categoryId: key.categoryId,
        cursor: cursor,
      );
      if (!_isCurrentLiveRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          live: categoryDetailPageReady<CategoryLive, CategoryLiveCursor>(
            items: [...live.items, ...page.items],
            cursor: page.cursor,
          ),
          feedbackType: page.cursor == null
              ? CategoryDetailFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      if (!_isCurrentLiveRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          live: state.live.copyWith(
            paginationStatus: CategoryDetailPaginationStatus.failure,
          ),
          feedbackType: CategoryDetailFeedbackType.loadMoreFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }

  Future<void> _loadMoreVod(Emitter<CategoryDetailState> emit) async {
    final vod = state.vod;
    if (!_canRequestMore(vod)) {
      return;
    }

    final cursor = vod.cursor;
    if (cursor == null) {
      _emitNoMoreVod(emit);
      return;
    }

    final key = _currentRequestKey();
    final requestSerial = _nextVodRequestSerial();
    emit(
      state.copyWith(
        vod: vod.copyWith(
          paginationStatus: CategoryDetailPaginationStatus.loading,
        ),
      ),
    );

    try {
      final page = await repository.fetchCategoryVideos(
        categoryType: key.categoryType,
        categoryId: key.categoryId,
        cursor: cursor,
      );
      if (!_isCurrentVodRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          vod: categoryDetailPageReady<CategoryVideo, CategoryVideoCursor>(
            items: [...vod.items, ...page.items],
            cursor: page.cursor,
          ),
          feedbackType: page.cursor == null
              ? CategoryDetailFeedbackType.noMoreData
              : state.feedbackType,
          feedbackSerial: page.cursor == null
              ? state.feedbackSerial + 1
              : state.feedbackSerial,
        ),
      );
    } on Object {
      if (!_isCurrentVodRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          vod: state.vod.copyWith(
            paginationStatus: CategoryDetailPaginationStatus.failure,
          ),
          feedbackType: CategoryDetailFeedbackType.loadMoreFailure,
          feedbackSerial: state.feedbackSerial + 1,
        ),
      );
    }
  }
}
