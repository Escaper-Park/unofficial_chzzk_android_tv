import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/vod_feed.dart';
import '../../vod_card_string.dart';
import 'vod_card_formatters.dart';

class VodCardInfo extends StatelessWidget {
  const VodCardInfo({
    super.key,
    required this.item,
  });

  final Vod item;

  @override
  Widget build(BuildContext context) {
    final channel = item.channel;

    return TvMediaFeedInfo(
      title: item.title,
      channelName: channel?.channelName ?? VodCardString.fallbackChannelName,
      channelImageUrl: channel?.channelImageUrl,
      channelVerified: channel?.verifiedMark ?? false,
      tags: _buildTags(),
    );
  }

  List<Widget> _buildTags() {
    return [
      if (hasVodCardText(item.categoryValue))
        TvMediaBadge(
          text: item.categoryValue!.trim(),
          backgroundColor: TvMediaCardDesign.tagBackgroundColor,
        ),
      for (final tag in item.tags)
        if (hasVodCardText(tag))
          TvMediaBadge(
            text: tag.trim(),
            outlined: true,
            borderColor: TvMediaCardDesign.tagOutlineColor,
            textColor: AppColorTokens.neutral100,
          ),
    ];
  }
}
