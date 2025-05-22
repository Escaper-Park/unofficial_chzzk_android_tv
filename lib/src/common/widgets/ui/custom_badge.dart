import 'package:flutter/material.dart';

import 'rich_icon_text.dart';
import 'ui_widgets.dart' show RoundedContainer;
import '../../constants/styles.dart' show AppColors;

export 'rich_icon_text.dart';

class CustomBadge extends StatelessWidget {
  /// A badge used in the live status, tags, etc.
  ///
  /// If you want to use Alignment, wrap this badge with [Stack] or [SizedBox] that has dimensions.
  const CustomBadge({
    super.key,
    this.alignment = Alignment.topLeft,
    this.margin = EdgeInsets.zero,
    this.horizontalPadding = 5.0,
    this.verticalPadding = 3.0,
    this.backgroundColor = AppColors.redColor,
    this.borderColor = Colors.transparent,
    this.borderRadius = 5.0,
    this.maxLines = 1,
    required this.elements,
  });

  /// Set position of this badge.
  final Alignment alignment;

  /// Empty space outside.
  final EdgeInsetsGeometry? margin;

  final double horizontalPadding;
  final double verticalPadding;

  /// Color of the container.
  final Color backgroundColor;

  final Color borderColor;
  final double borderRadius;

  /// Max lines of text.
  final int maxLines;

  final List<RichIconTextElement> elements;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: RoundedContainer(
        margin: margin,
        padding: EdgeInsets.symmetric(
          horizontal: horizontalPadding,
          vertical: verticalPadding,
        ),
        borderColor: borderColor,
        borderRadius: borderRadius,
        backgroundColor: backgroundColor,
        child: RichIconText(
          maxLines: maxLines,
          elements: elements,
        ),
      ),
    );
  }
}
