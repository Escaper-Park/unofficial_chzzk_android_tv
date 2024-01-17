import 'package:json_annotation/json_annotation.dart';

import '../../channel/model/channel.dart';

part 'recommendation.g.dart';

@JsonSerializable()
class Recommendation {
  final String channelId;
  final BaseChannel channel;
  final Streamer streamer;
  final LiveInfo liveInfo;

  Recommendation(
    this.channelId,
    this.channel,
    this.streamer,
    this.liveInfo,
  );

  factory Recommendation.fromJson(Map<String, dynamic> json) =>
      _$RecommendationFromJson(json);
}
