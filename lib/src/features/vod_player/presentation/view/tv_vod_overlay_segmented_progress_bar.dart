part of 'tv_vod_overlay_playback_info.dart';

class _TvVodSegmentedProgressBar extends StatelessWidget {
  const _TvVodSegmentedProgressBar({
    required this.value,
    required this.showHandle,
    required this.segments,
    required this.progressColor,
    required this.trackColor,
  });

  final double value;
  final bool showHandle;
  final List<_SeekSegment> segments;
  final Color? progressColor;
  final Color? trackColor;

  @override
  Widget build(BuildContext context) {
    const size = TvProgressBarSize.standard;
    final height = TvProgressBarDesign.height(size);
    final handleSize = TvProgressBarDesign.handleSize(size);
    final clampedValue = value.clamp(0, 1).toDouble();

    return SizedBox(
      height: showHandle ? handleSize : height,
      child: LayoutBuilder(
        builder: (context, constraints) {
          final width = constraints.maxWidth;
          final progressColor =
              this.progressColor ?? Theme.of(context).colorScheme.primary;
          final trackColor =
              this.trackColor ?? Colors.white.withValues(alpha: 0.2);
          final maxHandleLeft = (width - handleSize).clamp(0, width).toDouble();

          return Stack(
            alignment: Alignment.centerLeft,
            children: [
              for (var index = 0; index < segments.length; index += 1)
                _SegmentedTrackPart(
                  key: ValueKey('vod-overlay-seek-segment-$index'),
                  width: width,
                  height: height,
                  value: clampedValue,
                  segment: segments[index],
                  index: index,
                  segmentCount: segments.length,
                  progressColor: progressColor,
                  trackColor: trackColor,
                ),
              if (showHandle)
                Positioned(
                  left: (width * clampedValue - handleSize / 2)
                      .clamp(0, maxHandleLeft)
                      .toDouble(),
                  child: SizedBox.square(
                    dimension: handleSize,
                    child: DecoratedBox(
                      decoration: BoxDecoration(
                        color: progressColor,
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

class _SegmentedTrackPart extends StatelessWidget {
  const _SegmentedTrackPart({
    super.key,
    required this.width,
    required this.height,
    required this.value,
    required this.segment,
    required this.index,
    required this.segmentCount,
    required this.progressColor,
    required this.trackColor,
  });

  final double width;
  final double height;
  final double value;
  final _SeekSegment segment;
  final int index;
  final int segmentCount;
  final Color progressColor;
  final Color trackColor;

  @override
  Widget build(BuildContext context) {
    final gap = segmentCount > 1
        ? TvPlayerOverlayControlsDesign.vodSeekChapterGapWidth
        : 0.0;
    final leadingGap = index == 0 ? 0.0 : gap / 2;
    final trailingGap = index == segmentCount - 1 ? 0.0 : gap / 2;
    final left = width * segment.start + leadingGap;
    final right = width * segment.end - trailingGap;
    final segmentWidth = right - left;
    if (segmentWidth <= 0) {
      return const SizedBox.shrink();
    }

    final segmentRange = segment.end - segment.start;
    final segmentProgress = segmentRange <= 0
        ? 0.0
        : ((value - segment.start) / segmentRange).clamp(0, 1).toDouble();

    return Positioned(
      left: left,
      width: segmentWidth,
      child: SizedBox(
        height: height,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(height / 2),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ColoredBox(color: trackColor),
              FractionallySizedBox(
                alignment: Alignment.centerLeft,
                widthFactor: segmentProgress,
                child: ColoredBox(color: progressColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
