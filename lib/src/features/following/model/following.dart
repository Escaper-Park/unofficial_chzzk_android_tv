import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import '../../live/model/live_info.dart';

part 'following.freezed.dart';
part 'following.g.dart';

@freezed
@JsonSerializable()
class Following with _$Following {
  final String channelId;
  final Channel channel;
  final Streamer streamer;
  final LiveInfo liveInfo;

  Following({
    required this.channelId,
    required this.channel,
    required this.streamer,
    required this.liveInfo,
  });

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);
}

@freezed
@JsonSerializable()
class Streamer with _$Streamer {
  final bool openLive;

  Streamer({required this.openLive});

  factory Streamer.fromJson(Map<String, dynamic> json) =>
      _$StreamerFromJson(json);
}

