import 'package:flutter/material.dart';

import '../../../../common/constants/styles.dart';
import '../../../../common/widgets/focused_outline_button.dart';

class ControlIcon extends StatelessWidget {
  const ControlIcon({
    super.key,
    required this.iconData,
    required this.onPressed,
    this.label,
    this.autofocus = false,
    this.iconSize = 30.0,
    this.focusNode,
  });

  final IconData iconData;
  final VoidCallback onPressed;
  
  final String? label;
  final bool autofocus;
  final double iconSize;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlineButton(
      autofocus: autofocus,
      focusNode: focusNode,
      padding: const EdgeInsets.all(5.0),
      onPressed: onPressed,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: iconSize,
              color: AppColors.whiteColor,
            ),
            if (label != null) const SizedBox(height: 5.0),
            if (label != null)
              Text(
                label!,
                style: const TextStyle(
                  fontSize: 11.0,
                  overflow: TextOverflow.ellipsis,
                  color: AppColors.whiteColor,
                  fontWeight: FontWeight.w600,
                ),
              )
          ],
        ),
      ),
    );
  }
}
