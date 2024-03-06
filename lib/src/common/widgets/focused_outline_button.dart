import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../constants/styles.dart';

class FocusedOutlineButton extends HookWidget {
  /// A button that changes the color of border when getting focus.
  const FocusedOutlineButton({
    super.key,
    this.autofocus = false,
    this.radius = 12.0,
    this.borderWidth = 1.5,
    this.padding = EdgeInsets.zero,
    this.focusNode,
    required this.onPressed,
    required this.child,
  });

  final bool autofocus;

  /// BorderRadius.circular(raidus). Default value is 12.0.
  final double radius;
  final double borderWidth;
  final EdgeInsetsGeometry padding;

  /// If focusNode is null, use it's own focusNode.
  final FocusNode? focusNode;
  final VoidCallback? onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final focusState = useState<bool?>(null);

    return OutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      onFocusChange: (value) {
        focusState.value = value;
      },
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero,
        padding: padding,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        side: BorderSide(
          width: borderWidth,
          color: focusState.value == true
              ? AppColors.chzzkColor
              : Colors.transparent,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
