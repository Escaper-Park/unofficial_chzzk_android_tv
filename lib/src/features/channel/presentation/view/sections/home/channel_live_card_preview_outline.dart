import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';

const channelLivePreviewOutlineKey = ValueKey(
  'channel-live-preview-outline',
);

class ChannelLivePreviewOutlinePainter extends CustomPainter {
  const ChannelLivePreviewOutlinePainter({
    required this.progress,
    required this.radius,
    required this.strokeWidth,
  });

  final double progress;
  final BorderRadius radius;
  final double strokeWidth;

  @override
  void paint(Canvas canvas, Size size) {
    final clampedProgress = progress.clamp(0, 1).toDouble();
    if (clampedProgress <= 0 || size.isEmpty) {
      return;
    }

    final outlinePath = Path()
      ..addRRect(
        radius.toRRect(
          (Offset.zero & size).deflate(strokeWidth / 2),
        ),
      );
    final metrics = outlinePath.computeMetrics().toList(growable: false);
    final outlineLength = metrics.fold<double>(
      0,
      (length, metric) => length + metric.length,
    );
    var remainingLength = outlineLength * clampedProgress;
    final paint = Paint()
      ..isAntiAlias = true
      ..color = AppColorTokens.brandColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = strokeWidth;

    for (final metric in metrics) {
      if (remainingLength <= 0) {
        break;
      }

      final segmentLength = remainingLength < metric.length
          ? remainingLength
          : metric.length;
      canvas.drawPath(metric.extractPath(0, segmentLength), paint);
      remainingLength -= metric.length;
    }
  }

  @override
  bool shouldRepaint(ChannelLivePreviewOutlinePainter oldDelegate) {
    return oldDelegate.progress != progress ||
        oldDelegate.radius != radius ||
        oldDelegate.strokeWidth != strokeWidth;
  }
}
