part of 'search_results_bloc.dart';

extension _SearchResultsBlocLoadHelpers on SearchResultsBloc {
  Future<void> _onStarted(
    _Started event,
    Emitter<SearchResultsState> emit,
  ) async {
    final query = event.query.trim();
    emit(
      state.copyWith(
        query: query,
        status: SearchResultsLoadStatus.loading,
        channels: const [],
        lives: const [],
        videos: const [],
      ),
    );
    await _load(emit);
  }

  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<SearchResultsState> emit,
  ) {
    return _load(emit);
  }

  Future<void> _load(Emitter<SearchResultsState> emit) async {
    final query = state.query;
    final requestSerial = ++_loadSerial;
    if (query.isEmpty) {
      emit(state.copyWith(status: SearchResultsLoadStatus.ready));
      return;
    }

    emit(
      state.copyWith(
        status: SearchResultsLoadStatus.loading,
        channels: const [],
        lives: const [],
        videos: const [],
      ),
    );

    final (channelLoad, liveLoad, videoLoad) = await (
      _loadSearchSection(
        () => repository.searchChannels(
          keyword: query,
          size: SearchResultsBloc._pageSize,
          withFirstChannelContent: true,
        ),
      ),
      _loadSearchSection(
        () => repository.searchLives(
          keyword: query,
          size: SearchResultsBloc._pageSize,
        ),
      ),
      _loadSearchSection(
        () => repository.searchVideos(
          keyword: query,
          size: SearchResultsBloc._pageSize,
        ),
      ),
    ).wait;

    if (!_isCurrentLoad(emit, requestSerial, query)) {
      return;
    }

    if (channelLoad.failed && liveLoad.failed && videoLoad.failed) {
      emit(
        state.copyWith(
          status: SearchResultsLoadStatus.failure,
          channels: const [],
          lives: const [],
          videos: const [],
        ),
      );
      return;
    }

    final channelItems = _displayableChannels(
      channelLoad.data?.items ?? const <SearchChannelResult>[],
    );

    emit(
      state.copyWith(
        status: SearchResultsLoadStatus.ready,
        channels: channelItems,
        lives: _mergeLiveResults(
          embeddedItems: _embeddedLiveResults(channelItems),
          resultItems: _displayableLives(
            liveLoad.data?.items ?? const <SearchLiveResult>[],
          ),
        ),
        videos: _mergeVideoResults(
          embeddedItems: _embeddedVideoResults(channelItems),
          resultItems: _displayableVideos(
            videoLoad.data?.items ?? const <SearchVideoResult>[],
          ),
        ),
      ),
    );
  }

  bool _isCurrentLoad(
    Emitter<SearchResultsState> emit,
    int requestSerial,
    String query,
  ) {
    return !emit.isDone && _loadSerial == requestSerial && state.query == query;
  }
}

Future<_SearchSectionLoad<T>> _loadSearchSection<T>(
  Future<T> Function() load,
) async {
  try {
    return _SearchSectionLoad.success(await load());
  } on Object {
    return const _SearchSectionLoad.failure();
  }
}

final class _SearchSectionLoad<T> {
  const _SearchSectionLoad.success(T this.data) : failed = false;

  const _SearchSectionLoad.failure() : data = null, failed = true;

  final T? data;
  final bool failed;
}
