import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvTagType {
  filled,
  outlined,
}

enum TvTagSize {
  small,
  medium,
  large,
}

class TvTag extends StatelessWidget {
  const TvTag({
    super.key,
    required this.text,
    this.type = TvTagType.filled,
    this.size = TvTagSize.small,
    this.backgroundColor,
    this.textColor,
    this.borderColor,
    this.borderRadius,
  });

  final String text;
  final TvTagType type;
  final TvTagSize size;
  final Color? backgroundColor;
  final Color? textColor;
  final Color? borderColor;
  final BorderRadiusGeometry? borderRadius;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final values = TvTagDesign.resolve(size);
    final isOutlined = type == TvTagType.outlined;

    return SizedBox(
      height: values.height,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: isOutlined
              ? Colors.transparent
              : backgroundColor ?? colorScheme.surfaceContainerHighest,
          borderRadius: borderRadius ?? TvRadius.sm.borderRadius,
          border: Border.all(
            color: isOutlined
                ? borderColor ?? colorScheme.outline
                : Colors.transparent,
            width: 1,
          ),
        ),
        child: Padding(
          padding: values.padding,
          child: Align(
            widthFactor: 1,
            heightFactor: 1,
            child: Text(
              text,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              style:
                  (values.textStyle(Theme.of(context).textTheme) ??
                          const TextStyle())
                      .copyWith(color: textColor ?? colorScheme.onSurface),
            ),
          ),
        ),
      ),
    );
  }
}

class TvTagsRow extends StatelessWidget {
  const TvTagsRow({
    super.key,
    required this.tags,
    this.size = TvTagSize.small,
  });

  final List<Widget> tags;
  final TvTagSize size;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: TvTagDesign.rowGap(size),
      children: tags,
    );
  }
}

final class TvTagDesign {
  const TvTagDesign({
    required this.height,
    required this.padding,
    required this.textStyle,
  });

  final double height;
  final EdgeInsetsGeometry padding;
  final TextStyle? Function(TextTheme textTheme) textStyle;

  static TvTagDesign resolve(TvTagSize size) {
    return switch (size) {
      TvTagSize.small => TvTagDesign(
        height: 20,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        textStyle: (textTheme) => textTheme.labelSmall,
      ),
      TvTagSize.medium => TvTagDesign(
        height: 24,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        textStyle: (textTheme) => textTheme.labelSmall,
      ),
      TvTagSize.large => TvTagDesign(
        height: 40,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        textStyle: (textTheme) => textTheme.labelLarge,
      ),
    };
  }

  static double rowGap(TvTagSize size) {
    return switch (size) {
      TvTagSize.small => 4,
      TvTagSize.medium => 4,
      TvTagSize.large => 8,
    };
  }
}
