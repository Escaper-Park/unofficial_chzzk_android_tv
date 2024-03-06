import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../common/constants/styles.dart';

enum DpadAction {
  arrowUp,
  arrowDown,
  arrowLeft,
  arrowRight,
  select,
  goBack,
}

class DpadWidget extends HookWidget {
  const DpadWidget({
    super.key,
    required this.actionCallbacks,
    required this.child,
    this.autofocus = false,
    this.useFocusedBorder = false,
    this.borderRadius = 10.0,
    this.useKeyUpEvent = false,
    this.padding = EdgeInsets.zero,
    this.focusNode,
  });

  final Map<DpadAction, VoidCallback?> actionCallbacks;
  final Widget child;
  final bool autofocus;
  final bool useFocusedBorder;
  final double borderRadius;
  final bool useKeyUpEvent;
  final EdgeInsetsGeometry padding;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    final widgetFocusNode = focusNode ?? useFocusNode();
    final focusState = useState<bool>(widgetFocusNode.hasFocus);

    useEffect(() {
      widgetFocusNode.addListener(() {
        if (context.mounted) {
          focusState.value = widgetFocusNode.hasFocus;
        }
      });
      return null;
    }, [widgetFocusNode]);

    return RawKeyboardListener(
      autofocus: autofocus,
      focusNode: widgetFocusNode,
      onKey: (event) {
        if ((!useKeyUpEvent && event is RawKeyDownEvent) ||
            (useKeyUpEvent && event is RawKeyUpEvent)) {
          onkeyEvent(context, event);
        }
      },
      child: useFocusedBorder
          ? Container(
              padding: padding,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 2.0,
                  color: focusState.value
                      ? AppColors.chzzkColor
                      : Colors.transparent,
                ),
                borderRadius: BorderRadius.circular(borderRadius),
              ),
              child: child,
            )
          : child,
    );
  }

  void onkeyEvent(BuildContext context, RawKeyEvent event) {
    final String keyLabel = event.logicalKey.keyLabel;

    switch (keyLabel) {
      case "Arrow Up": // up
        actionCallbacks[DpadAction.arrowUp]?.call();
      case "Arrow Down": // down
        actionCallbacks[DpadAction.arrowDown]?.call();
      case 'Arrow Left': // left
        actionCallbacks[DpadAction.arrowLeft]?.call();
      case "Arrow Right": // right
        actionCallbacks[DpadAction.arrowRight]?.call();
      case "Select": // ok
        actionCallbacks[DpadAction.select]?.call();
      case "Go Back": // back
        actionCallbacks[DpadAction.goBack]?.call();
      default:
    }
  }
}
