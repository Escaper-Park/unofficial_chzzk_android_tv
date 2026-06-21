import 'package:flutter/material.dart';

import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../live/presentation/view/shared/live_card_thumbnail_url.dart';

class HomeImmersiveThumbnail extends StatelessWidget {
  const HomeImmersiveThumbnail({
    super.key,
    required this.item,
  });

  final Live item;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveCardThumbnailUrl(
      thumbnailImageUrl: item.thumbnailImageUrl,
      defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
    );

    return TvMediaThumbnail(
      imageUrl: thumbnailUrl,
      fallbackIcon: Icons.live_tv_rounded,
      restrictionAssetPath: _restrictionAssetPath(thumbnailUrl),
      showAgeRestrictionOverlay: item.adult,
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
