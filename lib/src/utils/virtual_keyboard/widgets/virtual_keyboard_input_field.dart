import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart' show AppColors;
import '../controller/virtual_keyboard_controller.dart'
    show VirtualKeyboardState;
import 'virtual_keyboard_cursor_pointer.dart' show VirtualKeyboardCursorPointer;

class VirtualKeyboardInputField extends ConsumerWidget
    with VirtualKeyboardState {
  /// Virtual keyboard text input field with virtual keyboard controller.
  ///
  /// See the [VirutalKeyboardController] in the controller directory.
  const VirtualKeyboardInputField({
    super.key,
    required this.routeName,
    this.isObscure = false,
  });

  final String routeName;

  /// Hide text when input password.
  final bool isObscure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String inputText = currentInputText(ref, routeName);
    final int textLength = inputText.length;

    // If isObscure is true, show all character as * except the last one.
    final String replacedText = textLength == 0
        ? ''
        : isObscure
            ? '*' * (textLength - 1) + inputText[textLength - 1]
            : inputText;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // text
        _textWidget(replacedText),
        // cursor
        const VirtualKeyboardCursorPointer(),
      ],
    );
  }

  // Don't use FittedBox!
  Widget _textWidget(String text) {
    return Center(
      child: Text(
        text,
        style: const TextStyle(
          fontSize: 20.0,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
