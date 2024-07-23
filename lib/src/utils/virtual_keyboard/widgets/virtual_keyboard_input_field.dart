import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../controller/virtual_keyboard_controller.dart';
import 'virtual_keyboard_cursor_pointer.dart';

class VirtualKeyboardInputField extends StatelessWidget {
  /// Virtual keyboard input textfield with [VirtualKeyboardController].
  const VirtualKeyboardInputField({
    super.key,
    this.isObscure = false,
  });

  /// Hide text when input password.
  final bool isObscure;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Consumer(
          builder: (context, ref, child) {
            final String inputText =
                ref.watch(virtualKeyboardControllerProvider);

            final int textLegnth = inputText.length;

            // If isObscure is true, show all character as * except the last character.
            final String text = textLegnth == 0
                ? ''
                : isObscure
                    ? '*' * (textLegnth - 1) + inputText[textLegnth - 1]
                    : inputText;

            // Don't use FittedBox
            return Center(
              child: Text(
                text,
                style: const TextStyle(
                  fontSize: 20.0,
                  color: AppColors.whiteColor,
                ),
              ),
            );
          },
        ),
        const VirtualKeyboardCursorPointer(),
      ],
    );
  }
}
