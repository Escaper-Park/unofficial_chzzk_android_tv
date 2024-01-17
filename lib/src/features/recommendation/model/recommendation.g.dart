// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommendation.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Recommendation _$RecommendationFromJson(Map<String, dynamic> json) =>
    Recommendation(
      json['channelId'] as String,
      BaseChannel.fromJson(json['channel'] as Map<String, dynamic>),
      Streamer.fromJson(json['streamer'] as Map<String, dynamic>),
      LiveInfo.fromJson(json['liveInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$RecommendationToJson(Recommendation instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channel': instance.channel,
      'streamer': instance.streamer,
      'liveInfo': instance.liveInfo,
    };
