import 'package:flutter/material.dart';

import '../../components/primitives/primitives.dart';
import 'tv_media_card_design.dart';
import 'tv_media_thumbnail_badges.dart';
import 'tv_media_thumbnail_fallback.dart';

class TvMediaThumbnail extends StatelessWidget {
  const TvMediaThumbnail({
    super.key,
    required this.imageUrl,
    required this.fallbackIcon,
    this.restrictionAssetPath,
    this.showAgeRestrictionOverlay = false,
    this.topStartBadges = const <Widget>[],
    this.topEndBadge,
    this.bottomStartBadge,
    this.bottomEndBadge,
    this.progress,
    this.streamRetainer,
  });

  final String? imageUrl;
  final IconData fallbackIcon;
  final String? restrictionAssetPath;
  final bool showAgeRestrictionOverlay;
  final List<Widget> topStartBadges;
  final Widget? topEndBadge;
  final Widget? bottomStartBadge;
  final Widget? bottomEndBadge;
  final double? progress;
  final BucketedImageStreamRetainer? streamRetainer;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final size = TvMediaThumbnailSize.fromConstraints(constraints);
        final fallback = TvMediaThumbnailFallback(
          icon: fallbackIcon,
        );
        final placeholder = TvMediaThumbnailFallback(
          icon: fallbackIcon,
          showLoadingAsset: true,
        );
        final thumbnailUrl = _trimmedOrNull(imageUrl);
        final restrictionAssetPath = _trimmedOrNull(this.restrictionAssetPath);

        return Stack(
          fit: StackFit.expand,
          children: [
            if (restrictionAssetPath != null)
              OptimizedImage.asset(
                restrictionAssetPath,
                width: size.width,
                height: size.height,
                errorFallback: fallback,
              )
            else if (thumbnailUrl == null)
              fallback
            else
              OptimizedImage.network(
                thumbnailUrl,
                width: size.width,
                height: size.height,
                placeholder: placeholder,
                errorFallback: fallback,
                streamRetainer: streamRetainer,
              ),
            if (restrictionAssetPath == null &&
                thumbnailUrl != null &&
                showAgeRestrictionOverlay)
              OptimizedImage.asset(
                TvMediaCardDesign.ageRestrictionOverlayAsset,
                width: size.width,
                height: size.height,
              ),
            TvMediaThumbnailBadges(
              topStartBadges: topStartBadges,
              topEndBadge: topEndBadge,
              bottomStartBadge: bottomStartBadge,
              bottomEndBadge: bottomEndBadge,
            ),
            if (progress != null)
              Positioned(
                left: 0,
                right: 0,
                bottom: 0,
                child: TvProgressBar(
                  value: progress!,
                  trackColor: TvMediaCardDesign.progressTrackColor,
                ),
              ),
          ],
        );
      },
    );
  }
}

String? _trimmedOrNull(String? value) {
  final trimmed = value?.trim();

  if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
    return null;
  }

  return trimmed;
}
