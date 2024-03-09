import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/widgets/header_text.dart';
import '../../common/widgets/rounded_container.dart';
import './controller/virtual_keyboard_input_controller.dart';

class VirtualKeyboardInputDisplay extends ConsumerWidget {
  const VirtualKeyboardInputDisplay({
    super.key,
    required this.headerText,
    this.isObscure = false,
  });

  final String headerText;
  final bool isObscure;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String text = ref.watch(virtualKeyboardInputControllerProvider);

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(text: headerText),
        Expanded(
          child: RoundedContainer(
            child: Text(
              text.isEmpty
                  ? ''
                  : isObscure
                      // Show only the last character of the text
                      ? '*' * (text.length - 1) + text[text.length - 1]
                      : text,
            ),
          ),
        ),
      ],
    );
  }
}
