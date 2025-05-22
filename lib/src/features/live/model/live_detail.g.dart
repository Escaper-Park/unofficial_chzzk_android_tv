// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_detail.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveDetail _$LiveDetailFromJson(Map<String, dynamic> json) => LiveDetail(
      liveId: (json['liveId'] as num).toInt(),
      liveTitle: json['liveTitle'] as String,
      status: json['status'] as String,
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      accumulateCount: (json['accumulateCount'] as num).toInt(),
      openDate: json['openDate'] as String?,
      closeDate: json['closeDate'] as String?,
      adult: json['adult'] as bool,
      krOnlyViewing: json['krOnlyViewing'] as bool,
      clipActive: json['clipActive'] as bool,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      chatChannelId: json['chatChannelId'] as String,
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      chatActive: json['chatActive'] as bool,
      chatAvailableGroup: json['chatAvailableGroup'] as String?,
      paidProduct: json['paidProduct'] as bool?,
      paidPromotion: json['paidPromotion'] as bool,
      chatAvailableCondition: json['chatAvailableCondition'] as String?,
      minFollowerMinute: (json['minFollowerMinute'] as num?)?.toInt(),
      allowSubscriberInFollowerMode:
          json['allowSubscriberInFollowerMode'] as bool,
      livePlaybackJson: const LivePlaybackConverter()
          .fromJson(json['livePlaybackJson'] as String),
      p2pQuality: (json['p2pQuality'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      timeMachineActive: json['timeMachineActive'] as bool,
      timeMachinePlayback: json['timeMachinePlayback'] as bool,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      userAdultStatus: json['userAdultStatus'] as String?,
      blindType: json['blindType'] as String?,
      watchPartyNo: (json['watchPartyNo'] as num?)?.toInt(),
      watchPartyTag: json['watchPartyTag'] as String?,
    );

Map<String, dynamic> _$LiveDetailToJson(LiveDetail instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'openDate': instance.openDate,
      'closeDate': instance.closeDate,
      'adult': instance.adult,
      'krOnlyViewing': instance.krOnlyViewing,
      'clipActive': instance.clipActive,
      'tags': instance.tags,
      'chatChannelId': instance.chatChannelId,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'chatActive': instance.chatActive,
      'chatAvailableGroup': instance.chatAvailableGroup,
      'paidProduct': instance.paidProduct,
      'paidPromotion': instance.paidPromotion,
      'chatAvailableCondition': instance.chatAvailableCondition,
      'minFollowerMinute': instance.minFollowerMinute,
      'allowSubscriberInFollowerMode': instance.allowSubscriberInFollowerMode,
      'livePlaybackJson':
          const LivePlaybackConverter().toJson(instance.livePlaybackJson),
      'p2pQuality': instance.p2pQuality,
      'timeMachineActive': instance.timeMachineActive,
      'timeMachinePlayback': instance.timeMachinePlayback,
      'channel': instance.channel.toJson(),
      'userAdultStatus': instance.userAdultStatus,
      'blindType': instance.blindType,
      'watchPartyNo': instance.watchPartyNo,
      'watchPartyTag': instance.watchPartyTag,
    };
