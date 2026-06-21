part of 'tv_vod_overlay_playback_info.dart';

Duration _clampDuration(Duration value, Duration max) {
  if (value < Duration.zero) {
    return Duration.zero;
  }
  if (max > Duration.zero && value > max) {
    return max;
  }

  return value;
}

double _progressValue({
  required double fallback,
  required Duration position,
  required Duration duration,
}) {
  if (duration <= Duration.zero) {
    return fallback.clamp(0, 1).toDouble();
  }

  return (position.inMilliseconds / duration.inMilliseconds)
      .clamp(0, 1)
      .toDouble();
}

double _previewLeft({
  required double availableWidth,
  required double value,
}) {
  final previewWidth = TvPlayerOverlayControlsDesign.vodSeekPreviewWidth;
  final maxLeft = (availableWidth - previewWidth).clamp(0, availableWidth);

  return (availableWidth * value - previewWidth / 2)
      .clamp(0, maxLeft)
      .toDouble();
}
