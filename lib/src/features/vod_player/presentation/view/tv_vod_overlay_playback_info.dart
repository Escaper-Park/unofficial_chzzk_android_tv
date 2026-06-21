import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/components/primitives/primitives.dart';
import '../../../../core/utils/utils.dart';
import '../../../player_shared/presentation/overlay_controls/tv_player_overlay_controls_design.dart';
import '../vod_player_screen_string.dart';

part 'tv_vod_overlay_seek_calculations.dart';
part 'tv_vod_overlay_seek_acceleration.dart';
part 'tv_vod_overlay_seek_chapters.dart';
part 'tv_vod_overlay_seek_thumbnail_calculations.dart';
part 'tv_vod_overlay_seek_thumbnail_absolute_timestamp.dart';
part 'tv_vod_overlay_seek_thumbnail_ratio.dart';
part 'tv_vod_overlay_seek_bar.dart';
part 'tv_vod_overlay_seek_key_handler.dart';
part 'tv_vod_overlay_seek_models.dart';
part 'tv_vod_overlay_seek_preview.dart';
part 'tv_vod_overlay_seek_preview_hide_controller.dart';
part 'tv_vod_overlay_seek_preview_label.dart';
part 'tv_vod_overlay_seek_preview_thumbnail.dart';
part 'tv_vod_overlay_segmented_progress_bar.dart';

class TvVodOverlayPlaybackInfo extends StatelessWidget {
  const TvVodOverlayPlaybackInfo({
    super.key,
    required this.progress,
    required this.positionText,
    required this.durationText,
    this.showHandle = true,
    this.position = Duration.zero,
    this.duration = Duration.zero,
    this.seekStep = const Duration(seconds: 10),
    this.chapters = const <TvVodOverlaySeekChapter>[],
    this.seekThumbnail,
    this.previewTimeTextBuilder = formatFixedHourMinuteSecond,
    this.onSeek,
    this.onSeekFeedback,
    this.onFocusChanged,
  });

  final double progress;
  final String positionText;
  final String durationText;
  final bool showHandle;
  final Duration position;
  final Duration duration;
  final Duration seekStep;
  final List<TvVodOverlaySeekChapter> chapters;
  final TvVodOverlaySeekThumbnail? seekThumbnail;
  final String Function(Duration duration) previewTimeTextBuilder;
  final ValueChanged<Duration>? onSeek;
  final TvVodOverlaySeekFeedbackCallback? onSeekFeedback;
  final ValueChanged<bool>? onFocusChanged;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TvPlayerOverlayControlsDesign.bottomRowHeight,
      child: Row(
        children: [
          Expanded(
            child: _TvVodSeekBar(
              value: progress,
              showHandle: showHandle,
              position: position,
              duration: duration,
              seekStep: seekStep,
              chapters: chapters,
              seekThumbnail: seekThumbnail,
              previewTimeTextBuilder: previewTimeTextBuilder,
              onSeek: onSeek,
              onSeekFeedback: onSeekFeedback,
              onFocusChanged: onFocusChanged,
            ),
          ),
          const SizedBox(width: TvPlayerOverlayControlsDesign.vodInfoGap),
          SizedBox(
            width: TvPlayerOverlayControlsDesign.vodTimeSummaryWidth,
            child: Text(
              VodPlayerScreenString.timeSummary(positionText, durationText),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.right,
              style: TvPlayerOverlayControlsDesign.infoTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}
