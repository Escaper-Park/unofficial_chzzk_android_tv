// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveInfoImpl _$$LiveInfoImplFromJson(Map<String, dynamic> json) =>
    _$LiveInfoImpl(
      liveId: (json['liveId'] as num?)?.toInt(),
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      liveTitle: json['liveTitle'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      adult: json['adult'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      openDate: json['openDate'] as String?,
      accumulateCount: (json['accumulateCount'] as num?)?.toInt(),
      blindType: json['blindType'],
      channel: json['channel'] == null
          ? null
          : Channel.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LiveInfoImplToJson(_$LiveInfoImpl instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'liveTitle': instance.liveTitle,
      'concurrentUserCount': instance.concurrentUserCount,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'adult': instance.adult,
      'tags': instance.tags,
      'openDate': instance.openDate,
      'accumulateCount': instance.accumulateCount,
      'blindType': instance.blindType,
      'channel': instance.channel,
    };

_$LiveDetailImpl _$$LiveDetailImplFromJson(Map<String, dynamic> json) =>
    _$LiveDetailImpl(
      liveId: (json['liveId'] as num).toInt(),
      liveTitle: json['liveTitle'] as String?,
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      accumulateCount: (json['accumulateCount'] as num).toInt(),
      openDate: json['openDate'] as String?,
      adult: json['adult'] as bool,
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      blindType: json['blindType'],
      status: json['status'] as String,
      closeDate: json['closeDate'] as String?,
      clipActive: json['clipActive'] as bool,
      chatChannelId: json['chatChannelId'] as String,
      chatActive: json['chatActive'] as bool,
      chatAvailableGroup: json['chatAvailableGroup'] as String?,
      paidPromotion: json['paidPromotion'] as bool,
      chatAvailableCondition: json['chatAvailableCondition'] as String?,
      minFollowerMinute: (json['minFollowerMinute'] as num).toInt(),
      p2pQuality: (json['p2pQuality'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      userAdultStatus: json['userAdultStatus'] as String?,
      chatDonationRankingExposure: json['chatDonationRankingExposure'] as bool,
      livePlaybackJson: const LivePlaybackConverter()
          .fromJson(json['livePlaybackJson'] as String),
    );

Map<String, dynamic> _$$LiveDetailImplToJson(_$LiveDetailImpl instance) =>
    <String, dynamic>{
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
      'blindType': instance.blindType,
      'status': instance.status,
      'closeDate': instance.closeDate,
      'clipActive': instance.clipActive,
      'chatChannelId': instance.chatChannelId,
      'chatActive': instance.chatActive,
      'chatAvailableGroup': instance.chatAvailableGroup,
      'paidPromotion': instance.paidPromotion,
      'chatAvailableCondition': instance.chatAvailableCondition,
      'minFollowerMinute': instance.minFollowerMinute,
      'p2pQuality': instance.p2pQuality,
      'channel': instance.channel,
      'userAdultStatus': instance.userAdultStatus,
      'chatDonationRankingExposure': instance.chatDonationRankingExposure,
      'livePlaybackJson':
          const LivePlaybackConverter().toJson(instance.livePlaybackJson),
    };

_$LiveResponseImpl _$$LiveResponseImplFromJson(Map<String, dynamic> json) =>
    _$LiveResponseImpl(
      size: (json['size'] as num).toInt(),
      next: _livePageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LiveResponseImplToJson(_$LiveResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };

_$LivePageImpl _$$LivePageImplFromJson(Map<String, dynamic> json) =>
    _$LivePageImpl(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      liveId: (json['liveId'] as num).toInt(),
    );

Map<String, dynamic> _$$LivePageImplToJson(_$LivePageImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };

_$LiveStatusImpl _$$LiveStatusImplFromJson(Map<String, dynamic> json) =>
    _$LiveStatusImpl(
      liveTitle: json['liveTitle'] as String,
      status: json['status'] as String,
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      accumulateCount: (json['accumulateCount'] as num).toInt(),
      paidPromotion: json['paidPromotion'] as bool,
      adult: json['adult'] as bool,
      krOnlyViewing: json['krOnlyViewing'] as bool,
      clipActive: json['clipActive'] as bool,
      chatChannelId: json['chatChannelId'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      userAdultStatus: json['userAdultStatus'] as String?,
      faultStatus: json['faultStatus'],
      blindType: json['blindType'],
      chatActive: json['chatActive'] as bool,
      chatAvailableGroup: json['chatAvailableGroup'] as String?,
      chatAvailableCondition: json['chatAvailableCondition'] as String?,
      minFollowerMinute: (json['minFollowerMinute'] as num?)?.toInt(),
      chatDonationRankingExposure: json['chatDonationRankingExposure'] as bool,
    );

Map<String, dynamic> _$$LiveStatusImplToJson(_$LiveStatusImpl instance) =>
    <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'accumulateCount': instance.accumulateCount,
      'paidPromotion': instance.paidPromotion,
      'adult': instance.adult,
      'krOnlyViewing': instance.krOnlyViewing,
      'clipActive': instance.clipActive,
      'chatChannelId': instance.chatChannelId,
      'tags': instance.tags,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'liveCategoryValue': instance.liveCategoryValue,
      'userAdultStatus': instance.userAdultStatus,
      'faultStatus': instance.faultStatus,
      'blindType': instance.blindType,
      'chatActive': instance.chatActive,
      'chatAvailableGroup': instance.chatAvailableGroup,
      'chatAvailableCondition': instance.chatAvailableCondition,
      'minFollowerMinute': instance.minFollowerMinute,
      'chatDonationRankingExposure': instance.chatDonationRankingExposure,
    };
