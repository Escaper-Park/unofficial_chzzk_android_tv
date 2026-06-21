part of 'search_bloc.dart';

extension _SearchBlocInputHelpers on SearchBloc {
  Future<void> _onTabSelected(
    _TabSelected event,
    Emitter<SearchState> emit,
  ) async {
    if (event.tab == state.selectedTab) {
      return;
    }

    emit(
      state.copyWith(
        selectedTab: event.tab,
        query: '',
        channelCategoryStatus: SearchSuggestionStatus.initial,
        channelSuggestions: const [],
        categorySuggestions: const [],
        tagStatus: SearchSuggestionStatus.initial,
        tagSuggestions: const [],
      ),
    );
  }

  void _onInputSelected(
    _InputSelected event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(isKeyboardOpen: true));
  }

  Future<void> _onKeyboardValueChanged(
    _KeyboardValueChanged event,
    Emitter<SearchState> emit,
  ) async {
    emit(state.copyWith(query: event.value));
    if (event.value.trim().isNotEmpty && autocompleteDebounce > Duration.zero) {
      await Future<void>.delayed(autocompleteDebounce);
      if (emit.isDone || state.query != event.value) {
        return;
      }
    }

    await _loadSelectedTabSuggestions(emit);
  }

  Future<void> _onKeyboardSubmitted(
    _KeyboardSubmitted event,
    Emitter<SearchState> emit,
  ) async {
    final query = event.value.trim();
    emit(
      state.copyWith(
        query: event.value,
        isKeyboardOpen: false,
      ),
    );

    if (query.isEmpty) {
      await _loadSelectedTabSuggestions(emit);
      return;
    }

    emit(_withNavigationRequest(state, query));
  }

  void _onKeyboardClosed(
    _KeyboardClosed event,
    Emitter<SearchState> emit,
  ) {
    emit(state.copyWith(isKeyboardOpen: false));
  }

  void _onSuggestionSelected(
    _SuggestionSelected event,
    Emitter<SearchState> emit,
  ) {
    final query = event.value.trim();
    if (query.isEmpty) {
      return;
    }

    emit(
      _withNavigationRequest(
        state.copyWith(
          query: event.value,
          isKeyboardOpen: false,
        ),
        query,
      ),
    );
  }

  SearchState _withNavigationRequest(SearchState source, String query) {
    return source.copyWith(
      navigationRequest: SearchNavigationRequest(
        target: switch (source.selectedTab) {
          SearchTab.channelCategory => SearchNavigationTarget.searchResults,
          SearchTab.tag => SearchNavigationTarget.searchTagResults,
        },
        query: query,
        serial: source.navigationSerial + 1,
      ),
      navigationSerial: source.navigationSerial + 1,
    );
  }
}
