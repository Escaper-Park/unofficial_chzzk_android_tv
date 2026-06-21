import 'package:flutter/material.dart';

import 'tv_media_card_info.dart';

class TvMediaFeedInfo extends StatelessWidget {
  const TvMediaFeedInfo({
    super.key,
    required this.title,
    required this.channelName,
    this.channelImageUrl,
    this.channelVerified = false,
    this.channelOpenLive = false,
    this.tags = const <Widget>[],
  });

  final String title;
  final String channelName;
  final String? channelImageUrl;
  final bool channelVerified;
  final bool channelOpenLive;
  final List<Widget> tags;

  @override
  Widget build(BuildContext context) {
    return TvMediaCardInfo(
      title: title,
      channelName: channelName,
      channelImageUrl: channelImageUrl,
      channelVerified: channelVerified,
      channelOpenLive: channelOpenLive,
      titleMaxLines: 2,
      tags: tags,
    );
  }
}
