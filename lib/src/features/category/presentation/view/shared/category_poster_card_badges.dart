part of 'category_poster_card.dart';

class _CategoryNameBadge extends StatelessWidget {
  const _CategoryNameBadge({
    required this.text,
    this.badgeTextStyle,
  });

  final String text;
  final CategoryPosterBadgeTextStyle? badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    return _CategoryBadge(
      alignment: Alignment.topLeft,
      child: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: _badgeTextStyle(Theme.of(context).textTheme, badgeTextStyle),
      ),
    );
  }
}

class _CategoryMetricBadge extends StatelessWidget {
  const _CategoryMetricBadge({
    required this.openLiveCount,
    required this.concurrentUserCount,
    this.badgeTextStyle,
  });

  final int openLiveCount;
  final int concurrentUserCount;
  final CategoryPosterBadgeTextStyle? badgeTextStyle;

  @override
  Widget build(BuildContext context) {
    final style = _badgeTextStyle(Theme.of(context).textTheme, badgeTextStyle);

    return _CategoryBadge(
      alignment: Alignment.bottomRight,
      contentKey: const ValueKey('category-poster-metadata-badge'),
      fillWidth: true,
      child: Row(
        children: [
          Expanded(
            child: Align(
              key: const ValueKey('category-poster-open-live-metric-slot'),
              alignment: Alignment.centerLeft,
              child: _CategoryMetric(
                icon: Icons.live_tv_rounded,
                label: formatCategoryPosterCardGrouped(openLiveCount),
                style: style,
              ),
            ),
          ),
          Expanded(
            child: Align(
              key: const ValueKey('category-poster-viewer-metric-slot'),
              alignment: Alignment.centerRight,
              child: _CategoryMetric(
                icon: Icons.visibility_rounded,
                label: formatCategoryPosterCardGrouped(concurrentUserCount),
                style: style,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _CategoryMetric extends StatelessWidget {
  const _CategoryMetric({
    required this.icon,
    required this.label,
    required this.style,
  });

  final IconData icon;
  final String label;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      fit: BoxFit.scaleDown,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: CategoryPosterCardDesign.badgeIconSize,
            color: CategoryPosterCardDesign.badgeTextColor,
          ),
          const SizedBox(width: CategoryPosterCardDesign.badgeIconGap),
          Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: style,
          ),
        ],
      ),
    );
  }
}

class _CategoryBadge extends StatelessWidget {
  const _CategoryBadge({
    required this.alignment,
    required this.child,
    this.contentKey,
    this.fillWidth = false,
  });

  final AlignmentGeometry alignment;
  final Widget child;
  final Key? contentKey;
  final bool fillWidth;

  @override
  Widget build(BuildContext context) {
    final content = DecoratedBox(
      decoration: const BoxDecoration(
        color: CategoryPosterCardDesign.badgeBackgroundColor,
        borderRadius: CategoryPosterCardDesign.badgeRadius,
      ),
      child: Padding(
        padding: CategoryPosterCardDesign.badgePadding,
        child: child,
      ),
    );

    final contentBox = fillWidth
        ? SizedBox(
            key: contentKey,
            width: CategoryPosterCardDesign.badgeAvailableWidth,
            child: content,
          )
        : ConstrainedBox(
            key: contentKey,
            constraints: BoxConstraints(
              maxWidth: CategoryPosterCardDesign.badgeAvailableWidth,
            ),
            child: content,
          );

    if (alignment == Alignment.bottomRight) {
      return Positioned(
        right: CategoryPosterCardDesign.badgeMargin,
        bottom: CategoryPosterCardDesign.badgeMargin,
        child: contentBox,
      );
    }

    return Positioned(
      left: CategoryPosterCardDesign.badgeMargin,
      top: CategoryPosterCardDesign.badgeMargin,
      child: contentBox,
    );
  }
}

TextStyle? _badgeTextStyle(
  TextTheme textTheme,
  CategoryPosterBadgeTextStyle? override,
) {
  return override?.call(textTheme) ??
      CategoryPosterCardDesign.badgeTextStyle(textTheme);
}
