// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Live _$LiveFromJson(Map<String, dynamic> json) => Live(
      json['liveTitle'] as String,
      json['status'] as String,
      json['concurrentUserCount'] as int,
      json['accumulateCount'] as int,
      json['paidPromotion'] as bool,
      json['adult'] as bool,
      json['chatChannelId'] as String?,
      json['categoryType'] as String?,
      json['liveCategory'] as String?,
      json['liveCategoryValue'] as String?,
      const LivePollingStatusConverter()
          .fromJson(json['livePollingStatusJson'] as String),
      json['userAdultStatus'] as String?,
    );

Map<String, dynamic> _$LiveToJson(Live instance) => <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'paidPromotion': instance.paidPromotion,
      'adult': instance.adult,
      'chatChannelId': instance.chatChannelId,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'livePollingStatusJson':
          const LivePollingStatusConverter().toJson(instance.livePollingStatus),
      'userAdultStatus': instance.userAdultStatus,
    };

LiveStatus _$LiveStatusFromJson(Map<String, dynamic> json) => LiveStatus(
      json['liveTitle'] as String,
      json['status'] as String,
      json['concurrentUserCount'] as int,
      json['accumulateCount'] as int,
      json['paidPromotion'] as bool,
      json['adult'] as bool,
      json['chatChannelId'] as String?,
      json['categoryType'] as String?,
      json['liveCategory'] as String?,
      json['liveCategoryValue'] as String?,
      const LivePollingStatusConverter()
          .fromJson(json['livePollingStatusJson'] as String),
      json['userAdultStatus'] as String?,
      json['faultStatus'] as String?,
    );

Map<String, dynamic> _$LiveStatusToJson(LiveStatus instance) =>
    <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'paidPromotion': instance.paidPromotion,
      'adult': instance.adult,
      'chatChannelId': instance.chatChannelId,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'livePollingStatusJson':
          const LivePollingStatusConverter().toJson(instance.livePollingStatus),
      'userAdultStatus': instance.userAdultStatus,
      'faultStatus': instance.faultStatus,
    };

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) => LiveDetail(
      json['liveTitle'] as String,
      json['status'] as String,
      json['concurrentUserCount'] as int,
      json['accumulateCount'] as int,
      json['paidPromotion'] as bool,
      json['adult'] as bool,
      json['chatChannelId'] as String?,
      json['categoryType'] as String?,
      json['liveCategory'] as String?,
      json['liveCategoryValue'] as String?,
      const LivePollingStatusConverter()
          .fromJson(json['livePollingStatusJson'] as String),
      json['userAdultStatus'] as String?,
      json['liveId'] as int,
      json['liveImageUrl'] as String?,
      json['defaultThumbnailImageUrl'] as String?,
      json['openDate'] as String,
      json['closeDate'] as String?,
      json['chatActive'] as bool,
      json['chatAvailableGroup'] as String,
      json['chatAvailableCondition'] as String,
      json['minFollowerMinute'] as int,
      ChannelWithPersonalData.fromJson(json['channel'] as Map<String, dynamic>),
      const LivePlaybackConverter()
          .fromJson(json['livePlaybackJson'] as String),
    );

Map<String, dynamic> _$LiveDetailToJson(LiveDetail instance) =>
    <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'paidPromotion': instance.paidPromotion,
      'adult': instance.adult,
      'chatChannelId': instance.chatChannelId,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'livePollingStatusJson':
          const LivePollingStatusConverter().toJson(instance.livePollingStatus),
      'userAdultStatus': instance.userAdultStatus,
      'liveId': instance.liveId,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'chatActive': instance.chatActive,
      'chatAvailableGroup': instance.chatAvailableGroup,
      'chatAvailableCondition': instance.chatAvailableCondition,
      'minFollowerMinute': instance.minFollowerMinute,
      'channel': instance.channel,
      'livePlaybackJson':
          const LivePlaybackConverter().toJson(instance.livePlayback),
    };

LivePollingStatus _$LivePollingStatusFromJson(Map<String, dynamic> json) =>
    LivePollingStatus(
      json['status'] as String,
      json['isPublishing'] as bool,
      json['playableStatus'] as String,
      json['trafficThrottling'] as int,
      json['callPeriodMilliSecond'] as int,
    );

Map<String, dynamic> _$LivePollingStatusToJson(LivePollingStatus instance) =>
    <String, dynamic>{
      'status': instance.status,
      'isPublishing': instance.isPublishing,
      'playableStatus': instance.playableStatus,
      'trafficThrottling': instance.trafficThrottling,
      'callPeriodMilliSecond': instance.callPeriodMilliSecond,
    };
