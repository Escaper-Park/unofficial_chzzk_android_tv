// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FollowingChannelListDto _$FollowingChannelListDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingChannelListDto(
  followingList:
      (json['followingList'] as List<dynamic>?)
          ?.map((e) => FollowingChannelDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingChannelDto>[],
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  totalPage: (json['totalPage'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$FollowingChannelListDtoToJson(
  _FollowingChannelListDto instance,
) => <String, dynamic>{
  'followingList': instance.followingList,
  'totalCount': instance.totalCount,
  'totalPage': instance.totalPage,
};

_FollowingLiveListDto _$FollowingLiveListDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingLiveListDto(
  followingList:
      (json['followingList'] as List<dynamic>?)
          ?.map((e) => FollowingChannelDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingChannelDto>[],
  totalCount: (json['totalCount'] as num?)?.toInt(),
  totalLiveCount: (json['totalLiveCount'] as num?)?.toInt(),
  totalPage: (json['totalPage'] as num?)?.toInt(),
);

Map<String, dynamic> _$FollowingLiveListDtoToJson(
  _FollowingLiveListDto instance,
) => <String, dynamic>{
  'followingList': instance.followingList,
  'totalCount': instance.totalCount,
  'totalLiveCount': instance.totalLiveCount,
  'totalPage': instance.totalPage,
};

_FollowingChannelDto _$FollowingChannelDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingChannelDto(
  channel: json['channel'] == null
      ? null
      : FollowingChannelInfoDto.fromJson(
          json['channel'] as Map<String, dynamic>,
        ),
  channelId: json['channelId'] as String? ?? '',
  liveInfo: json['liveInfo'] == null
      ? null
      : FollowingLiveInfoDto.fromJson(json['liveInfo'] as Map<String, dynamic>),
  streamer: json['streamer'] == null
      ? null
      : FollowingStreamerDto.fromJson(json['streamer'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FollowingChannelDtoToJson(
  _FollowingChannelDto instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'channelId': instance.channelId,
  'liveInfo': instance.liveInfo,
  'streamer': instance.streamer,
};

_FollowingLiveInfoDto _$FollowingLiveInfoDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingLiveInfoDto(
  liveId: (json['liveId'] as num?)?.toInt(),
  liveTitle: json['liveTitle'] as String?,
  liveImageUrl: json['liveImageUrl'] as String?,
  defaultThumbnailImageUrl: json['defaultThumbnailImageUrl'] as String?,
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
  adult: json['adult'] as bool? ?? false,
  tags:
      (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
      const <String>[],
  liveCategoryValue: json['liveCategoryValue'] as String?,
  blindType: json['blindType'] as String?,
  watchPartyTag: json['watchPartyTag'] as String?,
  watchPartyType: json['watchPartyType'] as String?,
  party: json['party'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$FollowingLiveInfoDtoToJson(
  _FollowingLiveInfoDto instance,
) => <String, dynamic>{
  'liveId': instance.liveId,
  'liveTitle': instance.liveTitle,
  'liveImageUrl': instance.liveImageUrl,
  'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
  'concurrentUserCount': instance.concurrentUserCount,
  'adult': instance.adult,
  'tags': instance.tags,
  'liveCategoryValue': instance.liveCategoryValue,
  'blindType': instance.blindType,
  'watchPartyTag': instance.watchPartyTag,
  'watchPartyType': instance.watchPartyType,
  'party': instance.party,
};

_FollowingStreamerDto _$FollowingStreamerDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingStreamerDto(openLive: json['openLive'] as bool? ?? false);

Map<String, dynamic> _$FollowingStreamerDtoToJson(
  _FollowingStreamerDto instance,
) => <String, dynamic>{'openLive': instance.openLive};

_FollowingChannelInfoDto _$FollowingChannelInfoDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingChannelInfoDto(
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
      : FollowingChannelPersonalDataDto.fromJson(
          json['personalData'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$FollowingChannelInfoDtoToJson(
  _FollowingChannelInfoDto instance,
) => <String, dynamic>{
  'channelId': instance.channelId,
  'channelName': instance.channelName,
  'channelImageUrl': instance.channelImageUrl,
  'verifiedMark': instance.verifiedMark,
  'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
  'personalData': instance.personalData,
};

_FollowingChannelPersonalDataDto _$FollowingChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : FollowingChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$FollowingChannelPersonalDataDtoToJson(
  _FollowingChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_FollowingChannelPersonalFollowingDto
_$FollowingChannelPersonalFollowingDtoFromJson(Map<String, dynamic> json) =>
    _FollowingChannelPersonalFollowingDto(
      following: json['following'] as bool? ?? false,
      notification: json['notification'] as bool? ?? false,
      followDate: json['followDate'] as String?,
    );

Map<String, dynamic> _$FollowingChannelPersonalFollowingDtoToJson(
  _FollowingChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
