import 'package:flutter/material.dart';

import '../../../../utils/virtual_keyboard/data/virtual_keyboard_data.dart';
import '../../../../utils/virtual_keyboard/widgets/virtual_keyboard_layout.dart';

class SearchKeyboard extends StatelessWidget {
  /// Virtual keyboard for searching
  const SearchKeyboard({
    super.key,
    required this.onEnterPressed,
  });

  final dynamic Function(String input) onEnterPressed;

  @override
  Widget build(BuildContext context) {
    final keyboardLayoutWidth = MediaQuery.of(context).size.width * 0.7;

    return Center(
      child: SizedBox(
        width: keyboardLayoutWidth,
        child: VirtualKeyboardLayout(
          language: KeyboardLanguage.korean,
          onEnterPressed: onEnterPressed,
        ),
      ),
    );
  }
}
