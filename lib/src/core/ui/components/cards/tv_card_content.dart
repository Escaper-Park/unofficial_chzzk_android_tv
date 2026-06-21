part of 'tv_card.dart';

class _TvCardContentBlock extends StatelessWidget {
  const _TvCardContentBlock({
    required this.title,
    required this.subtitle,
    required this.description,
    required this.extras,
    required this.design,
    required this.alignment,
  });

  final String? title;
  final String? subtitle;
  final String? description;
  final Widget? extras;
  final TvCardDesign design;
  final CrossAxisAlignment alignment;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: alignment,
      spacing: design.contentGap,
      children: [
        if (title != null || subtitle != null)
          SizedBox(
            height: design.titleSubtitleHeight,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: alignment,
              children: [
                if (title != null)
                  _TvCardText(
                    text: title!,
                    color: colorScheme.onSurface,
                    style: textTheme.titleMedium,
                    textAlign: _textAlign,
                  ),
                if (subtitle != null)
                  _TvCardText(
                    text: subtitle!,
                    color: colorScheme.onSurface.withValues(alpha: 0.6),
                    style: textTheme.bodySmall,
                    textAlign: _textAlign,
                  ),
              ],
            ),
          ),
        if (description != null)
          _TvCardText(
            text: description!,
            color: colorScheme.onSurface.withValues(alpha: 0.8),
            style: textTheme.bodySmall,
            textAlign: _textAlign,
          ),
        if (extras != null)
          SizedBox(height: design.extrasHeight, child: extras),
      ],
    );
  }

  TextAlign get _textAlign {
    return alignment == CrossAxisAlignment.center
        ? TextAlign.center
        : TextAlign.left;
  }
}

class _TvCardText extends StatelessWidget {
  const _TvCardText({
    required this.text,
    required this.color,
    required this.style,
    required this.textAlign,
  });

  final String text;
  final Color color;
  final TextStyle? style;
  final TextAlign textAlign;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: textAlign,
      style: style?.copyWith(color: color),
    );
  }
}
