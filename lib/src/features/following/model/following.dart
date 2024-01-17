import 'package:json_annotation/json_annotation.dart';

import '../../channel/model/channel.dart';

part 'following.g.dart';

@JsonSerializable()
class Following {
  final String channelId;
  final ChannelWithPersonalData channel;
  final Streamer streamer;
  final LiveInfo liveInfo;

  Following(
    this.channelId,
    this.channel,
    this.streamer,
    this.liveInfo,
  );

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);
}
