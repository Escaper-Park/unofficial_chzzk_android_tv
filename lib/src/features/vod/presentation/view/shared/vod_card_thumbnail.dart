import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/vod_feed.dart';
import '../../vod_card_string.dart';
import 'vod_card_formatters.dart';

class VodCardThumbnail extends StatelessWidget {
  const VodCardThumbnail({
    super.key,
    required this.item,
    this.watchProgressSeconds,
  });

  final Vod item;
  final int? watchProgressSeconds;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = trimmedVodCardTextOrNull(item.thumbnailImageUrl);

    return TvMediaThumbnail(
      imageUrl: thumbnailUrl,
      fallbackIcon: Icons.video_library_outlined,
      restrictionAssetPath: _restrictionAssetPath(thumbnailUrl),
      showAgeRestrictionOverlay: item.adult,
      topStartBadges: _topStartBadges,
      topEndBadge: TvMediaBadge(
        text: formatVodCardRelativeFromEpochMilliseconds(item.publishDateAt),
      ),
      bottomStartBadge: TvMediaBadge(
        text: formatVodCardElapsed(Duration(seconds: item.duration)),
      ),
      bottomEndBadge: _metadataBadges,
      progress: _watchProgress,
    );
  }

  Widget get _metadataBadges {
    return TvMediaMetadataBadge(
      items: [
        TvMediaMetadataItem(
          icon: Icons.play_arrow_rounded,
          label: formatVodCardGrouped(item.readCount),
        ),
        TvMediaMetadataItem(
          icon: Icons.calendar_month_rounded,
          label: formatVodCardPublishDate(item.publishDate),
        ),
      ],
    );
  }

  List<Widget> get _topStartBadges {
    return [
      TvMediaBadge(
        text: item.videoType == _videoTypeUpload
            ? VodCardString.upload
            : VodCardString.replay,
        backgroundColor: TvMediaCardDesign.vodBadgeColor,
      ),
      if (item.livePv > _livePvBadgeThreshold)
        TvMediaBadge(
          text: VodCardString.watchedLive(
            formatVodCardCompactTenThousandCount(
              item.livePv,
              suffix: VodCardString.viewCountUnit,
            ),
          ),
        ),
    ];
  }

  double? get _watchProgress {
    final timeline = watchProgressSeconds ?? item.watchTimeline;

    if (timeline == null) {
      return null;
    }

    if (item.duration <= 0) {
      return 0;
    }

    return (timeline / item.duration).clamp(0, 1).toDouble();
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
const _videoTypeUpload = 'UPLOAD';
const _livePvBadgeThreshold = 1000;
