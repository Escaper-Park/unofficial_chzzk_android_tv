import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/live_feed.dart';
import 'live_tag_badges.dart';

class LiveCardInfo extends StatelessWidget {
  const LiveCardInfo({
    super.key,
    required this.item,
  });

  final Live item;

  @override
  Widget build(BuildContext context) {
    final channel = item.channel;

    return TvMediaFeedInfo(
      title: item.title,
      channelName: channel?.channelName ?? '',
      channelImageUrl: channel?.channelImageUrl,
      channelVerified: channel?.verifiedMark ?? false,
      channelOpenLive: true,
      tags: _buildTags(),
    );
  }

  List<Widget> _buildTags() {
    return buildLiveTagBadges(
      categoryValue: item.categoryValue,
      watchPartyTag: item.watchPartyTag,
      watchPartyType: item.watchPartyType,
      tags: item.tags,
    );
  }
}
