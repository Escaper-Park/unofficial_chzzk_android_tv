part of 'category_detail_bloc.dart';

extension _CategoryDetailBlocHelpers on CategoryDetailBloc {
  Future<void> _loadInfoIfNeeded(
    Emitter<CategoryDetailState> emit, {
    required bool refresh,
    required _CategoryDetailRequestKey key,
  }) async {
    final current = state.info;
    if (current != null && !refresh) {
      return;
    }

    try {
      final info = await _fetchInfo(key);
      if (!_isCurrentCategoryRequest(emit, key)) {
        return;
      }

      emit(state.copyWith(info: info));
    } on Object {
      // Category feed remains usable when optional header/follow metadata fails.
    }
  }

  Future<CategoryInfo> _fetchInfo(_CategoryDetailRequestKey key) {
    return repository.fetchCategoryInfo(
      categoryType: key.categoryType,
      categoryId: key.categoryId,
    );
  }

  bool _canRequestMore<T, C>(CategoryDetailPageData<T, C> data) {
    return data.status == CategoryDetailLoadStatus.ready &&
        data.paginationStatus != CategoryDetailPaginationStatus.loading &&
        data.paginationStatus != CategoryDetailPaginationStatus.exhausted;
  }

  CategoryDetailPageData<dynamic, dynamic> _pageFor(CategoryDetailTab tab) {
    return switch (tab) {
      CategoryDetailTab.live => state.live,
      CategoryDetailTab.vod => state.vod,
    };
  }

  void _emitNoMoreLive(Emitter<CategoryDetailState> emit) {
    emit(
      state.copyWith(
        live: state.live.copyWith(
          paginationStatus: CategoryDetailPaginationStatus.exhausted,
        ),
        feedbackType: CategoryDetailFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _emitNoMoreVod(Emitter<CategoryDetailState> emit) {
    emit(
      state.copyWith(
        vod: state.vod.copyWith(
          paginationStatus: CategoryDetailPaginationStatus.exhausted,
        ),
        feedbackType: CategoryDetailFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  CategoryDetailState _stateWithFeedback(CategoryDetailFeedbackType type) {
    return state.copyWith(
      feedbackType: type,
      feedbackSerial: state.feedbackSerial + 1,
    );
  }

  void _invalidateFeedRequests() {
    _liveRequestSerial += 1;
    _vodRequestSerial += 1;
  }

  int _nextLiveRequestSerial() {
    return ++_liveRequestSerial;
  }

  int _nextVodRequestSerial() {
    return ++_vodRequestSerial;
  }

  _CategoryDetailRequestKey _currentRequestKey() {
    return (categoryType: state.categoryType, categoryId: state.categoryId);
  }

  bool _hasCategory(_CategoryDetailRequestKey key) {
    return key.categoryType.isNotEmpty && key.categoryId.isNotEmpty;
  }

  bool _isCurrentCategoryRequest(
    Emitter<CategoryDetailState> emit,
    _CategoryDetailRequestKey key,
  ) {
    return !emit.isDone &&
        state.categoryType == key.categoryType &&
        state.categoryId == key.categoryId;
  }

  bool _isCurrentLiveRequest(
    Emitter<CategoryDetailState> emit,
    int requestSerial,
    _CategoryDetailRequestKey key,
  ) {
    return _liveRequestSerial == requestSerial &&
        _isCurrentCategoryRequest(emit, key);
  }

  bool _isCurrentVodRequest(
    Emitter<CategoryDetailState> emit,
    int requestSerial,
    _CategoryDetailRequestKey key,
  ) {
    return _vodRequestSerial == requestSerial &&
        _isCurrentCategoryRequest(emit, key);
  }
}

typedef _CategoryDetailRequestKey = ({
  String categoryType,
  String categoryId,
});
