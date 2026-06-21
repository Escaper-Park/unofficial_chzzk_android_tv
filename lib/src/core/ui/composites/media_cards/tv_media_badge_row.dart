import 'package:flutter/material.dart';

import 'tv_media_card_design.dart';

class TvMediaBadgeRow extends StatelessWidget {
  const TvMediaBadgeRow({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: TvMediaCardDesign.badgeSpacing,
      children: [
        for (var index = 0; index < children.length; index += 1)
          if (index == 0) children[index] else Flexible(child: children[index]),
      ],
    );
  }
}
