import 'package:flutter/material.dart';

import '../../../../common/widgets/header_text.dart';
import '../../../../utils/virtual_keyboard/widgets/virtual_keyboard_input_field.dart';

class SearchField extends StatelessWidget {
  /// Hint and input fields.
  const SearchField({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        HeaderText(text: '검색어를 입력해주세요'),
        VirtualKeyboardInputField(),
      ],
    );
  }
}
