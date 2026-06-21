import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../bloc/search_bloc.dart';
import '../../../search_screen_design.dart';
import '../../../search_screen_string.dart';
import 'search_suggestion_rail.dart';

part 'search_suggestions_content.dart';
part 'search_suggestions_state_views.dart';

class SearchSuggestionsSection extends StatelessWidget {
  const SearchSuggestionsSection({
    super.key,
    required this.state,
    required this.inputNode,
    required this.channelSuggestionsNode,
    required this.categorySuggestionsNode,
    required this.tagSuggestionsNode,
    required this.statusNode,
    required this.onSuggestionPressed,
    required this.onRetry,
  });

  final SearchState state;
  final FocusScopeNode inputNode;
  final FocusScopeNode channelSuggestionsNode;
  final FocusScopeNode categorySuggestionsNode;
  final FocusScopeNode tagSuggestionsNode;
  final FocusScopeNode statusNode;
  final ValueChanged<String> onSuggestionPressed;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    if (state.query.trim().isEmpty) {
      return const SizedBox.shrink();
    }

    return switch (state.selectedSuggestionStatus) {
      SearchSuggestionStatus.initial => const SizedBox.shrink(),
      SearchSuggestionStatus.loading => const SizedBox.shrink(),
      SearchSuggestionStatus.ready => _ReadySuggestions(
        state: state,
        inputNode: inputNode,
        channelSuggestionsNode: channelSuggestionsNode,
        categorySuggestionsNode: categorySuggestionsNode,
        tagSuggestionsNode: tagSuggestionsNode,
        onSuggestionPressed: onSuggestionPressed,
      ),
      SearchSuggestionStatus.empty => const SizedBox.shrink(),
      SearchSuggestionStatus.failure => _SuggestionFailure(
        statusNode: statusNode,
        inputNode: inputNode,
        onRetry: onRetry,
      ),
    };
  }
}
