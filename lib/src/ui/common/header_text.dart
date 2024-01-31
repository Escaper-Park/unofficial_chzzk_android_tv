import 'package:flutter/material.dart';

import '../../constants/styles.dart';

class HeaderText extends StatelessWidget {
  /// A subject title header in a screen.
  const HeaderText({
    super.key,
    required this.text,
    this.verticalPadding = 12.0,
    this.fontSize = 24.0,
  });

  final String text;
  final double verticalPadding;
  final double fontSize;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Text(
        text,
        style: TextStyle(
          fontSize: fontSize,
          color: AppColors.whiteColor,
          fontWeight: FontWeight.w700,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
