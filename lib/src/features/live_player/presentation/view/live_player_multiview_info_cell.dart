import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_ui_mapper.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_multiview_metric.dart';

class LivePlayerMultiviewInfoCell extends StatelessWidget {
  const LivePlayerMultiviewInfoCell({
    super.key,
    required this.slot,
    required this.now,
  });

  final LivePlayerSlotState? slot;
  final DateTime now;

  @override
  Widget build(BuildContext context) {
    final slot = this.slot;
    if (slot == null) {
      return const SizedBox.expand();
    }

    final baseStyle = LivePlayerControlsOverlayDesign.multiviewInfoTextStyle(
      context,
    );
    final secondaryStyle = baseStyle?.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.68),
    );
    final elapsedText = LivePlayerScreenUiMapper.elapsedText(
      openDate: slot.openDate,
      now: now,
    );
    final viewerCountText = LivePlayerScreenUiMapper.viewerCountText(
      slot.concurrentUserCount,
    );

    return Row(
      children: [
        Center(
          child: ProfileCircleAvatar(
            imageUrl: slot.channelImageUrl,
            radius: LivePlayerControlsOverlayDesign.multiviewInfoAvatarRadius,
            openLive: slot.status != LivePlayerSlotStatus.empty,
            liveBorderWidth: 1,
          ),
        ),
        const SizedBox(
          width: LivePlayerControlsOverlayDesign.multiviewInfoContentGap,
        ),
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TvMediaChannelName(
                channelName: _slotChannelName(slot),
                verified: slot.channelVerified,
                style: baseStyle,
              ),
              if (slot.title != null) ...[
                const SizedBox(
                  height: LivePlayerControlsOverlayDesign
                      .multiviewInfoChannelTitleGap,
                ),
                Text(
                  slot.title!,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: secondaryStyle,
                ),
              ],
            ],
          ),
        ),
        const SizedBox(
          width: LivePlayerControlsOverlayDesign.multiviewInfoContentGap,
        ),
        SizedBox(
          width: LivePlayerControlsOverlayDesign.multiviewInfoMetricsWidth,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (elapsedText != null)
                LivePlayerMultiviewMetric(
                  icon: Icons.schedule,
                  text: elapsedText,
                  style: baseStyle,
                  fixedTextWidth: LivePlayerControlsOverlayDesign
                      .multiviewInfoMetricTextWidth,
                ),
              if (elapsedText != null && viewerCountText != null)
                const SizedBox(
                  height:
                      LivePlayerControlsOverlayDesign.multiviewInfoMetricGap,
                ),
              if (viewerCountText != null)
                LivePlayerMultiviewMetric(
                  icon: Icons.person_outline,
                  text: viewerCountText,
                  style: secondaryStyle,
                  fixedTextWidth: LivePlayerControlsOverlayDesign
                      .multiviewInfoMetricTextWidth,
                ),
            ],
          ),
        ),
      ],
    );
  }
}

String _slotChannelName(LivePlayerSlotState slot) {
  return slot.channelName ?? slot.channelId ?? '';
}
