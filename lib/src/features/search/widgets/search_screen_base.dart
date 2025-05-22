import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/widgets/ui/ui_widgets.dart' show HeaderText;
import '../../../utils/virtual_keyboard/virtual_keyboard.dart'
    show VirtualKeyboardInputField;
import 'search_widgets.dart';

class SearchScreenBase extends StatelessWidget {
  const SearchScreenBase({
    super.key,
    required this.routeName,
    required this.getAsyncAutoComplete,
    required this.headerText,
    required this.keyboardFSN,
    required this.autoCompleteFSN,
    required this.onNormalKeyPressed,
    required this.onPressedAutoComplete,
    required this.onEnterPressed,
  });

  final String routeName;
  final AsyncValue<List<String>> Function(WidgetRef ref) getAsyncAutoComplete;

  final String headerText;
  final FocusScopeNode keyboardFSN;
  final FocusScopeNode autoCompleteFSN;

  final Future<void> Function(String keyword) onNormalKeyPressed;
  final Function(String? keyword) onPressedAutoComplete;
  final void Function(String keyword) onEnterPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: SearchBody(
        searchHeader: HeaderText(text: headerText),
        searchField: VirtualKeyboardInputField(isObscure: false, routeName: routeName,),
        keyboard: SearchKeyboard(
          routeName: routeName,
          keyboardFSN: keyboardFSN,
          autoCompleteFSN: autoCompleteFSN,
          onNormalKeyPressed: onNormalKeyPressed,
          onEnterPressed: (keyword) => onEnterPressed(keyword),
          
        ),
        autoComplete: Consumer(
          builder: (BuildContext context, WidgetRef ref, Widget? child) {
            final asyncAutoComplete = getAsyncAutoComplete(ref);
      
            return AutoCompleteList(
              asyncAutoComplete: asyncAutoComplete,
              itemNode: autoCompleteFSN,
              keyboardFSN: keyboardFSN,
              onPressed: onPressedAutoComplete,
            );
          },
        ),
      ),
    );
  }
}
