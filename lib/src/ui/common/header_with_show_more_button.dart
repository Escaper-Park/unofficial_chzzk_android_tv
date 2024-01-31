import 'package:flutter/material.dart';

import '../../constants/styles.dart';
import 'custom_outline_button.dart';
import 'header_text.dart';

class HeaderWithShowMoreButton extends StatelessWidget {
  const HeaderWithShowMoreButton({
    super.key,
    required this.headerText,
    required this.onPressed,
  });

  final String headerText;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderText(text: headerText),
        CustomOutlineButton(
          padding: const EdgeInsets.all(3.0),
          onPressed: onPressed,
          child: const Icon(
            color: AppColors.whiteColor,
            Icons.arrow_forward_ios_rounded,
          ),
        ),
      ],
    );
  }
}
