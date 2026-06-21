import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/vod_feed.dart';
import 'vod_card_design.dart';
import 'vod_card_info.dart';
import 'vod_card_thumbnail.dart';

class VodCard extends StatelessWidget {
  const VodCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
    this.focusedScale = VodCardDesign.focusedScale,
    this.focusedElevation = TvCardElevation.level2,
    this.focusedShadowColor,
    this.watchProgressSeconds,
  });

  final Vod item;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvFocusedScale focusedScale;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;
  final int? watchProgressSeconds;

  @override
  Widget build(BuildContext context) {
    return TvMediaCard(
      autofocus: autofocus,
      focusedScale: focusedScale,
      focusedElevation: focusedElevation,
      focusedShadowColor: focusedShadowColor,
      thumbnail: VodCardThumbnail(
        item: item,
        watchProgressSeconds: watchProgressSeconds,
      ),
      content: VodCardInfo(item: item),
      onPressed: onPressed,
    );
  }
}
