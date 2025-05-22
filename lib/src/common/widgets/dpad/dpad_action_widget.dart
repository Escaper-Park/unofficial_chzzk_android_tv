import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/enums.dart' show DpadAction;
import '../../constants/styles.dart' show AppColors;

typedef DpadActionCallbacks = Map<DpadAction, void Function()?>;

class DpadActionWidget extends HookWidget {
  /// Do action when a directional key is pressed.
  const DpadActionWidget({
    super.key,
    this.autofocus = true,
    this.focusNode,
    required this.useKeyRepeatEvent,
    required this.dpadActionCallbacks,
    this.customOnKeyEvent,
    this.useFocusedBorder = false,
    this.focusedBorderColor = AppColors.chzzkColor,
    this.borderRadius = 12.0,
    required this.child,
  });

  final bool autofocus;
  final FocusNode? focusNode;

  /// Repeat event when the button is long-pressed.
  final bool useKeyRepeatEvent;

  final DpadActionCallbacks dpadActionCallbacks;

  final void Function(KeyEvent event, DpadActionCallbacks dpadActionCallbacks)?
      customOnKeyEvent;

  final bool useFocusedBorder;

  final Color focusedBorderColor;
  final double borderRadius;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final widgetFocusNode = focusNode ?? useFocusNode();
    final focusState = useState<bool>(widgetFocusNode.hasFocus);

    useEffect(
      () {
        widgetFocusNode.addListener(() {
          if (context.mounted) focusState.value = widgetFocusNode.hasFocus;
        });
        return null;
      },
      [widgetFocusNode],
    );

    return KeyboardListener(
      autofocus: autofocus,
      focusNode: widgetFocusNode,
      onKeyEvent: customOnKeyEvent == null
          ? (KeyEvent event) {
              if (event is KeyDownEvent) {
                onKeyEvent(event, dpadActionCallbacks);
              }

              if (useKeyRepeatEvent && event is KeyRepeatEvent) {
                onKeyEvent(event, dpadActionCallbacks);
              }
            }
          : (KeyEvent event) {
              customOnKeyEvent!(event, dpadActionCallbacks);
            },
      child: useFocusedBorder
          ? Container(
              margin: EdgeInsets.zero, // use padding with the child.
              padding: EdgeInsets.zero, // use padding with the child.
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(borderRadius),
                border: Border.all(
                  width: 1.5,
                  color: focusState.value
                      ? AppColors.chzzkColor
                      : Colors.transparent,
                ),
              ),
              child: child,
            )
          : child,
    );
  }
}

void onKeyEvent(KeyEvent event, DpadActionCallbacks dpadActionCallbacks) {
  final String keyLabel = event.logicalKey.keyLabel;

  switch (keyLabel) {
    case "Arrow Up": // up
      dpadActionCallbacks[DpadAction.arrowUp]?.call();
      break;
    case "Arrow Down": // down
      dpadActionCallbacks[DpadAction.arrowDown]?.call();
      break;
    case "Arrow Left": // left
      dpadActionCallbacks[DpadAction.arrowLeft]?.call();
      break;
    case "Arrow Right": // right
      dpadActionCallbacks[DpadAction.arrowRight]?.call();
      break;
    case "Select": // select
      dpadActionCallbacks[DpadAction.select]?.call();
      break;
    default:
      break;
  }
}

Map<DpadAction, VoidCallback> createScrollBindings(
  ScrollController controller, {
  double step = 100,
  Map<DpadAction, VoidCallback>? extraBindings,
}) {
  final bindings = <DpadAction, VoidCallback>{
    DpadAction.arrowDown: () {
      final max = controller.position.maxScrollExtent;
      controller.animateTo(
        (controller.offset + step).clamp(0, max),
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    },
    DpadAction.arrowUp: () {
      controller.animateTo(
        (controller.offset - step)
            .clamp(0, controller.position.maxScrollExtent),
        duration: const Duration(milliseconds: 200),
        curve: Curves.ease,
      );
    },
  };
  if (extraBindings != null) bindings.addAll(extraBindings);
  return bindings;
}
