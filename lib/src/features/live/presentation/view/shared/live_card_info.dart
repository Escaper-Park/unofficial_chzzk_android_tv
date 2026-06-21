import 'package:flutter/material.dart';

import '../../../../../core/ui/ui.dart';
import '../../../domain/entities/live_feed.dart';
import '../../live_card_string.dart';
import 'live_card_formatters.dart';

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
    final watchPartyLabel = _watchPartyLabelFor(item.watchPartyType);
    final watchPartyTag = watchPartyLabel == null
        ? null
        : trimmedLiveCardTextOrNull(item.watchPartyTag);

    return [
      if (hasLiveCardText(item.categoryValue))
        TvMediaBadge(
          text: item.categoryValue!.trim(),
          backgroundColor: TvMediaCardDesign.tagBackgroundColor,
        ),
      if (watchPartyLabel != null) ...[
        TvMediaBadge(
          text: watchPartyLabel,
          outlined: true,
          borderColor: AppColorTokens.brandColor,
          textColor: AppColorTokens.brandColor,
        ),
        if (watchPartyTag != null)
          TvMediaBadge(
            text: watchPartyTag,
            outlined: true,
            borderColor: AppColorTokens.brandColor,
            textColor: AppColorTokens.brandColor,
          ),
      ],
      for (final tag in _regularTagTexts(item.tags, watchPartyTag))
        TvMediaBadge(
          text: tag,
          outlined: true,
          borderColor: TvMediaCardDesign.tagOutlineColor,
          textColor: AppColorTokens.neutral100,
        ),
    ];
  }
}

Iterable<String> _regularTagTexts(
  List<String> tags,
  String? watchPartyTag,
) sync* {
  for (final tag in tags) {
    final tagText = trimmedLiveCardTextOrNull(tag);
    if (tagText == null || tagText == watchPartyTag) {
      continue;
    }
    yield tagText;
  }
}

String? _watchPartyLabelFor(String? watchPartyType) {
  final type = trimmedLiveCardTextOrNull(watchPartyType);

  if (type == null) {
    return null;
  }

  if (type.toUpperCase() == 'NORMAL') {
    return LiveCardString.watchParty;
  }

  return LiveCardString.watchPartyPlus;
}
