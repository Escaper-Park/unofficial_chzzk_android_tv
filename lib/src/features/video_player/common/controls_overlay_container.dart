import 'package:flutter/material.dart';

class ControlsOverlayContainer extends StatelessWidget {
  /// Top parent Container for overlays.
  ///
  /// Wrap this to [Stack].
  const ControlsOverlayContainer({
    super.key,
    required this.alignment,
    required this.width,
    required this.height,
    required this.backgroundColor,
    required this.backgroundOpacity,
    required this.margin,
    required this.padding,
    required this.child,
  });

  /// Position of container.
  final Alignment alignment;

  /// Container width.
  final double width;

  /// Container height.
  final double height;

  /// Container background color.
  final Color backgroundColor;

  /// Opacity of background color.
  final double backgroundOpacity;

  /// Empty space outside container.
  final EdgeInsetsGeometry margin;

  /// Empty space inside container.
  final EdgeInsetsGeometry padding;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        width: width,
        height: height,
        margin: margin,
        padding: padding,
        color: backgroundColor.withOpacity(backgroundOpacity),
        child: child,
      ),
    );
  }
}
