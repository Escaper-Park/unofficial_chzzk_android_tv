part of 'tv_list_item.dart';

class _TvListItemTrailing extends StatelessWidget {
  const _TvListItemTrailing({
    required this.action,
    required this.trailing,
    required this.design,
    required this.palette,
    required this.textTheme,
  });

  final String? action;
  final Widget? trailing;
  final TvListItemDesign design;
  final TvListItemPalette palette;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: design.slotGap,
      children: [
        if (action != null)
          _TvListItemText(
            text: action!,
            color: palette.action,
            style: textTheme.labelSmall,
          ),
        if (trailing != null)
          SizedBox.square(
            dimension: design.trailingSlotSize,
            child: IconTheme.merge(
              data: IconThemeData(
                size: design.trailingSlotSize,
                color: palette.trailing,
              ),
              child: Center(child: trailing),
            ),
          ),
      ],
    );
  }
}

class _TvListItemTextBlock extends StatelessWidget {
  const _TvListItemTextBlock({
    required this.title,
    required this.titleBuilder,
    required this.subtitle,
    required this.overline,
    required this.palette,
    required this.textTheme,
  });

  final String title;
  final TvListItemTitleBuilder? titleBuilder;
  final String? subtitle;
  final String? overline;
  final TvListItemPalette palette;
  final TextTheme textTheme;

  @override
  Widget build(BuildContext context) {
    final titleStyle = textTheme.titleSmall?.copyWith(color: palette.title);

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (overline != null)
          _TvListItemText(
            text: overline!,
            color: palette.overline,
            style: textTheme.labelSmall,
          ),
        if (titleBuilder == null)
          _TvListItemText(
            text: title,
            color: palette.title,
            style: textTheme.titleSmall,
          )
        else
          titleBuilder!(context, titleStyle),
        if (subtitle != null)
          _TvListItemText(
            text: subtitle!,
            color: palette.subtitle,
            style: textTheme.bodySmall,
          ),
      ],
    );
  }
}

class _TvListItemText extends StatelessWidget {
  const _TvListItemText({
    required this.text,
    required this.color,
    required this.style,
  });

  final String text;
  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style?.copyWith(color: color),
    );
  }
}
