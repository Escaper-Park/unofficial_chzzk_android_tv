import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../common/constants/enums.dart' show KeyboardLanguage;
import '../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../utils/virtual_keyboard/virtual_keyboard.dart'
    show VirtualKeyboardLayout;

class SearchKeyboard extends StatelessWidget {
  const SearchKeyboard({
    super.key,
    required this.routeName,
    required this.keyboardFSN,
    required this.autoCompleteFSN,
    required this.onNormalKeyPressed,
    required this.onEnterPressed,
  });

  final String routeName;
  final FocusScopeNode keyboardFSN;
  final FocusScopeNode autoCompleteFSN;
  final Future<void> Function(String keyword) onNormalKeyPressed;
  final void Function(String keyword) onEnterPressed;

  @override
  Widget build(BuildContext context) {
    return VirtualKeyboardLayout(
      routeName: routeName,
      bindings: (index) => _getBindingsForPosition(index),
      keyboardFSN: keyboardFSN,
      initialLanguage: KeyboardLanguage.korean,
      enterKeyName: '검색',
      onNormalKeyPressed: (inputText) => onNormalKeyPressed(inputText),
      onEnterPressed: (inputText) => onEnterPressed(inputText),
    );
  }

  ShortcutsBindings _getBindingsForPosition(int index) {
    ShortcutsBindings bindings = {};
    final bool isRightColumn = index % 12 == 11;

    if (isRightColumn) {
      bindings[const SingleActivator(LogicalKeyboardKey.arrowRight)] = () {
        autoCompleteFSN.requestFocus();
      };
    }
    return bindings;
  }
}
