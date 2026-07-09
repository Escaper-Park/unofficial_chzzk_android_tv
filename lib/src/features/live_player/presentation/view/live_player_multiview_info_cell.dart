import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_ui_mapper.dart';
import 'live_overlay_now_ticker.dart';
import 'live_player_controls_overlay_design.dart';
import 'live_player_multiview_metric.dart';

class LivePlayerMultiviewInfoCell extends StatelessWidget {
  const LivePlayerMultiviewInfoCell({
    super.key,
    required this.slot,
    this.selectSlotFromBloc = false,
  });

  final LivePlayerSlotState? slot;
  final bool selectSlotFromBloc;

  @override
  Widget build(BuildContext context) {
    final slot = this.slot;
    if (slot == null) {
      return const SizedBox.expand();
    }

    if (!selectSlotFromBloc) {
      return _LivePlayerMultiviewInfoCellView(
        snapshot: _LivePlayerMultiviewInfoCellSnapshot.fromSlot(slot),
      );
    }

    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LivePlayerMultiviewInfoCellSnapshot
    >(
      selector: (state) {
        return _LivePlayerMultiviewInfoCellSnapshot.fromSlot(
          state.slotById(slot.slotId) ?? slot,
        );
      },
      builder: (context, snapshot) {
        return _LivePlayerMultiviewInfoCellView(
          snapshot: snapshot,
        );
      },
    );
  }
}

class _LivePlayerMultiviewInfoCellView extends StatelessWidget {
  const _LivePlayerMultiviewInfoCellView({
    required this.snapshot,
  });

  final _LivePlayerMultiviewInfoCellSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final baseStyle = LivePlayerControlsOverlayDesign.multiviewInfoTextStyle(
      context,
    );
    final secondaryStyle = baseStyle?.copyWith(
      color: Theme.of(context).colorScheme.onSurface.withValues(alpha: 0.68),
    );
    final startedAt = LivePlayerScreenUiMapper.parseOpenDate(
      snapshot.openDate,
    );
    final viewerCountText = LivePlayerScreenUiMapper.viewerCountText(
      snapshot.concurrentUserCount,
    );

    return Row(
      children: [
        Center(
          child: ProfileCircleAvatar(
            imageUrl: snapshot.channelImageUrl,
            radius: LivePlayerControlsOverlayDesign.multiviewInfoAvatarRadius,
            openLive: snapshot.status != LivePlayerSlotStatus.empty,
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
                channelName: _slotChannelName(snapshot),
                verified: snapshot.channelVerified,
                style: baseStyle,
              ),
              if (snapshot.title != null) ...[
                const SizedBox(
                  height: LivePlayerControlsOverlayDesign
                      .multiviewInfoChannelTitleGap,
                ),
                Text(
                  snapshot.title!,
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
              if (startedAt != null)
                _LivePlayerMultiviewElapsedMetric(
                  startedAt: startedAt,
                  style: baseStyle,
                ),
              if (startedAt != null && viewerCountText != null)
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

@immutable
final class _LivePlayerMultiviewInfoCellSnapshot {
  const _LivePlayerMultiviewInfoCellSnapshot({
    required this.slotId,
    required this.status,
    required this.channelId,
    required this.channelName,
    required this.channelImageUrl,
    required this.channelVerified,
    required this.title,
    required this.openDate,
    required this.concurrentUserCount,
  });

  factory _LivePlayerMultiviewInfoCellSnapshot.fromSlot(
    LivePlayerSlotState slot,
  ) {
    return _LivePlayerMultiviewInfoCellSnapshot(
      slotId: slot.slotId,
      status: slot.status,
      channelId: slot.channelId,
      channelName: slot.channelName,
      channelImageUrl: slot.channelImageUrl,
      channelVerified: slot.channelVerified,
      title: slot.title,
      openDate: slot.openDate,
      concurrentUserCount: slot.concurrentUserCount,
    );
  }

  final String slotId;
  final LivePlayerSlotStatus status;
  final String? channelId;
  final String? channelName;
  final String? channelImageUrl;
  final bool channelVerified;
  final String? title;
  final String? openDate;
  final int? concurrentUserCount;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LivePlayerMultiviewInfoCellSnapshot &&
            other.slotId == slotId &&
            other.status == status &&
            other.channelId == channelId &&
            other.channelName == channelName &&
            other.channelImageUrl == channelImageUrl &&
            other.channelVerified == channelVerified &&
            other.title == title &&
            other.openDate == openDate &&
            other.concurrentUserCount == concurrentUserCount;
  }

  @override
  int get hashCode => Object.hash(
    slotId,
    status,
    channelId,
    channelName,
    channelImageUrl,
    channelVerified,
    title,
    openDate,
    concurrentUserCount,
  );
}

class _LivePlayerMultiviewElapsedMetric extends HookWidget {
  const _LivePlayerMultiviewElapsedMetric({
    required this.startedAt,
    required this.style,
  });

  final DateTime startedAt;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    final now = useLiveOverlayNowTicker();

    return LivePlayerMultiviewMetric(
      icon: Icons.schedule,
      text: LivePlayerScreenUiMapper.formatElapsed(now.difference(startedAt)),
      style: style,
      fixedTextWidth:
          LivePlayerControlsOverlayDesign.multiviewInfoMetricTextWidth,
    );
  }
}

String _slotChannelName(_LivePlayerMultiviewInfoCellSnapshot slot) {
  return slot.channelName ?? slot.channelId ?? '';
}
