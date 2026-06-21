part of 'category_grid_card.dart';

class _CategoryInfo extends StatelessWidget {
  const _CategoryInfo({
    required this.item,
  });

  final CategoryItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      height: CategoryScreenDesign.cardInfoHeight,
      child: ColoredBox(
        color: colorScheme.surfaceContainerHighest,
        child: Padding(
          padding: CategoryScreenDesign.cardInfoPadding,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: CategoryScreenDesign.titleHeight,
                child: Text(
                  item.title,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: CategoryScreenDesign.titleTextStyle(
                    textTheme,
                    colorScheme.onSurface,
                  ),
                ),
              ),
              const SizedBox(height: CategoryScreenDesign.titleMetricsGap),
              Row(
                children: [
                  Expanded(
                    child: _CategoryMetric(
                      icon: Icons.live_tv_rounded,
                      text: formatCategoryMetricCount(item.openLiveCount),
                    ),
                  ),
                  const SizedBox(width: CategoryScreenDesign.metricGap),
                  Expanded(
                    child: _CategoryMetric(
                      icon: Icons.visibility_rounded,
                      text: formatCategoryMetricCount(
                        item.concurrentUserCount,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _CategoryMetric extends StatelessWidget {
  const _CategoryMetric({
    required this.icon,
    required this.text,
  });

  final IconData icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context).colorScheme.onSurface.withValues(
      alpha: CategoryScreenDesign.secondaryTextOpacity,
    );

    return FittedBox(
      fit: BoxFit.scaleDown,
      alignment: Alignment.centerLeft,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            icon,
            size: CategoryScreenDesign.metricIconSize,
            color: color,
          ),
          const SizedBox(width: CategoryScreenDesign.metricIconGap),
          Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: CategoryScreenDesign.metricTextStyle(
              Theme.of(context).textTheme,
              color,
            ),
          ),
        ],
      ),
    );
  }
}
