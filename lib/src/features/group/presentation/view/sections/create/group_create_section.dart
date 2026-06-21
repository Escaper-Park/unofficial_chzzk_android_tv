import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../group_screen_design.dart';
import '../../../group_screen_string.dart';

class GroupCreateSection extends StatelessWidget {
  const GroupCreateSection({
    super.key,
    required this.createNode,
    required this.tabsNode,
    required this.keyboardNode,
    required this.value,
    required this.isKeyboardOpen,
    required this.onInputPressed,
  });

  final FocusScopeNode createNode;
  final FocusScopeNode tabsNode;
  final FocusScopeNode keyboardNode;
  final String value;
  final bool isKeyboardOpen;
  final VoidCallback onInputPressed;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: createNode,
      up: tabsNode,
      down: isKeyboardOpen ? keyboardNode : null,
      child: InputContentLayout(
        padding: EdgeInsets.zero,
        gap: 0,
        input: Padding(
          padding: GroupScreenDesign.createInputPadding,
          child: TvTextField(
            value: value,
            hintText: GroupScreenString.createInputHint,
            active: isKeyboardOpen,
            autofocus: !isKeyboardOpen,
            design: GroupScreenDesign.createInputDesign(),
            onPressed: onInputPressed,
          ),
        ),
        content: const SizedBox.shrink(),
      ),
    );
  }
}
