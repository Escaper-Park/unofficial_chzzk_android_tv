import 'package:flutter/material.dart';

import '../constants/styles.dart';
import './rounded_container.dart';

class TagBadge extends StatelessWidget {
  /// A Badge with live status, tags, etc...
  ///
  /// To use Alignment, wrap this badge with [Stack] or [SizedBox] that has dimensions.
  const TagBadge({
    super.key,
    this.alignment = Alignment.topLeft,
    this.margin = EdgeInsets.zero,
    this.backgroundColor = AppColors.redColor,
    this.opacity = 0.80,
    this.fontColor = AppColors.whiteColor,
    this.fontSize = 10.0,
    this.fontWeight = FontWeight.w500,
    required this.text,
  });

  /// Set position of this badge.
  final Alignment alignment;

  /// Empty space outside this.
  final EdgeInsetsGeometry margin;

  /// Background Color of badge.
  final Color backgroundColor;

  /// Background opacity.
  final double opacity;

  final Color fontColor;
  final double fontSize;
  final FontWeight fontWeight;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Padding(
        padding: margin,
        child: RoundedContainer(
          backgroundColor: backgroundColor.withOpacity(opacity),
          padding: const EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 8.0,
          ),
          child: Text(
            text,
            style: TextStyle(
              fontSize: fontSize,
              overflow: TextOverflow.ellipsis,
              color: fontColor,
              fontWeight: fontWeight,
            ),
          ),
        ),
      ),
    );
  }
}
