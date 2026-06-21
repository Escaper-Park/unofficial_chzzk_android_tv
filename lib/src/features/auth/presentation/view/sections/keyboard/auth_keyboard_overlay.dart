import 'package:flutter/widgets.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/tv/keyboard/keyboard.dart';
import '../../../auth_screen_design.dart';

class AuthKeyboardOverlay extends StatelessWidget {
  const AuthKeyboardOverlay({
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
      bottom: AuthScreenDesign.keyboardBottom,
      child: Center(
        child: TvFocusSection(
          node: sectionNode,
          child: TvKeyboard(
            cubit: cubit,
            initialFocusIndex: AuthScreenDesign.keyboardInitialFocusIndex,
          ),
        ),
      ),
    );
  }
}
