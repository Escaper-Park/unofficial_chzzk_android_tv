import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/live_feed.dart';
import 'live_card_design.dart';
import 'live_card_info.dart';
import 'live_card_thumbnail.dart';
import 'live_preview.dart';
import 'live_preview_player.dart';
import 'live_preview_settings.dart';

class LiveCard extends HookWidget {
  const LiveCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
    this.focusedScale = LiveCardDesign.focusedScale,
    this.focusedElevation = TvCardElevation.level2,
    this.focusedShadowColor,
    this.previewSettings,
  });

  final Live item;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvFocusedScale focusedScale;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;
  final LivePreviewSettings? previewSettings;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();

    return LivePreview(
      item: item,
      focusNode: focusNode,
      settings: previewSettings,
      builder: (context, previewState) {
        final playbackUri = previewState.playbackUri;

        return TvMediaCard(
          autofocus: autofocus,
          focusNode: focusNode,
          focusedScale: focusedScale,
          focusedElevation: focusedElevation,
          focusedShadowColor: focusedShadowColor,
          thumbnail: LiveCardThumbnail(
            item: item,
            progress: previewState.waitProgress,
            preview: playbackUri == null
                ? null
                : LivePreviewPlayer(
                    playbackUri: playbackUri,
                    videoViewType: previewState.videoViewType,
                    muted: previewState.muted,
                  ),
          ),
          content: LiveCardInfo(item: item),
          onPressed: onPressed,
        );
      },
    );
  }
}
