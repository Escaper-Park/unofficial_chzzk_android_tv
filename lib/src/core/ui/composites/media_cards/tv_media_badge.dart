import 'package:flutter/material.dart';

import '../../../design/design.dart';
import '../../components/primitives/primitives.dart';
import 'tv_media_card_design.dart';

class TvMediaBadge extends StatelessWidget {
  const TvMediaBadge({
    super.key,
    required this.text,
    this.backgroundColor = TvMediaCardDesign.scrimBadgeColor,
    this.textColor = AppColorTokens.neutral100,
    this.borderColor,
    this.outlined = false,
  });

  final String text;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final bool outlined;

  @override
  Widget build(BuildContext context) {
    return TvTag(
      text: text,
      type: outlined ? TvTagType.outlined : TvTagType.filled,
      size: TvTagSize.small,
      backgroundColor: backgroundColor,
      textColor: textColor,
      borderColor: borderColor,
    );
  }
}
