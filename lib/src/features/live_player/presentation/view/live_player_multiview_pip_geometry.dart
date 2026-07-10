part of 'live_player_multiview_playback_layout.dart';

List<Rect> _pipRects(Size size, int count, LiveSettings settings) {
  if (count <= 0) {
    return const [];
  }

  final viewportWidth = _finiteNonNegativeExtent(size.width);
  final viewportHeight = _finiteNonNegativeExtent(size.height);
  final screenPadding = math.min(
    LivePlayerScreenDesign.multiviewPipScreenPadding,
    math.min(viewportWidth, viewportHeight) / 2,
  );
  final availableWidth = math.max(
    0.0,
    viewportWidth - screenPadding * 2,
  );
  final availableHeight = math.max(
    0.0,
    viewportHeight - screenPadding * 2,
  );
  final horizontal = settings.multiviewPipLayoutIndex == 0;
  final availableMainAxis = horizontal ? availableWidth : availableHeight;
  final gap = _pipGap(
    availableMainAxis: availableMainAxis,
    count: count,
  );
  final totalGap = gap * (count - 1);
  final maxSizePercent = count >= 2
      ? LivePlayerScreenDesign.multiviewPipMultiMaxSizePercent
      : LivePlayerScreenDesign.multiviewPipSingleMaxSizePercent;
  final sizePercent = settings.multiviewPipSize.clamp(1, maxSizePercent) / 100;

  final pipSize = _pipSize(
    availableWidth: availableWidth,
    availableHeight: availableHeight,
    totalGap: totalGap,
    sizePercent: sizePercent,
    horizontal: horizontal,
    count: count,
  );
  final pipWidth = pipSize.width;
  final pipHeight = pipSize.height;
  final totalWidth = horizontal ? pipWidth * count + totalGap : pipWidth;
  final totalHeight = horizontal ? pipHeight : pipHeight * count + totalGap;
  final originX = _pipAxisOrigin(
    positionPercent: settings.multiviewPipPositionX,
    available: availableWidth,
    content: totalWidth,
  );
  final originY = _pipAxisOrigin(
    positionPercent: settings.multiviewPipPositionY,
    available: availableHeight,
    content: totalHeight,
  );

  return [
    for (var index = 0; index < count; index += 1)
      Rect.fromLTWH(
        screenPadding + originX + (horizontal ? (pipWidth + gap) * index : 0),
        screenPadding + originY + (horizontal ? 0 : (pipHeight + gap) * index),
        pipWidth,
        pipHeight,
      ),
  ];
}

Size _pipSize({
  required double availableWidth,
  required double availableHeight,
  required double totalGap,
  required double sizePercent,
  required bool horizontal,
  required int count,
}) {
  final safeCount = math.max(1, count);
  if (horizontal) {
    final usableWidth = math.max(0.0, availableWidth - totalGap);
    final width = math.min(
      usableWidth * sizePercent,
      usableWidth / safeCount,
    );
    final height = width / _pipSlotAspectRatio;
    if (height <= availableHeight) {
      return Size(width, height);
    }

    return Size(availableHeight * _pipSlotAspectRatio, availableHeight);
  }

  final usableHeight = math.max(0.0, availableHeight - totalGap);
  final height = math.min(
    usableHeight * sizePercent,
    usableHeight / safeCount,
  );
  final width = height * _pipSlotAspectRatio;
  if (width <= availableWidth) {
    return Size(width, height);
  }

  return Size(availableWidth, availableWidth / _pipSlotAspectRatio);
}

double _pipGap({
  required double availableMainAxis,
  required int count,
}) {
  if (count <= 1) {
    return 0;
  }

  return math.min(
    LivePlayerScreenDesign.multiviewPipGap,
    availableMainAxis / (count - 1),
  );
}

double _pipAxisOrigin({
  required int positionPercent,
  required double available,
  required double content,
}) {
  final travel = (available - content).clamp(0, double.infinity);
  return travel * positionPercent.clamp(0, 100) / 100;
}

double _finiteNonNegativeExtent(double value) {
  if (!value.isFinite || value <= 0) {
    return 0;
  }

  return value;
}

const _pipSlotAspectRatio = 16 / 9;
