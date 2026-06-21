part of 'search_bloc.dart';

extension _SearchBlocSuggestionHelpers on SearchBloc {
  Future<void> _onRetryRequested(
    _RetryRequested event,
    Emitter<SearchState> emit,
  ) {
    return _loadSelectedTabSuggestions(emit);
  }

  Future<void> _loadSelectedTabSuggestions(
    Emitter<SearchState> emit,
  ) {
    return switch (state.selectedTab) {
      SearchTab.channelCategory => _loadChannelCategorySuggestions(emit),
      SearchTab.tag => _loadTagSuggestions(emit),
    };
  }

  Future<void> _loadChannelCategorySuggestions(
    Emitter<SearchState> emit,
  ) async {
    final keyword = state.query.trim();
    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          channelCategoryStatus: SearchSuggestionStatus.initial,
          channelSuggestions: const [],
          categorySuggestions: const [],
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        channelCategoryStatus: SearchSuggestionStatus.loading,
        channelSuggestions: const [],
        categorySuggestions: const [],
      ),
    );

    try {
      final results = await Future.wait<SearchSuggestions>([
        searchRepository.fetchChannelAutoComplete(keyword: keyword),
        searchRepository.fetchCategoryAutoComplete(keyword: keyword),
      ]);
      if (emit.isDone || state.query.trim() != keyword) {
        return;
      }

      final mergedItems = _mergeChannelCategorySuggestions(
        channelKeywords: results[0].items,
        categoryKeywords: results[1].items,
      );
      emit(
        state.copyWith(
          channelCategoryStatus:
              mergedItems.channel.isEmpty && mergedItems.category.isEmpty
              ? SearchSuggestionStatus.empty
              : SearchSuggestionStatus.ready,
          channelSuggestions: mergedItems.channel,
          categorySuggestions: mergedItems.category,
        ),
      );
    } on Object {
      if (!emit.isDone && state.query.trim() == keyword) {
        emit(
          state.copyWith(
            channelCategoryStatus: SearchSuggestionStatus.failure,
            channelSuggestions: const [],
            categorySuggestions: const [],
          ),
        );
      }
    }
  }

  Future<void> _loadTagSuggestions(
    Emitter<SearchState> emit,
  ) async {
    final keyword = state.query.trim();
    if (keyword.isEmpty) {
      emit(
        state.copyWith(
          tagStatus: SearchSuggestionStatus.initial,
          tagSuggestions: const [],
        ),
      );
      return;
    }

    emit(
      state.copyWith(
        tagStatus: SearchSuggestionStatus.loading,
        tagSuggestions: const [],
      ),
    );

    try {
      final suggestions = await searchRepository.fetchTagAutoComplete(
        keyword: keyword,
      );
      if (emit.isDone || state.query.trim() != keyword) {
        return;
      }

      final items = _uniqueNonEmpty(suggestions.keywords);
      emit(
        state.copyWith(
          tagStatus: items.isEmpty
              ? SearchSuggestionStatus.empty
              : SearchSuggestionStatus.ready,
          tagSuggestions: items,
        ),
      );
    } on Object {
      if (!emit.isDone && state.query.trim() == keyword) {
        emit(
          state.copyWith(
            tagStatus: SearchSuggestionStatus.failure,
            tagSuggestions: const [],
          ),
        );
      }
    }
  }
}

({List<String> channel, List<String> category})
_mergeChannelCategorySuggestions({
  required List<String> channelKeywords,
  required List<String> categoryKeywords,
}) {
  final seen = <String>{};
  final channel = <String>[];
  final category = <String>[];

  void addKeyword(String value, List<String> target) {
    final keyword = value.trim();
    if (keyword.isEmpty || !seen.add(keyword)) {
      return;
    }

    target.add(keyword);
  }

  for (final keyword in channelKeywords) {
    addKeyword(keyword, channel);
  }
  for (final keyword in categoryKeywords) {
    addKeyword(keyword, category);
  }

  return (channel: channel, category: category);
}

List<String> _uniqueNonEmpty(List<String> values) {
  final seen = <String>{};
  final items = <String>[];

  for (final value in values) {
    final item = value.trim();
    if (item.isEmpty || !seen.add(item)) {
      continue;
    }

    items.add(item);
  }

  return items;
}
