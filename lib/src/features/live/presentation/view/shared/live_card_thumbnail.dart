import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/live_feed.dart';
import '../../live_card_string.dart';
import 'live_card_elapsed_ticker.dart';
import 'live_card_formatters.dart';
import 'live_card_thumbnail_url.dart';

class LiveCardThumbnail extends StatelessWidget {
  const LiveCardThumbnail({
    super.key,
    required this.item,
    this.progress,
    this.preview,
    this.now,
  });

  final Live item;
  final double? progress;
  final Widget? preview;
  final DateTime Function()? now;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveCardThumbnailUrl(
      thumbnailImageUrl: item.thumbnailImageUrl,
      defaultThumbnailImageUrl: item.defaultThumbnailImageUrl,
      now: now,
    );

    return Stack(
      fit: StackFit.expand,
      children: [
        TvMediaThumbnail(
          imageUrl: thumbnailUrl,
          fallbackIcon: Icons.live_tv_rounded,
          restrictionAssetPath: _restrictionAssetPath(thumbnailUrl),
          showAgeRestrictionOverlay: item.adult,
          topStartBadges: [
            const TvMediaBadge(
              text: LiveCardString.live,
              backgroundColor: TvMediaCardDesign.liveBadgeColor,
            ),
            TvMediaBadge(
              text: LiveCardString.watchingCount(
                formatLiveCardGrouped(item.concurrentUserCount),
              ),
            ),
          ],
          bottomStartBadge: _uptimeBadge,
          progress: progress,
        ),
        if (preview != null) Positioned.fill(child: preview!),
      ],
    );
  }

  Widget? get _uptimeBadge {
    final startedAt = parseLiveCardOpenDate(item.openDate);

    if (startedAt == null) {
      return null;
    }

    return _LiveUptimeBadge(
      startedAt: startedAt,
      now: now ?? DateTime.now,
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

class _LiveUptimeBadge extends StatelessWidget {
  const _LiveUptimeBadge({
    required this.startedAt,
    required this.now,
  });

  final DateTime startedAt;
  final DateTime Function() now;

  @override
  Widget build(BuildContext context) {
    return LiveCardElapsedTicker(
      now: now,
      builder: (context, currentTime) {
        return TvMediaBadge(
          text: formatLiveCardElapsed(currentTime.difference(startedAt)),
        );
      },
    );
  }
}

const _blindTypeAbroad = 'ABROAD';
