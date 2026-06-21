import 'package:flutter/material.dart';

import '../vod_player_screen_ui_mapper.dart';
import 'vod_player_seek_feedback_overlay_design.dart';

@immutable
final class VodPlayerSeekFeedback {
  const VodPlayerSeekFeedback({
    required this.forward,
    required this.position,
  });

  final bool forward;
  final Duration position;
}

class VodPlayerSeekFeedbackOverlay extends StatelessWidget {
  const VodPlayerSeekFeedbackOverlay({
    super.key,
    required this.feedback,
  });

  final VodPlayerSeekFeedback feedback;

  @override
  Widget build(BuildContext context) {
    return IgnorePointer(
      child: Stack(
        key: ValueKey(feedback),
        fit: StackFit.expand,
        alignment: Alignment.center,
        children: [
          if (!feedback.forward)
            const Align(
              alignment: Alignment.centerLeft,
              child: Padding(
                padding: EdgeInsets.only(
                  left:
                      VodPlayerSeekFeedbackOverlayDesign.iconHorizontalPadding,
                ),
                child: _SeekFeedbackIcon(
                  icon: Icons.fast_rewind_rounded,
                ),
              ),
            ),
          Center(
            child: Text(
              VodPlayerScreenUiMapper.timeText(feedback.position),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: VodPlayerSeekFeedbackOverlayDesign.positionTextStyle(
                context,
              ),
            ),
          ),
          if (feedback.forward)
            const Align(
              alignment: Alignment.centerRight,
              child: Padding(
                padding: EdgeInsets.only(
                  right:
                      VodPlayerSeekFeedbackOverlayDesign.iconHorizontalPadding,
                ),
                child: _SeekFeedbackIcon(
                  icon: Icons.fast_forward_rounded,
                ),
              ),
            ),
        ],
      ),
    );
  }
}

class _SeekFeedbackIcon extends StatelessWidget {
  const _SeekFeedbackIcon({
    required this.icon,
  });

  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Icon(
      icon,
      color: VodPlayerSeekFeedbackOverlayDesign.foregroundColor,
      size: VodPlayerSeekFeedbackOverlayDesign.iconSize(context),
    );
  }
}
