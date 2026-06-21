import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/live_card_string.dart';
import '../../../../../live/presentation/view/shared/live_card_thumbnail_url.dart';

class ChannelLiveThumbnail extends StatelessWidget {
  const ChannelLiveThumbnail({
    super.key,
    required this.item,
    this.preview,
  });

  final Live item;
  final Widget? preview;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveCardThumbnailUrl(
      thumbnailImageUrl: item.thumbnailImageUrl,
      defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        TvMediaThumbnail(
          imageUrl: thumbnailUrl,
          fallbackIcon: Icons.live_tv_rounded,
          restrictionAssetPath: _restrictionAssetPath(thumbnailUrl),
          showAgeRestrictionOverlay: item.adult,
          topStartBadges: const [
            TvMediaBadge(
              text: LiveCardString.live,
              backgroundColor: TvMediaCardDesign.liveBadgeColor,
            ),
          ],
        ),
        if (preview != null) Positioned.fill(child: preview!),
      ],
    );
  }

  String? _restrictionAssetPath(String? thumbnailUrl) {
    if (item.blindType == _blindTypeAbroad) {
      return TvMediaCardDesign.abroadRestrictionAsset;
    }

    if (item.adult && thumbnailUrl == null) {
      return TvMediaCardDesign.ageRestrictionAsset;
    }

    return null;
  }
}

const _blindTypeAbroad = 'ABROAD';
