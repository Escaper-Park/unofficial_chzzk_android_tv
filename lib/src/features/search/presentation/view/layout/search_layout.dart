import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../bloc/search_bloc.dart';
import '../../search_screen_design.dart';
import '../../search_screen_string.dart';
import '../sections/input/search_input_section.dart';
import '../sections/suggestions/search_suggestions_section.dart';

class SearchLayout extends StatelessWidget {
  const SearchLayout({
    super.key,
    required this.state,
    required this.tabsNode,
    required this.inputNode,
    required this.channelSuggestionsNode,
    required this.categorySuggestionsNode,
    required this.tagSuggestionsNode,
    required this.statusNode,
    required this.keyboardNode,
    required this.onTabSelected,
    required this.onInputPressed,
    required this.onSuggestionPressed,
    required this.onRetry,
  });

  final SearchState state;
  final FocusScopeNode tabsNode;
  final FocusScopeNode inputNode;
  final FocusScopeNode channelSuggestionsNode;
  final FocusScopeNode categorySuggestionsNode;
  final FocusScopeNode tagSuggestionsNode;
  final FocusScopeNode statusNode;
  final FocusScopeNode keyboardNode;
  final ValueChanged<SearchTab> onTabSelected;
  final VoidCallback onInputPressed;
  final ValueChanged<String> onSuggestionPressed;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return TvTabbedContentLayout<SearchTab>(
      tabsNode: tabsNode,
      contentNode: inputNode,
      tabs: [
        for (final tab in SearchTab.values)
          TvTabItem(
            value: tab,
            label: SearchScreenString.tabLabel(tab),
          ),
      ],
      selectedValue: state.selectedTab,
      onTabSelected: onTabSelected,
      headerRowPadding: SearchScreenDesign.headerRowPadding,
      headerContentGap: SearchScreenDesign.headerContentGap,
      content: InputContentLayout(
        padding: EdgeInsets.zero,
        gap: SearchScreenDesign.inputContentGap,
        input: Padding(
          padding: SearchScreenDesign.inputPadding,
          child: SearchInputSection(
            state: state,
            inputNode: inputNode,
            tabsNode: tabsNode,
            downNode: _inputDownNode(state),
            onPressed: onInputPressed,
          ),
        ),
        content: SearchSuggestionsSection(
          state: state,
          inputNode: inputNode,
          channelSuggestionsNode: channelSuggestionsNode,
          categorySuggestionsNode: categorySuggestionsNode,
          tagSuggestionsNode: tagSuggestionsNode,
          statusNode: statusNode,
          onSuggestionPressed: onSuggestionPressed,
          onRetry: onRetry,
        ),
      ),
    );
  }

  FocusScopeNode? _inputDownNode(SearchState state) {
    if (state.isKeyboardOpen) {
      return keyboardNode;
    }

    if (state.selectedSuggestionStatus == SearchSuggestionStatus.failure) {
      return statusNode;
    }

    return switch (state.selectedTab) {
      SearchTab.channelCategory when state.channelSuggestions.isNotEmpty =>
        channelSuggestionsNode,
      SearchTab.channelCategory when state.categorySuggestions.isNotEmpty =>
        categorySuggestionsNode,
      SearchTab.tag when state.tagSuggestions.isNotEmpty => tagSuggestionsNode,
      _ => null,
    };
  }
}
