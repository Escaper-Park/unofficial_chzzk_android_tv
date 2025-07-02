// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingImpl _$$FollowingImplFromJson(Map<String, dynamic> json) =>
    _$FollowingImpl(
      channelId: json['channelId'] as String,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      streamer: Streamer.fromJson(json['streamer'] as Map<String, dynamic>),
      liveInfo: LiveInfo.fromJson(json['liveInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingImplToJson(_$FollowingImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channel': instance.channel,
      'streamer': instance.streamer,
      'liveInfo': instance.liveInfo,
    };

_$StreamerImpl _$$StreamerImplFromJson(Map<String, dynamic> json) =>
    _$StreamerImpl(
      openLive: json['openLive'] as bool,
    );

Map<String, dynamic> _$$StreamerImplToJson(_$StreamerImpl instance) =>
    <String, dynamic>{
      'openLive': instance.openLive,
    };
