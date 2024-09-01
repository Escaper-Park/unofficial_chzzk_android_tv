import 'package:flutter/material.dart';

import '../constants/styles.dart';

class HeaderText extends StatelessWidget {
  /// A header text widget.
  const HeaderText({
    super.key,
    this.verticalPadding = 10.0,
    this.horizontalPadding = 0.0,
    this.fontSize = 20.0,
    this.fontColor = AppColors.whiteColor,
    required this.text,
  });

  final double verticalPadding;
  final double horizontalPadding;
  final double fontSize;
  final Color fontColor;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: verticalPadding,
        horizontal: horizontalPadding,
      ),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: fontColor,
          fontWeight: FontWeight.w600,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
