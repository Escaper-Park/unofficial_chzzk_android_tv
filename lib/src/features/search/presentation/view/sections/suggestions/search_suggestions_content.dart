part of 'search_suggestions_section.dart';

class _ReadySuggestions extends StatelessWidget {
  const _ReadySuggestions({
    required this.state,
    required this.inputNode,
    required this.channelSuggestionsNode,
    required this.categorySuggestionsNode,
    required this.tagSuggestionsNode,
    required this.onSuggestionPressed,
  });

  final SearchState state;
  final FocusScopeNode inputNode;
  final FocusScopeNode channelSuggestionsNode;
  final FocusScopeNode categorySuggestionsNode;
  final FocusScopeNode tagSuggestionsNode;
  final ValueChanged<String> onSuggestionPressed;

  @override
  Widget build(BuildContext context) {
    return switch (state.selectedTab) {
      SearchTab.channelCategory => _ChannelCategorySuggestions(
        state: state,
        inputNode: inputNode,
        channelSuggestionsNode: channelSuggestionsNode,
        categorySuggestionsNode: categorySuggestionsNode,
        onSuggestionPressed: onSuggestionPressed,
      ),
      SearchTab.tag => SearchSuggestionRail(
        title: SearchScreenString.tagRailTitle,
        icon: Icons.tag_rounded,
        node: tagSuggestionsNode,
        items: state.tagSuggestions,
        upNode: inputNode,
        downNode: null,
        onPressed: onSuggestionPressed,
      ),
    };
  }
}

class _ChannelCategorySuggestions extends StatelessWidget {
  const _ChannelCategorySuggestions({
    required this.state,
    required this.inputNode,
    required this.channelSuggestionsNode,
    required this.categorySuggestionsNode,
    required this.onSuggestionPressed,
  });

  final SearchState state;
  final FocusScopeNode inputNode;
  final FocusScopeNode channelSuggestionsNode;
  final FocusScopeNode categorySuggestionsNode;
  final ValueChanged<String> onSuggestionPressed;

  @override
  Widget build(BuildContext context) {
    final hasChannelSuggestions = state.channelSuggestions.isNotEmpty;
    final hasCategorySuggestions = state.categorySuggestions.isNotEmpty;

    return SingleChildScrollView(
      clipBehavior: Clip.none,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (hasChannelSuggestions)
            SearchSuggestionRail(
              title: SearchScreenString.channelRailTitle,
              icon: Icons.person_search_rounded,
              node: channelSuggestionsNode,
              items: state.channelSuggestions,
              upNode: inputNode,
              downNode: hasCategorySuggestions ? categorySuggestionsNode : null,
              onPressed: onSuggestionPressed,
            ),
          if (hasChannelSuggestions && hasCategorySuggestions)
            const SizedBox(height: SearchScreenDesign.railSectionGap),
          if (hasCategorySuggestions)
            SearchSuggestionRail(
              title: SearchScreenString.categoryRailTitle,
              icon: Icons.grid_view_rounded,
              node: categorySuggestionsNode,
              items: state.categorySuggestions,
              upNode: hasChannelSuggestions
                  ? channelSuggestionsNode
                  : inputNode,
              downNode: null,
              onPressed: onSuggestionPressed,
            ),
        ],
      ),
    );
  }
}
