import 'package:flutter/material.dart';

import '../constants/styles.dart';
import './focused_outline_button.dart';

class HeaderText extends StatelessWidget {
  /// A subject title header in a screen.
  const HeaderText({
    super.key,
    required this.text,
    this.verticalPadding = 12.0,
    this.fontSize = 20.0,
    this.useShowMoreButton = false,
    this.focusNode,
    this.onPressed,
  });

  final String text;
  final double verticalPadding;
  final double fontSize;
  final bool useShowMoreButton;
  final FocusNode? focusNode;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return useShowMoreButton
        ? Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _headerText(),
              FocusedOutlineButton(
                focusNode: focusNode,
                padding: const EdgeInsets.all(5.0),
                onPressed: onPressed,
                child: const Icon(
                  Icons.arrow_forward_ios_rounded,
                  color: AppColors.whiteColor,
                ),
              )
            ],
          )
        : _headerText();
  }

  Widget _headerText() {
    return Padding(
      padding: EdgeInsets.only(
        top: verticalPadding,
        bottom: verticalPadding,
        left: 5.0,
      ),
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
