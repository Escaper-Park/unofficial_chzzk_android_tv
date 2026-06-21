import 'package:flutter/material.dart';

import 'tv_media_badge_row.dart';
import 'tv_media_card_design.dart';

class TvMediaThumbnailBadges extends StatelessWidget {
  const TvMediaThumbnailBadges({
    super.key,
    required this.topStartBadges,
    required this.topEndBadge,
    required this.bottomStartBadge,
    required this.bottomEndBadge,
  });

  final List<Widget> topStartBadges;
  final Widget? topEndBadge;
  final Widget? bottomStartBadge;
  final Widget? bottomEndBadge;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        if (topStartBadges.isNotEmpty || topEndBadge != null)
          Positioned(
            left: TvMediaCardDesign.badgeInset,
            top: TvMediaCardDesign.badgeInset,
            right: TvMediaCardDesign.badgeInset,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (topStartBadges.isNotEmpty)
                  Expanded(child: TvMediaBadgeRow(children: topStartBadges))
                else
                  const Spacer(),
                if (topStartBadges.isNotEmpty && topEndBadge != null)
                  const SizedBox(width: TvMediaCardDesign.badgeSpacing),
                ?topEndBadge,
              ],
            ),
          ),
        if (bottomStartBadge != null)
          Positioned(
            left: TvMediaCardDesign.badgeInset,
            bottom: TvMediaCardDesign.badgeInset,
            child: bottomStartBadge!,
          ),
        if (bottomEndBadge != null)
          Positioned(
            right: TvMediaCardDesign.badgeInset,
            bottom: TvMediaCardDesign.badgeInset,
            child: bottomEndBadge!,
          ),
      ],
    );
  }
}
