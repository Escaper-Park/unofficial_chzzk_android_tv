// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Following _$FollowingFromJson(Map<String, dynamic> json) => Following(
      json['channelId'] as String,
      ChannelWithPersonalData.fromJson(json['channel'] as Map<String, dynamic>),
      Streamer.fromJson(json['streamer'] as Map<String, dynamic>),
      LiveInfo.fromJson(json['liveInfo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingToJson(Following instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'channel': instance.channel,
      'streamer': instance.streamer,
      'liveInfo': instance.liveInfo,
    };
