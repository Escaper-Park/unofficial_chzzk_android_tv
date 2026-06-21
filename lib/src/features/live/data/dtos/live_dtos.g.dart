// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveListDto _$LiveListDtoFromJson(Map<String, dynamic> json) => _LiveListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => LiveDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <LiveDto>[],
  page: json['page'] == null
      ? null
      : LivePageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$LiveListDtoToJson(_LiveListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
    };

_LivePageDto _$LivePageDtoFromJson(Map<String, dynamic> json) => _LivePageDto(
  next: json['next'] == null
      ? null
      : LivePageNextDto.fromJson(json['next'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LivePageDtoToJson(_LivePageDto instance) =>
    <String, dynamic>{'next': instance.next};

_LivePageNextDto _$LivePageNextDtoFromJson(Map<String, dynamic> json) =>
    _LivePageNextDto(
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt(),
      liveId: (json['liveId'] as num?)?.toInt(),
    );

Map<String, dynamic> _$LivePageNextDtoToJson(_LivePageNextDto instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };

_LiveDto _$LiveDtoFromJson(Map<String, dynamic> json) => _LiveDto(
  liveId: (json['liveId'] as num?)?.toInt() ?? 0,
  liveTitle: json['liveTitle'] as String? ?? '',
  liveImageUrl: json['liveImageUrl'] as String?,
  defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
  openDate: json['openDate'] as String?,
  adult: json['adult'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  liveCategoryValue: json['liveCategoryValue'] as String?,
  channel: json['channel'] == null
      ? null
      : LiveChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
  blindType: json['blindType'] as String?,
  watchPartyTag: json['watchPartyTag'] as String?,
  watchPartyType: json['watchPartyType'] as String?,
  membershipBenefitType: json['membershipBenefitType'] as String?,
  party: json['party'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$LiveDtoToJson(_LiveDto instance) => <String, dynamic>{
  'liveId': instance.liveId,
  'liveTitle': instance.liveTitle,
  'liveImageUrl': instance.liveImageUrl,
  'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
  'concurrentUserCount': instance.concurrentUserCount,
  'openDate': instance.openDate,
  'adult': instance.adult,
  'tags': instance.tags,
  'liveCategoryValue': instance.liveCategoryValue,
  'channel': instance.channel,
  'blindType': instance.blindType,
  'watchPartyTag': instance.watchPartyTag,
  'watchPartyType': instance.watchPartyType,
  'membershipBenefitType': instance.membershipBenefitType,
  'party': instance.party,
};

_LiveStatusDto _$LiveStatusDtoFromJson(Map<String, dynamic> json) =>
    _LiveStatusDto(
      liveTitle: json['liveTitle'] as String? ?? '',
      status: json['status'] as String? ?? '',
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
      adult: json['adult'] as bool? ?? false,
      openDate: json['openDate'] as String?,
      chatChannelId: json['chatChannelId'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      liveCategoryValue: json['liveCategoryValue'] as String?,
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      userAdultStatus: json['userAdultStatus'] as String?,
      blindType: json['blindType'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      watchPartyType: json['watchPartyType'] as String?,
      channelId: json['channelId'] as String?,
      krOnlyViewing: json['krOnlyViewing'] as bool? ?? false,
      timeMachineActive: json['timeMachineActive'] as bool? ?? false,
      membershipBenefitType: json['membershipBenefitType'] as String?,
      liveTokenList: (json['liveTokenList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$LiveStatusDtoToJson(_LiveStatusDto instance) =>
    <String, dynamic>{
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'concurrentUserCount': instance.concurrentUserCount,
      'adult': instance.adult,
      'openDate': instance.openDate,
      'chatChannelId': instance.chatChannelId,
      'tags': instance.tags,
      'liveCategoryValue': instance.liveCategoryValue,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'userAdultStatus': instance.userAdultStatus,
      'blindType': instance.blindType,
      'watchPartyTag': instance.watchPartyTag,
      'watchPartyType': instance.watchPartyType,
      'channelId': instance.channelId,
      'krOnlyViewing': instance.krOnlyViewing,
      'timeMachineActive': instance.timeMachineActive,
      'membershipBenefitType': instance.membershipBenefitType,
      'liveTokenList': instance.liveTokenList,
    };

_LiveDetailDto _$LiveDetailDtoFromJson(Map<String, dynamic> json) =>
    _LiveDetailDto(
      liveId: (json['liveId'] as num?)?.toInt() ?? 0,
      liveTitle: json['liveTitle'] as String? ?? '',
      status: json['status'] as String? ?? '',
      liveImageUrl: json['liveImageUrl'] as String?,
      defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
      openDate: json['openDate'] as String?,
      adult: json['adult'] as bool? ?? false,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      chatChannelId: json['chatChannelId'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      categoryType: json['categoryType'] as String?,
      liveCategory: json['liveCategory'] as String?,
      livePlaybackJson: json['livePlaybackJson'] as String?,
      channel: json['channel'] == null
          ? null
          : LiveChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
      userAdultStatus: json['userAdultStatus'] as String?,
      blindType: json['blindType'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      watchPartyType: json['watchPartyType'] as String?,
      timeMachineActive: json['timeMachineActive'] as bool? ?? false,
      timeMachinePlayback: json['timeMachinePlayback'] as bool? ?? false,
      membershipBenefitType: json['membershipBenefitType'] as String?,
      party: json['party'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$LiveDetailDtoToJson(_LiveDetailDto instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'status': instance.status,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'openDate': instance.openDate,
      'adult': instance.adult,
      'tags': instance.tags,
      'chatChannelId': instance.chatChannelId,
      'liveCategoryValue': instance.liveCategoryValue,
      'categoryType': instance.categoryType,
      'liveCategory': instance.liveCategory,
      'livePlaybackJson': instance.livePlaybackJson,
      'channel': instance.channel,
      'userAdultStatus': instance.userAdultStatus,
      'blindType': instance.blindType,
      'watchPartyTag': instance.watchPartyTag,
      'watchPartyType': instance.watchPartyType,
      'timeMachineActive': instance.timeMachineActive,
      'timeMachinePlayback': instance.timeMachinePlayback,
      'membershipBenefitType': instance.membershipBenefitType,
      'party': instance.party,
    };

_LiveChannelDto _$LiveChannelDtoFromJson(Map<String, dynamic> json) =>
    _LiveChannelDto(
      channelId: json['channelId'] as String? ?? '',
      channelName: json['channelName'] as String? ?? '',
      channelImageUrl: json['channelImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool? ?? false,
      activatedChannelBadgeIds:
          (json['activatedChannelBadgeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      personalData: json['personalData'] == null
          ? null
          : LiveChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$LiveChannelDtoToJson(_LiveChannelDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
    };

_LiveChannelPersonalDataDto _$LiveChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _LiveChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : LiveChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$LiveChannelPersonalDataDtoToJson(
  _LiveChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_LiveChannelPersonalFollowingDto _$LiveChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _LiveChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$LiveChannelPersonalFollowingDtoToJson(
  _LiveChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
