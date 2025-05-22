import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../constants/dimensions.dart' show Dimensions;
import '../../constants/styles.dart' show AppColors;

class FocusedOutlinedButton extends HookWidget {
  const FocusedOutlinedButton({
    super.key,
    this.autofocus = false,
    this.borderRadius = 12.0,
    this.borderWidth = Dimensions.focusedBorderWidth,
    this.padding = EdgeInsets.zero,
    this.focusedBorderColor = AppColors.chzzkColor,
    this.useFocusedBackgroundColor = false,
    this.backgroundColor,
    this.unFocusedBorderColor = Colors.transparent,
    this.focusNode,
    this.onPressed,
    required this.child,
  });

  final bool autofocus;

  /// Roundness value of border.
  ///
  /// Default value is `12.0`.
  final double borderRadius;

  /// Thickness of the border. When using this widget with a [ScrollController],
  /// you should consider this thickness.
  final double borderWidth;

  /// The gap between border and child.
  ///
  /// Default value is `EdgeInsets.zero`.
  final EdgeInsetsGeometry padding;

  /// The color when this button has focus.
  final Color focusedBorderColor;

  final bool useFocusedBackgroundColor;

  /// The background color when this button has focus.
  final Color? backgroundColor;

  /// The color when this button doesn't have focus.
  final Color unFocusedBorderColor;

  /// Use this if you want to call the [FocusNode] in other widgets.
  final FocusNode? focusNode;
  final VoidCallback? onPressed;

  /// The child widget with the `internal` focus state of this widget.
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final focusState = useState<bool?>(null);

    return OutlinedButton(
      autofocus: autofocus,
      focusNode: focusNode,
      onFocusChange: (value) => focusState.value = value,
      style: OutlinedButton.styleFrom(
        minimumSize: Size.zero, // constraint
        padding: padding,
        splashFactory: NoSplash.splashFactory,
        backgroundColor: backgroundColor,
        foregroundColor:
            useFocusedBackgroundColor ? backgroundColor : Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: BorderSide(
          width: borderWidth,
          color: focusState.value == true
              ? focusedBorderColor
              : unFocusedBorderColor,
        ),
      ),
      onPressed: onPressed,
      child: child,
    );
  }
}
