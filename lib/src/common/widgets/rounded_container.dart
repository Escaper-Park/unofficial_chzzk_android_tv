import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  /// Container that has rounded corners.
  const RoundedContainer({
    super.key,
    this.width,
    this.height,
    this.borderRadius = 12.0,
    this.borderColor = Colors.transparent,
    this.backgroundColor,
    this.margin,
    this.padding,
    required this.child,
  });

  /// Empty space outside the container.
  final EdgeInsetsGeometry? margin;

  /// Empty space inside the container
  final EdgeInsetsGeometry? padding;

  final double? width;
  final double? height;
  final double borderRadius;
  final Color borderColor;
  final Color? backgroundColor;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: margin,
      padding: padding,
      height: height,
      width: width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(borderRadius),
        border: Border.all(color: borderColor),
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
