// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_status.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveStatus _$LiveStatusFromJson(Map<String, dynamic> json) => LiveStatus(
      liveTitle: json['liveTitle'] as String,
      status: json['status'] as String,
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      accumulateCount: (json['accumulateCount'] as num).toInt(),
      paidPromotion: json['paidPromotion'] as bool,
      adult: json['adult'] as bool,
      krOnlyViewing: json['krOnlyViewing'] as bool,
      openDate: json['openDate'] as String?,
      closeDate: json['closeDate'] as String?,
      clipActive: json['clipActive'] as bool,
      chatChannelId: json['chatChannelId'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      faultStatus: json['faultStatus'],
      userAdultStatus: json['userAdultStatus'] as String?,
      abroadCountry: json['abroadCountry'] as bool,
      blindType: json['blindType'] as String?,
      chatActive: json['chatActive'] as bool,
      chatAvailableGroup: json['chatAvailableGroup'] as String?,
      chatAvailableCondition: json['chatAvailableCondition'] as String?,
      minFollowerMinute: (json['minFollowerMinute'] as num?)?.toInt(),
      allowSubscriberInFollowerMode:
          json['allowSubscriberInFollowerMode'] as bool,
      chatSlowModeSec: (json['chatSlowModeSec'] as num).toInt(),
      chatEmojiMode: json['chatEmojiMode'] as bool,
      chatDonationRankingExposure: json['chatDonationRankingExposure'] as bool,
      watchPartyNo: (json['watchPartyNo'] as num?)?.toInt(),
      watchPartyTag: json['watchPartyTag'] as String?,
      timeMachineActive: json['timeMachineActive'] as bool,
      channelId: json['channelId'] as String,
    );

Map<String, dynamic> _$LiveStatusToJson(LiveStatus instance) =>
    <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'paidPromotion': instance.paidPromotion,
      'adult': instance.adult,
      'krOnlyViewing': instance.krOnlyViewing,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'clipActive': instance.clipActive,
      'chatChannelId': instance.chatChannelId,
      'tags': instance.tags,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'faultStatus': instance.faultStatus,
      'userAdultStatus': instance.userAdultStatus,
      'abroadCountry': instance.abroadCountry,
      'blindType': instance.blindType,
      'chatActive': instance.chatActive,
      'chatAvailableGroup': instance.chatAvailableGroup,
      'chatAvailableCondition': instance.chatAvailableCondition,
      'minFollowerMinute': instance.minFollowerMinute,
      'allowSubscriberInFollowerMode': instance.allowSubscriberInFollowerMode,
      'chatSlowModeSec': instance.chatSlowModeSec,
      'chatEmojiMode': instance.chatEmojiMode,
      'chatDonationRankingExposure': instance.chatDonationRankingExposure,
      'watchPartyNo': instance.watchPartyNo,
      'watchPartyTag': instance.watchPartyTag,
      'timeMachineActive': instance.timeMachineActive,
      'channelId': instance.channelId,
    };
