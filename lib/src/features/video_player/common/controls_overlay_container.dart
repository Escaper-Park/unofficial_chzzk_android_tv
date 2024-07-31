import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';

class ControlsOverlayContainer extends StatelessWidget {
  /// Top parent Container for overlays.
  ///
  /// Wrap this to [Stack].
  const ControlsOverlayContainer({
    super.key,
    this.alignment = Alignment.bottomCenter,
    this.width,
    this.height,
    this.margin,
    this.padding,
    this.backgroundColor = AppColors.greyContainerColor,
    this.backgroundOpacity = 0.7,
    this.borderRadius = 0.0,
    this.useTopBorder = false,
    this.useBottomBorder = false,
    required this.child,
  });

  /// Position of container.
  final Alignment alignment;

  /// Container width.
  final double? width;

  /// Container height.
  final double? height;

  /// Empty space outside container.
  final EdgeInsetsGeometry? margin;

  /// Empty space inside container.
  final EdgeInsetsGeometry? padding;

  /// Container background color.
  final Color backgroundColor;

  /// Opacity of background color.
  final double backgroundOpacity;

  /// If true, top borders are rounded.
  final bool useTopBorder;

  /// If true, bottom borders are rounded.
  final bool useBottomBorder;
  final double borderRadius;

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
        decoration: BoxDecoration(
          color: backgroundColor.withOpacity(backgroundOpacity),
          borderRadius: BorderRadius.vertical(
            top: useTopBorder ? Radius.circular(borderRadius) : Radius.zero,
            bottom:
                useBottomBorder ? Radius.circular(borderRadius) : Radius.zero,
          ),
        ),
        child: child,
      ),
    );
  }
}
