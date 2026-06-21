part of 'browse_grid_section.dart';

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

  final BrowseTab tab;
  final BrowseLoadStatus status;
  final bool isEmpty;
  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (status) {
      BrowseLoadStatus.initial ||
      BrowseLoadStatus.loading => ContentStateView.loading(
        message: browseLoadingMessage(tab),
      ),
      BrowseLoadStatus.failure => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.error(
          message: browseErrorMessage(tab),
          action: TvButton.label(
            text: BrowseScreenString.retry,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      BrowseLoadStatus.ready when isEmpty => _FocusableStateView(
        gridNode: gridNode,
        tabsNode: tabsNode,
        child: ContentStateView.empty(
          message: browseEmptyMessage(tab),
          action: TvButton.label(
            text: BrowseScreenString.retry,
            type: TvButtonType.outline,
            autofocus: true,
            onPressed: onRetry,
          ),
        ),
      ),
      BrowseLoadStatus.ready => child,
    };
  }
}

class _AuthGuidance extends StatelessWidget {
  const _AuthGuidance({
    required this.gridNode,
    required this.tabsNode,
    required this.onAuthPressed,
  });

  final FocusScopeNode gridNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onAuthPressed;

  @override
  Widget build(BuildContext context) {
    return _FocusableStateView(
      gridNode: gridNode,
      tabsNode: tabsNode,
      child: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxWidth: BrowseScreenDesign.authGuidanceMaxWidth,
          ),
          child: ContentStateView.empty(
            message:
                '${BrowseScreenString.authRequiredTitle}\n'
                '${BrowseScreenString.authRequiredMessage}',
            action: TvButton.label(
              text: BrowseScreenString.moveToAuth,
              autofocus: true,
              onPressed: onAuthPressed,
            ),
          ),
        ),
      ),
    );
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
