import 'package:flutter/material.dart';

import '../../../../core/ui/composites/media_cards/media_cards.dart';
import '../../../player_shared/presentation/overlay_controls/tv_player_overlay_controls_design.dart';

class LiveOverlayRealtimeInfoContent extends StatelessWidget {
  const LiveOverlayRealtimeInfoContent({
    super.key,
    this.tags = const [],
    this.elapsedText,
    this.viewerCountText,
  });

  final List<Widget> tags;
  final String? elapsedText;
  final String? viewerCountText;

  @override
  Widget build(BuildContext context) {
    final metrics = [
      if (_hasText(viewerCountText))
        _LiveOverlayMetric(
          icon: Icons.person_outline,
          text: viewerCountText!,
        ),
      if (_hasText(elapsedText))
        _LiveOverlayMetric(
          icon: Icons.schedule,
          text: elapsedText!,
          textWidth: TvPlayerOverlayControlsDesign.liveInfoElapsedTextWidth,
          textAlign: TextAlign.right,
        ),
    ];

    return SizedBox(
      height: TvPlayerOverlayControlsDesign.bottomRowHeight,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          if (tags.isNotEmpty)
            Expanded(
              child: TvMediaTagStrip(
                tags: tags,
              ),
            ),
          if (metrics.isNotEmpty) ...[
            if (tags.isNotEmpty)
              const SizedBox(width: TvPlayerOverlayControlsDesign.liveInfoGap)
            else
              const Spacer(),
            _LiveOverlayMetricRow(metrics: metrics),
          ],
        ],
      ),
    );
  }

  bool _hasText(String? value) {
    return value != null && value.isNotEmpty;
  }
}

class _LiveOverlayMetricRow extends StatelessWidget {
  const _LiveOverlayMetricRow({
    required this.metrics,
  });

  final List<_LiveOverlayMetric> metrics;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TvPlayerOverlayControlsDesign.bottomRowHeight,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          for (var index = 0; index < metrics.length; index += 1) ...[
            if (index > 0) const _TvLiveOverlayMetricDivider(),
            _LiveOverlayIconText(metric: metrics[index]),
          ],
        ],
      ),
    );
  }
}

class _LiveOverlayIconText extends StatelessWidget {
  const _LiveOverlayIconText({
    required this.metric,
  });

  final _LiveOverlayMetric metric;

  @override
  Widget build(BuildContext context) {
    final style = TvPlayerOverlayControlsDesign.infoTextStyle(context);
    final color = style?.color;

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          metric.icon,
          size: TvPlayerOverlayControlsDesign.liveInfoIconSize,
          color: color,
        ),
        const SizedBox(width: TvPlayerOverlayControlsDesign.liveInfoMetricGap),
        _LiveOverlayMetricText(metric: metric, style: style),
      ],
    );
  }
}

class _LiveOverlayMetricText extends StatelessWidget {
  const _LiveOverlayMetricText({
    required this.metric,
    required this.style,
  });

  final _LiveOverlayMetric metric;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final text = Text(
      metric.text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: metric.textAlign,
      style: style,
    );

    final textWidth = metric.textWidth;
    if (textWidth == null) {
      return text;
    }

    return SizedBox(
      width: textWidth,
      child: text,
    );
  }
}

class _TvLiveOverlayMetricDivider extends StatelessWidget {
  const _TvLiveOverlayMetricDivider();

  @override
  Widget build(BuildContext context) {
    final color = TvPlayerOverlayControlsDesign.infoTextStyle(context)?.color;

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: TvPlayerOverlayControlsDesign.liveInfoMetricDividerGap,
      ),
      child: SizedBox.square(
        dimension: TvPlayerOverlayControlsDesign.liveInfoDividerSize,
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}

final class _LiveOverlayMetric {
  const _LiveOverlayMetric({
    required this.icon,
    required this.text,
    this.textWidth,
    this.textAlign = TextAlign.start,
  });

  final IconData icon;
  final String text;
  final double? textWidth;
  final TextAlign textAlign;
}
