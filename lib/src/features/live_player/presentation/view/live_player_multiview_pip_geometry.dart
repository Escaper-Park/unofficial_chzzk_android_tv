part of 'live_player_multiview_playback_layout.dart';

List<Rect> _pipRects(Size size, int count, LiveSettings settings) {
  if (count <= 0) {
    return const [];
  }

  final availableWidth =
      size.width - LivePlayerScreenDesign.multiviewPipScreenPadding * 2;
  final availableHeight =
      size.height - LivePlayerScreenDesign.multiviewPipScreenPadding * 2;
  const gap = LivePlayerScreenDesign.multiviewPipGap;
  final totalGap = gap * (count - 1);
  final maxSizePercent = count >= 2
      ? LivePlayerScreenDesign.multiviewPipMultiMaxSizePercent
      : LivePlayerScreenDesign.multiviewPipSingleMaxSizePercent;
  final sizePercent = settings.multiviewPipSize.clamp(1, maxSizePercent) / 100;
  final horizontal = settings.multiviewPipLayoutIndex == 0;

  final pipSize = _pipSize(
    availableWidth: math.max(0, availableWidth),
    availableHeight: math.max(0, availableHeight),
    totalGap: totalGap,
    sizePercent: sizePercent,
    horizontal: horizontal,
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
        LivePlayerScreenDesign.multiviewPipScreenPadding +
            originX +
            (horizontal ? (pipWidth + gap) * index : 0),
        LivePlayerScreenDesign.multiviewPipScreenPadding +
            originY +
            (horizontal ? 0 : (pipHeight + gap) * index),
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
}) {
  if (horizontal) {
    final width = math.max(0.0, availableWidth - totalGap) * sizePercent;
    final height = width * 9 / 16;
    if (height <= availableHeight) {
      return Size(width, height);
    }

    return Size(availableHeight * 16 / 9, availableHeight);
  }

  final height = math.max(0.0, availableHeight - totalGap) * sizePercent;
  final width = height * 16 / 9;
  if (width <= availableWidth) {
    return Size(width, height);
  }

  return Size(availableWidth, availableWidth * 9 / 16);
}

double _pipRadiusForRect(Rect rect) {
  final shortestSide = math.min(rect.width, rect.height);
  if (shortestSide <= 0) {
    return 0;
  }

  final scaledRadius =
      shortestSide * LivePlayerScreenDesign.multiviewPipRadiusRatio;
  final radius = scaledRadius
      .clamp(
        LivePlayerScreenDesign.multiviewPipMinRadius,
        LivePlayerScreenDesign.multiviewPipMaxRadius,
      )
      .toDouble();
  return math.min(shortestSide / 2, radius);
}

double _pipAxisOrigin({
  required int positionPercent,
  required double available,
  required double content,
}) {
  final travel = (available - content).clamp(0, double.infinity);
  return travel * positionPercent.clamp(0, 100) / 100;
}
