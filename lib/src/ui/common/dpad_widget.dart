import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/styles.dart';

class DpadWidget extends HookWidget {
  const DpadWidget({
    super.key,
    required this.child,
    this.upCallback,
    this.downCallback,
    this.leftCallback,
    this.rightCallback,
    this.okCallback,
    this.returnCallback,
    this.autofocus = false,
    this.focusNode,
    this.useFocusedBorder = false,
    this.padding = 0.0,
    this.borderRadius = 10.0,
  });

  final Widget child;
  final VoidCallback? upCallback;
  final VoidCallback? downCallback;
  final VoidCallback? leftCallback;
  final VoidCallback? rightCallback;
  final VoidCallback? okCallback;
  final VoidCallback? returnCallback;
  final bool autofocus;
  final FocusNode? focusNode;
  final bool useFocusedBorder;
  final double padding;
  final double borderRadius;

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
        if (event is RawKeyDownEvent) {
          String keyLabel = event.logicalKey.keyLabel;

          switch (keyLabel) {
            case "Arrow Up": // up
              if (upCallback != null) upCallback!();
            case "Arrow Down": // down
              if (downCallback != null) downCallback!();
            case 'Arrow Left': // left
              if (leftCallback != null) leftCallback!();
            case "Arrow Right": // right
              if (rightCallback != null) rightCallback!();
            case "Select": // ok
              if (okCallback != null) okCallback!();
            case "Go Back": // back
              if (returnCallback != null) returnCallback!();
            default:
          }
        }
      },
      child: useFocusedBorder
          ? Container(
              padding: EdgeInsets.all(padding),
              decoration: BoxDecoration(
                border: Border.all(
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
}
