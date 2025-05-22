import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/ui/ui_widgets.dart'
    show FocusedOutlinedButton, CenteredText;

class VirtualKeyboardKey extends StatelessWidget {
  /// A keyboard key button with the focused outline.
  const VirtualKeyboardKey({
    super.key,
    this.autofocus = false,
    this.padding = const EdgeInsets.all(5.0),
    this.fontColor = AppColors.whiteColor,
    this.fontSize = 14.0,
    this.borderRadius = 12.0,
    this.borderColor = AppColors.whiteColor,
    required this.keyboardKey,
    required this.onPressed,
  });

  final bool autofocus;
  final EdgeInsetsGeometry padding;
  final Color fontColor;
  final double fontSize;
  final double borderRadius;
  final Color borderColor;

  /// A character or a function such as Enter, Backspace, etc.
  final String keyboardKey;

  /// Add a character to the [VirtualKeyboardController] or do actions.
  final Function(String keyboardKey) onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      borderRadius: borderRadius,
      padding: padding,
      onPressed: () {
        onPressed(keyboardKey);
      },
      child: CenteredText(
        text: keyboardKey,
        fontColor: fontColor,
        fontSize: fontSize,
        overflow: TextOverflow.clip,
      ),
    );
  }
}
