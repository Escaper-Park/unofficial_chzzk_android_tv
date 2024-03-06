import 'package:flutter/material.dart';

import '../../../../common/constants/dimensions.dart';
import '../../../../common/constants/styles.dart';

class LiveStreamControlsContainer extends StatelessWidget {
  const LiveStreamControlsContainer({
    super.key,
    required this.child,
    this.alignment = Alignment.bottomCenter,
    this.height = Dimensions.liveStreamingMainControlOverlayHeight,
    this.hPadding = 20.0,
    this.vPadding = 10.0,
  });

  final Alignment alignment;
  final double height;
  final double hPadding;
  final double vPadding;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: alignment,
      child: Container(
        height: height,
        width: double.infinity,
        color: AppColors.blackColor.withOpacity(0.9),
        padding: EdgeInsets.symmetric(
          horizontal: hPadding,
          vertical: vPadding,
        ),
        child: child,
      ),
    );
  }
}
