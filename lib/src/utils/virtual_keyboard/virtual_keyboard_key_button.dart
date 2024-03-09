import 'package:flutter/material.dart';

import '../../common/constants/styles.dart';
import '../../common/widgets/focused_outline_button.dart';

class VirtualKeyboardKeyButton extends StatelessWidget {
  const VirtualKeyboardKeyButton({
    super.key,
    required this.keyboardKey,
    required this.onPressed,
    this.autofocus = false,
    this.fontColor = AppColors.whiteColor,
  });

  final String keyboardKey;
  final Function(String keyboardKey) onPressed;
  final bool autofocus;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return FocusedOutlineButton(
      autofocus: autofocus,
      radius: 0.0,
      onPressed: () {
        onPressed(keyboardKey);
      },
      child: Container(
        constraints: const BoxConstraints.expand(),
        decoration: BoxDecoration(
          border: Border.all(
            color: AppColors.whiteColor,
          ),
        ),
        child: Center(
          child: Text(
            keyboardKey,
            style: TextStyle(
              color: fontColor,
              overflow: TextOverflow.clip,
            ),
          ),
        ),
      ),
    );
  }
}
