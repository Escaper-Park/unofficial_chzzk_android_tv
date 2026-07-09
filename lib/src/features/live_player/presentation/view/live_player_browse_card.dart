import 'package:flutter/material.dart';

import '../../../../core/ui/ui.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../live/presentation/view/shared/live_card_formatters.dart';
import '../../../live/presentation/view/shared/live_card_thumbnail_url.dart';
import '../../../player_shared/presentation/player_browse/player_browse.dart';
import '../live_player_screen_string.dart';

class LivePlayerBrowseCard extends StatelessWidget {
  const LivePlayerBrowseCard({
    super.key,
    required this.live,
    required this.autofocus,
    required this.onPressed,
  });

  final Live live;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = liveCardThumbnailUrl(
      thumbnailImageUrl: live.thumbnailImageUrl,
      defaultThumbnailImageUrl: live.defaultThumbnailImageUrl,
      refreshInterval: _livePlayerBrowseThumbnailRefreshInterval,
    );
    final channel = live.channel;

    return TvPlayerBrowseCard(
      key: ValueKey('live-player-browse-${live.liveId}-${channel?.channelId}'),
      title: live.title,
      imageUrl: thumbnailUrl,
      channelName: channel?.channelName,
      channelImageUrl: channel?.channelImageUrl,
      channelVerified: channel?.verifiedMark ?? false,
      liveBadgeLabel: _liveBadgeLabel(live),
      restrictionAssetPath: _restrictionAssetPath(live, thumbnailUrl),
      showAgeRestrictionOverlay: live.adult,
      autofocus: autofocus,
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
const _livePlayerBrowseThumbnailRefreshInterval = Duration(minutes: 3);
