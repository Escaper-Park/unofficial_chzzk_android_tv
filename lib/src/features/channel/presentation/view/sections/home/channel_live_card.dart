import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_preview.dart';
import '../../../../../live/presentation/view/shared/live_preview_player.dart';
import '../../../../../live/presentation/view/shared/live_preview_settings.dart';
import '../../../channel_screen_design.dart';
import 'channel_live_card_metadata.dart';
import 'channel_live_card_preview_outline.dart';
import 'channel_live_card_thumbnail.dart';

class ChannelLiveCard extends HookWidget {
  const ChannelLiveCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
    this.focusedScale = TvFocusedScale.standard,
    this.focusedElevation = TvCardElevation.level2,
    this.focusedShadowColor,
    this.previewSettings,
    this.now,
  });

  final Live item;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvFocusedScale focusedScale;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;
  final LivePreviewSettings? previewSettings;
  final DateTime Function()? now;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return LivePreview(
      item: item,
      focusNode: focusNode,
      settings: previewSettings,
      builder: (context, previewState) {
        final playbackUri = previewState.playbackUri;
        final waitProgress = previewState.waitProgress;
        final cardDesign = _channelLiveCardDesign(
          waiting: waitProgress != null,
          focusedElevation: focusedElevation,
          focusedShadowColor: focusedShadowColor,
        );

        return Align(
          alignment: Alignment.topLeft,
          widthFactor: 1,
          heightFactor: 1,
          child: AnimatedScale(
            scale: focusNode.hasFocus ? focusedScale.value : 1,
            duration: const Duration(milliseconds: 120),
            child: Stack(
              fit: StackFit.passthrough,
              children: [
                TvCard(
                  type: TvCardType.wideClassic,
                  width: ChannelScreenDesign.liveCardWidth,
                  autofocus: autofocus,
                  focusNode: focusNode,
                  image: ChannelLiveThumbnail(
                    item: item,
                    preview: playbackUri == null
                        ? null
                        : LivePreviewPlayer(
                            playbackUri: playbackUri,
                            videoViewType: previewState.videoViewType,
                            muted: previewState.muted,
                          ),
                  ),
                  content: ChannelLiveMetadata(
                    item: item,
                    now: now ?? DateTime.now,
                  ),
                  design: cardDesign,
                  onPressed: onPressed,
                ),
                if (waitProgress != null)
                  Positioned.fill(
                    child: IgnorePointer(
                      child: CustomPaint(
                        key: channelLivePreviewOutlineKey,
                        painter: ChannelLivePreviewOutlinePainter(
                          progress: waitProgress,
                          radius: cardDesign.radius,
                          strokeWidth: cardDesign.focusOutlineWidth,
                        ),
                      ),
                    ),
                  ),
              ],
            ),
          ),
        );
      },
    );
  }
}

TvCardDesign _channelLiveCardDesign({
  required bool waiting,
  required TvCardElevation focusedElevation,
  required Color? focusedShadowColor,
}) {
  return TvCardDesign(
    radius: TvRadius.md.borderRadius,
    imageContentGap: TvMediaCardDesign.imageContentGap,
    backgroundColor: TvMediaCardDesign.cardBackgroundColor,
    focusOutlineColor: waiting
        ? AppColorTokens.brandColor.withValues(alpha: 0.24)
        : AppColorTokens.brandColor,
    focusOutlineWidth: TvCardOutlineWidth.thick.value,
    focusedScale: TvFocusedScale.standard.value,
    focusedElevation: focusedElevation.value,
    focusedShadowColor: focusedShadowColor,
  );
}
