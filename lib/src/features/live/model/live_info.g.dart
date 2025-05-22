// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_info.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveInfo _$LiveInfoFromJson(Map<String, dynamic> json) => LiveInfo(
      liveId: (json['liveId'] as num?)?.toInt(),
      liveTitle: json['liveTitle'] as String?,
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
      accumulateCount: (json['accumulateCount'] as num?)?.toInt(),
      openDate: json['openDate'] as String?,
      adult: json['adult'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'] as String?,
    );

Map<String, dynamic> _$LiveInfoToJson(LiveInfo instance) => <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'openDate': instance.openDate,
      'adult': instance.adult,
      'tags': instance.tags,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'watchPartyTag': instance.watchPartyTag,
      'channel': instance.channel,
      'blindType': instance.blindType,
    };
