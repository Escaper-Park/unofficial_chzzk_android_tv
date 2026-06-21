part of 'following_grid_section.dart';

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

  final FollowingTab tab;
  final FollowingLoadStatus status;
  final bool isEmpty;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      FollowingLoadStatus.initial ||
      FollowingLoadStatus.loading => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: Focus(
          autofocus: true,
          child: ContentStateView.loading(
            message: followingLoadingMessage(tab),
          ),
        ),
      ),
      FollowingLoadStatus.failure => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.error(
          message: followingErrorMessage(tab),
          action: TvButton.label(
            text: FollowingScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      FollowingLoadStatus.ready when isEmpty => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.empty(
          message: followingEmptyMessage(tab),
          action: TvButton.label(
            text: FollowingScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      FollowingLoadStatus.ready => child,
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
