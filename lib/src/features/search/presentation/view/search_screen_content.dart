part of 'search_screen.dart';

Widget _searchScreenContent({
  required SearchBloc searchBloc,
  required SearchState state,
  required FocusScopeNode tabsNode,
  required FocusScopeNode inputNode,
  required FocusScopeNode channelSuggestionsNode,
  required FocusScopeNode categorySuggestionsNode,
  required FocusScopeNode tagSuggestionsNode,
  required FocusScopeNode statusNode,
  required FocusScopeNode keyboardNode,
  required TvKeyboardCubit? keyboardCubit,
}) {
  return Stack(
    children: [
      SearchLayout(
        state: state,
        tabsNode: tabsNode,
        inputNode: inputNode,
        channelSuggestionsNode: channelSuggestionsNode,
        categorySuggestionsNode: categorySuggestionsNode,
        tagSuggestionsNode: tagSuggestionsNode,
        statusNode: statusNode,
        keyboardNode: keyboardNode,
        onTabSelected: (tab) {
          searchBloc.add(SearchEvent.tabSelected(tab));
        },
        onInputPressed: () {
          searchBloc.add(const SearchEvent.inputSelected());
        },
        onSuggestionPressed: (value) {
          searchBloc.add(SearchEvent.suggestionSelected(value));
        },
        onRetry: () {
          searchBloc.add(const SearchEvent.retryRequested());
        },
      ),
      if (state.isKeyboardOpen && keyboardCubit != null)
        SearchKeyboardOverlay(
          sectionNode: keyboardNode,
          cubit: keyboardCubit,
        ),
    ],
  );
}
