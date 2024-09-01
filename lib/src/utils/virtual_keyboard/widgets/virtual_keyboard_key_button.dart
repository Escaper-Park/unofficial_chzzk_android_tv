import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/center_widgets.dart';
import '../../../common/widgets/rounded_container.dart';
import '../../../common/widgets/focused_widget.dart';

class VirtualKeyboardKeyButton extends StatelessWidget {
  const VirtualKeyboardKeyButton({
    super.key,
    this.autofocus = false,
    this.focusNode,
    this.fontColor = AppColors.whiteColor,
    this.fontSize = 14.0,
    this.borderRadius = 12.0,
    this.borderColor = AppColors.whiteColor,
    required this.keyboardKey,
    required this.onPressed,
  });

  final bool autofocus;
  final FocusNode? focusNode;
  final Color fontColor;
  final double fontSize;
  final double borderRadius;
  final Color borderColor;

  /// A character or a function.
  final String keyboardKey;

  /// Add a character to [VirtualKeyboardController] or do something.
  final Function(String keyboardKey) onPressed;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      borderRadius: borderRadius,
      onPressed: () {
        onPressed(keyboardKey);
      },
      child: (_) => RoundedContainer(
        borderRadius: borderRadius,
        borderColor: borderColor,
        padding: const EdgeInsets.all(5.0),
        child: CenteredText(
          text: keyboardKey,
          fontColor: fontColor,
          fontSize: fontSize,
          overflow: TextOverflow.clip,
        ),
      ),
    );
  }
}
