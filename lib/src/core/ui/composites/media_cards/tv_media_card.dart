import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../components/cards/tv_card.dart';
import '../../components/cards/tv_card_design.dart';
import 'tv_media_card_design.dart';

class TvMediaCard extends StatelessWidget {
  const TvMediaCard({
    super.key,
    required this.thumbnail,
    required this.content,
    required this.onPressed,
    this.autofocus = false,
    this.width = TvMediaCardDesign.width,
    this.focusedScale = TvFocusedScale.standard,
    this.focusedElevation = TvCardElevation.level2,
    this.focusedShadowColor,
    this.focusNode,
  });

  final Widget thumbnail;
  final Widget content;
  final VoidCallback onPressed;
  final bool autofocus;
  final TvCardWidth width;
  final TvFocusedScale focusedScale;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;
  final FocusNode? focusNode;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      widthFactor: 1,
      heightFactor: 1,
      child: SizedBox(
        width: width.value,
        height: TvMediaCardDesign.cardHeight(width),
        child: TvCard(
          image: thumbnail,
          content: SizedBox(
            height: TvMediaCardDesign.contentHeight,
            child: content,
          ),
          width: width,
          autofocus: autofocus,
          focusNode: focusNode,
          design: TvCardDesign.defaults(
            imageContentGap: TvMediaCardDesign.imageContentGap,
            backgroundColor: TvMediaCardDesign.cardBackgroundColor,
            focusedScale: focusedScale,
            focusedElevation: focusedElevation,
            focusedShadowColor: focusedShadowColor,
          ),
          onPressed: onPressed,
        ),
      ),
    );
  }
}
