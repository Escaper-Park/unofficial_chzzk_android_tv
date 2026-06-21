part of 'search_tag_results_grid_section.dart';

class _SectionStateBuilder extends StatelessWidget {
  const _SectionStateBuilder({
    required this.tab,
    required this.status,
    required this.isEmpty,
    required this.gridNode,
    required this.tabsNode,
    required this.onRetry,
    required this.child,
  });

  final SearchTagResultsTab tab;
  final SearchTagResultsLoadStatus status;
  final bool isEmpty;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      SearchTagResultsLoadStatus.initial ||
      SearchTagResultsLoadStatus.loading => ContentStateView.loading(
        message: searchTagResultsLoadingMessage(tab),
      ),
      SearchTagResultsLoadStatus.failure => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.error(
          message: searchTagResultsErrorMessage(tab),
          action: TvButton.label(
            text: SearchTagResultsScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      SearchTagResultsLoadStatus.ready when isEmpty => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.empty(
          message: searchTagResultsEmptyMessage(tab),
          action: TvButton.label(
            text: SearchTagResultsScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      SearchTagResultsLoadStatus.ready => child,
    };
  }
}

class _FocusableStateView extends StatelessWidget {
  const _FocusableStateView({
    required this.gridNode,
    required this.tabsNode,
    required this.child,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: gridNode,
      up: tabsNode,
      child: child,
    );
  }
}
