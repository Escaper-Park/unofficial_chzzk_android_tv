part of 'search_tag_results_bloc.dart';

extension _SearchTagResultsBlocHelpers on SearchTagResultsBloc {
  bool _canRequestMore<T, C>(SearchTagResultsPageData<T, C> data) {
    return data.status == SearchTagResultsLoadStatus.ready &&
        data.paginationStatus != SearchTagResultsPaginationStatus.loading &&
        data.paginationStatus != SearchTagResultsPaginationStatus.exhausted;
  }

  void _emitNoMoreLive(Emitter<SearchTagResultsState> emit) {
    emit(
      state.copyWith(
        live: state.live.copyWith(
          paginationStatus: SearchTagResultsPaginationStatus.exhausted,
        ),
        feedbackType: SearchTagResultsFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _emitNoMoreVod(Emitter<SearchTagResultsState> emit) {
    emit(
      state.copyWith(
        vod: state.vod.copyWith(
          paginationStatus: SearchTagResultsPaginationStatus.exhausted,
        ),
        feedbackType: SearchTagResultsFeedbackType.noMoreData,
        feedbackSerial: state.feedbackSerial + 1,
      ),
    );
  }

  void _invalidateSectionRequests() {
    _liveRequestSerial += 1;
    _vodRequestSerial += 1;
  }

  int _nextLiveRequestSerial() {
    return ++_liveRequestSerial;
  }

  int _nextVodRequestSerial() {
    return ++_vodRequestSerial;
  }

  bool _isCurrentLiveRequest(
    Emitter<SearchTagResultsState> emit,
    int requestSerial, {
    required String tag,
    required SearchTagResultsLiveSortOption sortOption,
  }) {
    return !emit.isDone &&
        _liveRequestSerial == requestSerial &&
        state.tag == tag &&
        state.liveSortOption == sortOption;
  }

  bool _isCurrentVodRequest(
    Emitter<SearchTagResultsState> emit,
    int requestSerial, {
    required String tag,
    required SearchTagResultsVodSortOption sortOption,
  }) {
    return !emit.isDone &&
        _vodRequestSerial == requestSerial &&
        state.tag == tag &&
        state.vodSortOption == sortOption;
  }
}

String _normalizeTag(String value) {
  var tag = value.trim();
  while (tag.startsWith('#')) {
    tag = tag.substring(1).trimLeft();
  }
  return tag;
}
