// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Vod _$VodFromJson(Map<String, dynamic> json) => Vod(
      videoNo: (json['videoNo'] as num).toInt(),
      videoId: json['videoId'] as String?,
      videoTitle: json['videoTitle'] as String,
      videoType: json['videoType'] as String,
      publishDate: json['publishDate'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      trailerUrl: json['trailerUrl'] as String?,
      duration: (json['duration'] as num).toInt(),
      readCount: (json['readCount'] as num).toInt(),
      publishDateAt: (json['publishDateAt'] as num).toInt(),
      categoryType: json['categoryType'] as String?,
      videoCategory: json['videoCategory'] as String?,
      videoCategoryValue: json['videoCategoryValue'] as String?,
      exposure: json['exposure'] as bool?,
      adult: json['adult'] as bool,
      clipActive: json['clipActive'] as bool?,
      livePv: (json['livePv'] as num?)?.toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
      paidPromotion: json['paidPromotion'] as bool?,
      inKey: json['inKey'] as String?,
      liveOpenDate: json['liveOpenDate'] as String?,
      vodStatus: json['vodStatus'] as String?,
      liveRewindPlaybackJson:
          _$JsonConverterFromJson<String, LiveRewindPlaybackJson>(
              json['liveRewindPlaybackJson'],
              const LiveRewindPlaybackConverter().fromJson),
      userAdultStatus: json['userAdultStatus'] as String?,
      videoChatEnabled: json['videoChatEnabled'] as bool?,
      videoChatChannelId: json['videoChatChannelId'] as String?,
    );

Map<String, dynamic> _$VodToJson(Vod instance) => <String, dynamic>{
      'videoNo': instance.videoNo,
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'videoType': instance.videoType,
      'publishDate': instance.publishDate,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'trailerUrl': instance.trailerUrl,
      'duration': instance.duration,
      'readCount': instance.readCount,
      'publishDateAt': instance.publishDateAt,
      'categoryType': instance.categoryType,
      'videoCategory': instance.videoCategory,
      'videoCategoryValue': instance.videoCategoryValue,
      'exposure': instance.exposure,
      'adult': instance.adult,
      'clipActive': instance.clipActive,
      'livePv': instance.livePv,
      'tags': instance.tags,
      'channel': instance.channel?.toJson(),
      'blindType': instance.blindType,
      'watchTimeline': instance.watchTimeline,
      'paidPromotion': instance.paidPromotion,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'vodStatus': instance.vodStatus,
      'liveRewindPlaybackJson':
          _$JsonConverterToJson<String, LiveRewindPlaybackJson>(
              instance.liveRewindPlaybackJson,
              const LiveRewindPlaybackConverter().toJson),
      'userAdultStatus': instance.userAdultStatus,
      'videoChatEnabled': instance.videoChatEnabled,
      'videoChatChannelId': instance.videoChatChannelId,
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
