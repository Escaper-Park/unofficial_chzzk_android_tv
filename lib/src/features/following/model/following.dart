import 'package:freezed_annotation/freezed_annotation.dart';

import '../../channel/model/channel.dart';
import '../../live/model/live_info.dart';

part 'following.freezed.dart';
part 'following.g.dart';

@freezed
class Following with _$Following {
  const factory Following({
    required String channelId,
    required Channel channel,
    required Streamer streamer,
    required LiveInfo liveInfo,
  }) = _Following;

  factory Following.fromJson(Map<String, dynamic> json) =>
      _$FollowingFromJson(json);
}

@freezed
class Streamer with _$Streamer {
  const factory Streamer({required bool openLive}) = _Streamer;

  factory Streamer.fromJson(Map<String, dynamic> json) =>
      _$StreamerFromJson(json);
}
