import 'package:flutter/material.dart';

import '../../../constants/styles.dart';
import '../../../ui/common/custom_outline_button.dart';

class ControlIcon extends StatelessWidget {
  const ControlIcon({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.autofocus = false,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    return CustomOutlineButton(
      autofocus: autofocus,
      padding: const EdgeInsets.all(5.0),
      onPressed: onPressed,
      child: Icon(
        iconData,
        size: 30.0,
        color: AppColors.whiteColor,
      ),
    );
  }
}
