import 'package:flutter/material.dart';

import '../../../../common/widgets/header_text.dart';
import '../../../../utils/virtual_keyboard/widgets/virtual_keyboard_input_field.dart';

class SearchField extends StatelessWidget {
  /// Hint and input fields.
  const SearchField({
    super.key,
    required this.hintText,
  });

  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderText(text: hintText),
        const VirtualKeyboardInputField(),
      ],
    );
  }
}
