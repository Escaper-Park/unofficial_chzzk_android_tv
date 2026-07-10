import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/presentation/view/shared/live_card_formatters.dart';
import '../../../live/presentation/view/shared/live_card_thumbnail_url.dart';
import '../../../player_shared/presentation/player_browse/player_browse.dart';
import '../live_player_screen_string.dart';

class LivePlayerBrowseCard extends HookWidget {
  const LivePlayerBrowseCard({
    super.key,
    required this.live,
    required this.autofocus,
    required this.onPressed,
    this.thumbnailNow,
    this.thumbnailStreamRetainer,
  });

  final Live live;
  final bool autofocus;
  final VoidCallback onPressed;
  final DateTime Function()? thumbnailNow;
  final BucketedImageStreamRetainer? thumbnailStreamRetainer;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = useMemoized(
      () => liveCardThumbnailUrl(
        thumbnailImageUrl: live.thumbnailImageUrl,
        defaultThumbnailImageUrl: live.defaultThumbnailImageUrl,
        now: thumbnailNow,
        refreshInterval: livePlayerBrowseThumbnailRefreshInterval,
      ),
      [
        live.thumbnailImageUrl,
        live.defaultThumbnailImageUrl,
        thumbnailNow,
      ],
    );
    final channel = live.channel;

    return TvPlayerBrowseCard(
      title: live.title,
      imageUrl: thumbnailUrl,
      channelName: channel?.channelName,
      channelImageUrl: channel?.channelImageUrl,
      channelVerified: channel?.verifiedMark ?? false,
      liveBadgeLabel: _liveBadgeLabel(live),
      restrictionAssetPath: _restrictionAssetPath(live, thumbnailUrl),
      showAgeRestrictionOverlay: live.adult,
      autofocus: autofocus,
      thumbnailStreamRetainer: thumbnailStreamRetainer,
      onPressed: onPressed,
    );
  }
}

String _liveBadgeLabel(Live live) {
  final category = trimmedLiveCardTextOrNull(live.categoryValue);
  final viewerCount = formatLiveCardGrouped(live.concurrentUserCount);
  if (category == null) {
    return viewerCount;
  }

  return LivePlayerScreenString.browseCardBadge(viewerCount, category);
}

String? _restrictionAssetPath(Live live, String? thumbnailUrl) {
  if (live.blindType == _blindTypeAbroad) {
    return TvMediaCardDesign.abroadRestrictionAsset;
  }

  if (live.adult && thumbnailUrl == null) {
    return TvMediaCardDesign.ageRestrictionAsset;
  }

  return null;
}

const _blindTypeAbroad = 'ABROAD';
const livePlayerBrowseThumbnailRefreshInterval = Duration(minutes: 3);
