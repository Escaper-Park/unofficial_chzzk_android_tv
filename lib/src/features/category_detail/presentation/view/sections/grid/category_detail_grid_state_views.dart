part of 'category_detail_grid_section.dart';

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

  final CategoryDetailTab tab;
  final CategoryDetailLoadStatus status;
  final bool isEmpty;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      CategoryDetailLoadStatus.initial ||
      CategoryDetailLoadStatus.loading => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.loading(
          message: categoryDetailLoadingMessage(tab),
        ),
      ),
      CategoryDetailLoadStatus.failure => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.error(
          message: categoryDetailErrorMessage(tab),
          action: TvButton.label(
            text: CategoryDetailScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      CategoryDetailLoadStatus.ready when isEmpty => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.empty(
          message: categoryDetailEmptyMessage(tab),
          action: TvButton.label(
            text: CategoryDetailScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      CategoryDetailLoadStatus.ready => child,
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
