import 'package:flutter/material.dart';

import 'tv_media_card_design.dart';
import 'tv_media_channel_name.dart';
import 'tv_media_tag_strip.dart';
import 'tv_media_title.dart';

class TvMediaInfoTextColumn extends StatelessWidget {
  const TvMediaInfoTextColumn({
    super.key,
    required this.title,
    required this.channelName,
    required this.channelVerified,
    required this.titleMaxLines,
    required this.tags,
    required this.metadata,
  });

  final String title;
  final String channelName;
  final bool channelVerified;
  final int titleMaxLines;
  final List<Widget> tags;
  final Widget? metadata;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TvMediaTitle(text: title, maxLines: titleMaxLines),
        const SizedBox(height: TvMediaCardDesign.infoLineSpacing),
        TvMediaChannelName(channelName: channelName, verified: channelVerified),
        if (tags.isNotEmpty) ...[
          const SizedBox(height: TvMediaCardDesign.infoLineSpacing),
          TvMediaTagStrip(tags: tags),
        ],
        if (metadata != null) ...[
          const SizedBox(height: TvMediaCardDesign.infoLineSpacing),
          metadata!,
        ],
      ],
    );
  }
}
