import 'package:flutter/widgets.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/tv/keyboard/keyboard.dart';
import '../../../group_screen_design.dart';

class GroupKeyboardOverlay extends StatelessWidget {
  const GroupKeyboardOverlay({
    super.key,
    required this.sectionNode,
    required this.cubit,
  });

  final FocusScopeNode sectionNode;
  final TvKeyboardCubit cubit;

  @override
  Widget build(BuildContext context) {
    return Positioned(
      left: 0,
      right: 0,
      bottom: GroupScreenDesign.keyboardBottom,
      child: Center(
        child: TvFocusSection(
          node: sectionNode,
          child: TvKeyboard(
            cubit: cubit,
            initialFocusIndex: GroupScreenDesign.keyboardInitialFocusIndex,
          ),
        ),
      ),
    );
  }
}
