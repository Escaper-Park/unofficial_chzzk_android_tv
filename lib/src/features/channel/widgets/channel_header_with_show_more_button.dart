import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../common/constants/enums.dart' show DpadAction;
import '../../../common/constants/styles.dart' show AppColors;
import '../../../common/widgets/dpad/dpad_widgets.dart'
    show DpadFocusScopeNavigator;
import '../../../common/widgets/ui/ui_widgets.dart'
    show FocusedOutlinedButton, HeaderText;

class ChannelHeaderWithShowMoreButton extends HookWidget {
  const ChannelHeaderWithShowMoreButton({
    super.key,
    required this.autofocus,
    required this.headerText,
    required this.leftFSN,
    required this.belowFSN,
    required this.itemNode,
    required this.aboveFSN,
    required this.pushTo,
  });

  final bool autofocus;
  final String headerText;

  /// Left
  final FocusScopeNode? leftFSN;

  /// Below
  final FocusScopeNode belowFSN;

  /// This button's [FocusScopeNode]
  final FocusScopeNode itemNode;

  /// If the streamer is broadcasting, this must be a live container.
  /// Otherwise, this must be a following button.
  final FocusScopeNode aboveFSN;

  final VoidCallback pushTo;

  @override
  Widget build(BuildContext context) {
    final showMoreButtonFN = useFocusNode();

    return Row(
      children: [
        // header text
        HeaderText(text: headerText),
        _showMoreButton(showMoreButtonFN),
      ],
    );
  }

  Widget _showMoreButton(FocusNode node) {
    return DpadFocusScopeNavigator(
      node: itemNode,
      dpadKeyNodeMap: {
        DpadAction.arrowLeft: leftFSN,
        DpadAction.arrowDown: belowFSN,
        DpadAction.arrowUp: aboveFSN,
      },
      onFocusChange: (value) {
        if (value) node.requestFocus();
      },
      child: FocusedOutlinedButton(
        autofocus: autofocus,
        padding: const EdgeInsets.all(5.0),
        borderRadius: 8.0,
        focusNode: node,
        onPressed: pushTo,
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: AppColors.whiteColor,
        ),
      ),
    );
  }
}
