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

_$FollowingResponseImpl _$$FollowingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingResponseImpl(
      totalCount: (json['totalCount'] as num).toInt(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
      followingList: (json['followingList'] as List<dynamic>)
          .map((e) => Following.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingResponseImplToJson(
        _$FollowingResponseImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPage,
      'followingList': instance.followingList,
    };

_$FollowingCategoryResponseImpl _$$FollowingCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingCategoryResponseImpl(
      followingList: (json['followingList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingCategoryResponseImplToJson(
        _$FollowingCategoryResponseImpl instance) =>
    <String, dynamic>{
      'followingList': instance.followingList,
    };
