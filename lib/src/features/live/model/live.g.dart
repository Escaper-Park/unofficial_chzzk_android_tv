// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveDetailImpl _$$LiveDetailImplFromJson(Map<String, dynamic> json) =>
    _$LiveDetailImpl(
      liveId: json['liveId'] as int,
      liveTitle: json['liveTitle'] as String,
      status: json['status'] as String?,
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      concurrentUserCount: json['concurrentUserCount'] as int,
      openDate: json['openDate'] as String?,
      adult: json['adult'] as bool,
      chatChannelId: json['chatChannelId'] as String?,
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      livePath: _$JsonConverterFromJson<String, String>(
          json['livePlaybackJson'], const LivePlaybackConverter().fromJson),
      userAdultStatus: json['userAdultStatus'] as String?,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LiveDetailImplToJson(_$LiveDetailImpl instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'openDate': instance.openDate,
      'adult': instance.adult,
      'chatChannelId': instance.chatChannelId,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'livePlaybackJson': _$JsonConverterToJson<String, String>(
          instance.livePath, const LivePlaybackConverter().toJson),
      'userAdultStatus': instance.userAdultStatus,
      'channel': instance.channel,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$LivePageImpl _$$LivePageImplFromJson(Map<String, dynamic> json) =>
    _$LivePageImpl(
      concurrentUserCount: json['concurrentUserCount'] as int,
      liveId: json['liveId'] as int,
    );

Map<String, dynamic> _$$LivePageImplToJson(_$LivePageImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };
