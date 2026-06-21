// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_HomeMainDto _$HomeMainDtoFromJson(Map<String, dynamic> json) => _HomeMainDto(
  topLives:
      (json['topLives'] as List<dynamic>?)
          ?.map((e) => HomeLiveDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <HomeLiveDto>[],
);

Map<String, dynamic> _$HomeMainDtoToJson(_HomeMainDto instance) =>
    <String, dynamic>{'topLives': instance.topLives};

_HomeLiveDto _$HomeLiveDtoFromJson(Map<String, dynamic> json) => _HomeLiveDto(
  liveId: (json['liveId'] as num?)?.toInt() ?? 0,
  liveTitle: json['liveTitle'] as String? ?? '',
  liveImageUrl: json['liveImageUrl'] as String?,
  defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
  adult: json['adult'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  openDate: json['openDate'] as String?,
  liveCategoryValue: json['liveCategoryValue'] as String?,
  channel: json['channel'] == null
      ? null
      : HomeChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
  blindType: json['blindType'] as String?,
  watchPartyTag: json['watchPartyTag'] as String?,
  watchPartyType: json['watchPartyType'] as String?,
  membershipBenefitType: json['membershipBenefitType'] as String?,
  party: json['party'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$HomeLiveDtoToJson(_HomeLiveDto instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'adult': instance.adult,
      'tags': instance.tags,
      'openDate': instance.openDate,
      'liveCategoryValue': instance.liveCategoryValue,
      'channel': instance.channel,
      'blindType': instance.blindType,
      'watchPartyTag': instance.watchPartyTag,
      'watchPartyType': instance.watchPartyType,
      'membershipBenefitType': instance.membershipBenefitType,
      'party': instance.party,
    };

_HomeChannelDto _$HomeChannelDtoFromJson(Map<String, dynamic> json) =>
    _HomeChannelDto(
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
          : HomeChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$HomeChannelDtoToJson(_HomeChannelDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
    };

_HomeChannelPersonalDataDto _$HomeChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _HomeChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : HomeChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$HomeChannelPersonalDataDtoToJson(
  _HomeChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_HomeChannelPersonalFollowingDto _$HomeChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _HomeChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$HomeChannelPersonalFollowingDtoToJson(
  _HomeChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
