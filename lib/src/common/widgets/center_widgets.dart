import 'package:flutter/material.dart';

import '../constants/styles.dart';

class CenteredText extends StatelessWidget {
  /// Text that is displayed in the center with FittedBox to scale down
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

  /// The default value is set to [FontWeight.w600] because being in the
  /// center means this is usually important text.
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
