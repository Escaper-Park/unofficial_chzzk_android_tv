import 'package:flutter/material.dart';

import '../../constants/styles.dart' show AppColors;

class HeaderText extends StatelessWidget {
  /// Show text highlighted in bold.
  const HeaderText({
    super.key,
    this.verticalPadding = 10.0,
    this.horizontalPadding = 0.0,
    this.fontSize = 20.0,
    this.fontColor = AppColors.whiteColor,
    this.overflow = TextOverflow.ellipsis,
    required this.text,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Color fontColor;
  final TextOverflow overflow;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: horizontalPadding,
        vertical: verticalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: FontWeight.w600,
          overflow: overflow,
        ),
      ),
    );
  }
}
