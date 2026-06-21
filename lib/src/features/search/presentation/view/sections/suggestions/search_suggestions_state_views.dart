part of 'search_suggestions_section.dart';

class _SuggestionFailure extends StatelessWidget {
  const _SuggestionFailure({
    required this.statusNode,
    required this.inputNode,
    required this.onRetry,
  });

  final FocusScopeNode statusNode;
  final FocusScopeNode inputNode;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: statusNode,
      up: inputNode,
      child: ContentStateView.error(
        message: SearchScreenString.suggestionError,
        action: TvButton.label(
          text: SearchScreenString.retry,
          onPressed: onRetry,
        ),
      ),
    );
  }
}
