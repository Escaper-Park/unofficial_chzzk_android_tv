import 'package:flutter/material.dart';

import '../../components/primitives/primitives.dart';
import 'tv_media_card_design.dart';
import 'tv_media_info_text_column.dart';

class TvMediaCardInfo extends StatelessWidget {
  const TvMediaCardInfo({
    super.key,
    required this.title,
    required this.channelName,
    this.channelImageUrl,
    this.channelVerified = false,
    this.channelOpenLive = false,
    this.titleMaxLines = 1,
    this.tags = const <Widget>[],
    this.metadata,
  }) : assert(titleMaxLines > 0);

  final String title;
  final String channelName;
  final String? channelImageUrl;
  final bool channelVerified;
  final bool channelOpenLive;
  final int titleMaxLines;
  final List<Widget> tags;
  final Widget? metadata;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).colorScheme.surfaceContainerHighest,
      child: Padding(
        padding: TvMediaCardDesign.contentPadding,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ProfileCircleAvatar(
              imageUrl: channelImageUrl,
              radius: TvMediaCardDesign.profileImageRadius,
              openLive: channelOpenLive,
            ),
            const SizedBox(width: TvMediaCardDesign.profileInfoSpacing),
            Expanded(
              child: TvMediaInfoTextColumn(
                title: title,
                channelName: channelName,
                channelVerified: channelVerified,
                titleMaxLines: titleMaxLines,
                tags: tags,
                metadata: metadata,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
