import 'package:flutter/material.dart';

import 'live_player_controls_overlay_design.dart';

class LivePlayerMultiviewMetric extends StatelessWidget {
  const LivePlayerMultiviewMetric({
    super.key,
    required this.icon,
    required this.text,
    required this.style,
    required this.fixedTextWidth,
  });

  final IconData icon;
  final String text;
  final TextStyle? style;
  final double fixedTextWidth;

  @override
  Widget build(BuildContext context) {
    final color = style?.color ?? Theme.of(context).colorScheme.onSurface;

    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Icon(
          icon,
          size: LivePlayerControlsOverlayDesign.multiviewInfoMetricIconSize,
          color: color,
        ),
        const SizedBox(
          width: LivePlayerControlsOverlayDesign.multiviewInfoMetricIconGap,
        ),
        SizedBox(
          width: fixedTextWidth,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.clip,
            textAlign: TextAlign.right,
            style: style,
          ),
        ),
      ],
    );
  }
}
