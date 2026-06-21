part of 'tv_modal_panel.dart';

class _TvModalPanelSurface extends StatelessWidget {
  const _TvModalPanelSurface({
    required this.type,
    required this.header,
    required this.headerContent,
    required this.child,
  });

  final TvModalPanelType type;
  final String header;
  final Widget? headerContent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return switch (type) {
      TvModalPanelType.standard => _TvStandardModalPanel(
        header: header,
        headerContent: headerContent,
        child: child,
      ),
      TvModalPanelType.large => _TvLargeModalPanel(
        header: header,
        headerContent: headerContent,
        child: child,
      ),
    };
  }
}

class _TvStandardModalPanel extends StatelessWidget {
  const _TvStandardModalPanel({
    required this.header,
    required this.headerContent,
    required this.child,
  });

  final String header;
  final Widget? headerContent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: TvModalPanelDesign.standardMaxHeight,
      ),
      child: SizedBox(
        width: TvModalPanelDesign.standardWidth,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.surfaceContainer,
            borderRadius: TvModalPanelDesign.radius,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              _TvStandardModalPanelHeader(
                header: header,
                headerContent: headerContent,
              ),
              Padding(
                padding: TvModalPanelDesign.standardListPadding,
                child: child,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TvStandardModalPanelHeader extends StatelessWidget {
  const _TvStandardModalPanelHeader({
    required this.header,
    required this.headerContent,
  });

  final String header;
  final Widget? headerContent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme.labelMedium?.copyWith(
      color: colorScheme.inverseSurface,
    );
    final content = headerContent;

    return SizedBox(
      height: TvModalPanelDesign.standardHeaderSize.height,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: TvModalPanelDesign.standardHeaderPadding,
              child: Center(
                child: content == null
                    ? Text(
                        header,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        style: textStyle,
                      )
                    : DefaultTextStyle(
                        style: textStyle ?? DefaultTextStyle.of(context).style,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.center,
                        child: SizedBox(
                          width: double.infinity,
                          child: content,
                        ),
                      ),
              ),
            ),
          ),
          const TvListDivider(),
        ],
      ),
    );
  }
}

class _TvLargeModalPanel extends StatelessWidget {
  const _TvLargeModalPanel({
    required this.header,
    required this.headerContent,
    required this.child,
  });

  final String header;
  final Widget? headerContent;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      width: TvModalPanelDesign.largeWidth,
      height: double.infinity,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainer,
          borderRadius: TvModalPanelDesign.largeRadius,
        ),
        child: Padding(
          padding: TvModalPanelDesign.largePadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            spacing: TvModalPanelDesign.largeHeaderItemGap,
            children: [
              headerContent ??
                  Text(
                    header,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: colorScheme.onSurface,
                    ),
                  ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
