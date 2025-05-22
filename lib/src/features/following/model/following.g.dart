// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      channelId: json['channelId'] as String,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      streamer: Streamer.fromJson(json['streamer'] as Map<String, dynamic>),
      liveInfo: LiveInfo.fromJson(json['liveInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingToJson(Following instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channel': instance.channel,
      'streamer': instance.streamer,
      'liveInfo': instance.liveInfo,
    };

Streamer _$StreamerFromJson(Map<String, dynamic> json) => Streamer(
      openLive: json['openLive'] as bool,
    );

Map<String, dynamic> _$StreamerToJson(Streamer instance) => <String, dynamic>{
      'openLive': instance.openLive,
    };
