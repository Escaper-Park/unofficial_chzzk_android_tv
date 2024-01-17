import 'package:flutter/material.dart';

class RoundedContainer extends StatelessWidget {
  const RoundedContainer({
    super.key,
    this.height,
    this.width,
    this.borderRadius = 8.0,
    this.backgroundColor,
    this.margin,
    this.padding,
    required this.child,
  });

  final double? height;
  final double? width;
  final double borderRadius;
  final Color? backgroundColor;

  /// Empty space outside the container.
  final EdgeInsetsGeometry? margin;

  /// Empty space inside the container
  final EdgeInsetsGeometry? padding;
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
        color: backgroundColor,
      ),
      child: child,
    );
  }
}
