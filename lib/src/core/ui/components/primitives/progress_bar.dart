import 'package:flutter/material.dart';

import '../../../design/design.dart';

enum TvProgressBarSize {
  standard,
  large,
}

class TvProgressBar extends StatelessWidget {
  const TvProgressBar({
    super.key,
    required this.value,
    this.size = TvProgressBarSize.standard,
    this.showHandle = false,
    this.progressColor,
    this.trackColor,
  });

  final double value;
  final TvProgressBarSize size;
  final bool showHandle;
  final Color? progressColor;
  final Color? trackColor;

  @override
  Widget build(BuildContext context) {
    final height = TvProgressBarDesign.height(size);
    final handleSize = TvProgressBarDesign.handleSize(size);
    final clampedValue = value.clamp(0, 1).toDouble();

    return SizedBox(
      height: showHandle ? handleSize : height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final progressWidth = width * clampedValue;
          final maxHandleLeft = (width - handleSize).clamp(0, width).toDouble();

          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              SizedBox(
                width: width,
                height: height,
                child: ClipRRect(
                  borderRadius: TvRadius.xs.borderRadius,
                  child: LinearProgressIndicator(
                    value: clampedValue,
                    minHeight: height,
                    color: progressColor ?? AppColorTokens.brandColor,
                    backgroundColor:
                        trackColor ?? Colors.white.withValues(alpha: 0.2),
                  ),
                ),
              ),
              if (showHandle)
                Positioned(
                  left: (progressWidth - handleSize / 2)
                      .clamp(
                        0,
                        maxHandleLeft,
                      )
                      .toDouble(),
                  child: SizedBox.square(
                    dimension: handleSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: progressColor ?? AppColorTokens.brandColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}

final class TvProgressBarDesign {
  const TvProgressBarDesign._();

  static double height(TvProgressBarSize size) {
    return switch (size) {
      TvProgressBarSize.standard => 3,
      TvProgressBarSize.large => 5,
    };
  }

  static double handleSize(TvProgressBarSize size) {
    return height(size) * 2 + 1;
  }
}
