import 'package:flutter/material.dart';

import 'tv_media_card_design.dart';

class TvMediaTitle extends StatelessWidget {
  const TvMediaTitle({
    super.key,
    required this.text,
    required this.maxLines,
  });

  final String text;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final title = Text(
      text.replaceAll('\n', ' '),
      maxLines: maxLines,
      overflow: TextOverflow.ellipsis,
      style: textTheme.titleSmall?.copyWith(
        color: colorScheme.onSurface,
        fontWeight: FontWeight.w600,
      ),
    );

    if (maxLines <= 1) {
      return title;
    }

    return SizedBox(
      height: TvMediaCardDesign.twoLineTitleHeight,
      child: title,
    );
  }
}
