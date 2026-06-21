part of 'category_detail_bloc.dart';

extension _CategoryDetailBlocLoadHelpers on CategoryDetailBloc {
  Future<void> _loadSelectedTab(
    Emitter<CategoryDetailState> emit, {
    bool refreshInfo = false,
  }) {
    return switch (state.selectedTab) {
      CategoryDetailTab.live => _loadLive(emit, refreshInfo: refreshInfo),
      CategoryDetailTab.vod => _loadVod(emit, refreshInfo: refreshInfo),
    };
  }

  Future<void> _loadLive(
    Emitter<CategoryDetailState> emit, {
    bool refreshInfo = false,
  }) async {
    final key = _currentRequestKey();
    final requestSerial = _nextLiveRequestSerial();
    if (!_hasCategory(key)) {
      emit(
        state.copyWith(
          live: categoryDetailPageFailure<CategoryLive, CategoryLiveCursor>(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        live: categoryDetailPageLoading<CategoryLive, CategoryLiveCursor>(),
      ),
    );

    try {
      await _loadInfoIfNeeded(emit, refresh: refreshInfo, key: key);
      if (!_isCurrentLiveRequest(emit, requestSerial, key)) {
        return;
      }

      final page = await repository.fetchCategoryLives(
        categoryType: key.categoryType,
        categoryId: key.categoryId,
      );
      if (!_isCurrentLiveRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          live: categoryDetailPageReady<CategoryLive, CategoryLiveCursor>(
            items: page.items,
            cursor: page.cursor,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentLiveRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          live: categoryDetailPageFailure<CategoryLive, CategoryLiveCursor>(),
        ),
      );
    }
  }

  Future<void> _loadVod(
    Emitter<CategoryDetailState> emit, {
    bool refreshInfo = false,
  }) async {
    final key = _currentRequestKey();
    final requestSerial = _nextVodRequestSerial();
    if (!_hasCategory(key)) {
      emit(
        state.copyWith(
          vod: categoryDetailPageFailure<CategoryVideo, CategoryVideoCursor>(),
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        vod: categoryDetailPageLoading<CategoryVideo, CategoryVideoCursor>(),
      ),
    );

    try {
      await _loadInfoIfNeeded(emit, refresh: refreshInfo, key: key);
      if (!_isCurrentVodRequest(emit, requestSerial, key)) {
        return;
      }

      final page = await repository.fetchCategoryVideos(
        categoryType: key.categoryType,
        categoryId: key.categoryId,
      );
      if (!_isCurrentVodRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          vod: categoryDetailPageReady<CategoryVideo, CategoryVideoCursor>(
            items: page.items,
            cursor: page.cursor,
          ),
        ),
      );
    } on Object {
      if (!_isCurrentVodRequest(emit, requestSerial, key)) {
        return;
      }

      emit(
        state.copyWith(
          vod: categoryDetailPageFailure<CategoryVideo, CategoryVideoCursor>(),
        ),
      );
    }
  }
}
