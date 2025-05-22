import 'package:flutter/material.dart';

import '../../constants/styles.dart' show AppColors;

class CenteredText extends StatelessWidget {
  /// Text that is diplayed in the center with [FittedBox] to scale down
  /// when the child widget overflows.
  const CenteredText({
    super.key,
    required this.text,
    this.fontSize = 14.0,
    this.fontColor = AppColors.whiteColor,
    this.fontWeight = FontWeight.w600,
    this.overflow = TextOverflow.fade,
  });

  final String text;
  final double fontSize;
  final Color fontColor;
  final FontWeight fontWeight;
  final TextOverflow overflow;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: FittedBox(
        fit: BoxFit.scaleDown,
        child: Text(
          text,
          style: TextStyle(
            fontSize: fontSize,
            fontWeight: fontWeight,
            color: fontColor,
            overflow: overflow,
          ),
        ),
      ),
    );
  }
}
