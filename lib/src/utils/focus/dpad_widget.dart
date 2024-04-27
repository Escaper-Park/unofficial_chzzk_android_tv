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
    this.margin = EdgeInsets.zero,
    this.focusNode,
    this.useKeyRepeatEvent = false,
  });

  final Map<DpadAction, VoidCallback?> actionCallbacks;
  final Widget child;
  final bool autofocus;
  final bool useFocusedBorder;
  final double borderRadius;
  final bool useKeyUpEvent;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final FocusNode? focusNode;

  final bool useKeyRepeatEvent;

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

    return KeyboardListener(
      autofocus: autofocus,
      focusNode: widgetFocusNode,
      onKeyEvent: (event) {
        if ((!useKeyUpEvent && event is KeyDownEvent) ||
            (useKeyUpEvent && event is KeyUpEvent)) {
          _onkeyEvent(context, event);
        }

        // key pressed
        if (useKeyRepeatEvent && event is KeyRepeatEvent) {
          _onkeyEvent(context, event);
        }
      },
      child: useFocusedBorder
          ? Container(
              margin: margin,
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

  void _onkeyEvent(BuildContext context, KeyEvent event) {
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
