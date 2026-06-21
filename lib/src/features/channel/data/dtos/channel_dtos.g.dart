// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'channel_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChannelDetailDto _$ChannelDetailDtoFromJson(Map<String, dynamic> json) =>
    _ChannelDetailDto(
      channelId: json['channelId'] as String,
      channelName: json['channelName'] as String,
      channelImageUrl: json['channelImageUrl'] as String?,
      verifiedMark: json['verifiedMark'] as bool? ?? false,
      followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
      channelDescription: json['channelDescription'] as String? ?? '',
      activatedChannelBadgeIds:
          (json['activatedChannelBadgeIds'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const <String>[],
      openLive: json['openLive'] as bool? ?? false,
      personalData: json['personalData'] == null
          ? null
          : ChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ChannelDetailDtoToJson(_ChannelDetailDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'followerCount': instance.followerCount,
      'channelDescription': instance.channelDescription,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'openLive': instance.openLive,
      'personalData': instance.personalData,
    };

_ChannelMyInfoDto _$ChannelMyInfoDtoFromJson(Map<String, dynamic> json) =>
    _ChannelMyInfoDto(
      channelId: json['channelId'] as String,
      following: json['following'] == null
          ? null
          : ChannelPersonalFollowingDto.fromJson(
              json['following'] as Map<String, dynamic>,
            ),
      cheatKey: json['cheatKey'] as bool? ?? false,
      naverMembership: json['naverMembership'] as bool? ?? false,
    );

Map<String, dynamic> _$ChannelMyInfoDtoToJson(_ChannelMyInfoDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'following': instance.following,
      'cheatKey': instance.cheatKey,
      'naverMembership': instance.naverMembership,
    };

_ChannelVideoListDto _$ChannelVideoListDtoFromJson(Map<String, dynamic> json) =>
    _ChannelVideoListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ChannelVideoDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <ChannelVideoDto>[],
      page: (json['page'] as num?)?.toInt() ?? 0,
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ChannelVideoListDtoToJson(
  _ChannelVideoListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
};

_ChannelVideoDto _$ChannelVideoDtoFromJson(Map<String, dynamic> json) =>
    _ChannelVideoDto(
      videoNo: (json['videoNo'] as num?)?.toInt() ?? 0,
      videoId: json['videoId'] as String?,
      videoTitle: json['videoTitle'] as String? ?? '',
      videoType: json['videoType'] as String? ?? '',
      publishDate: json['publishDate'] as String? ?? '',
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      duration: (json['duration'] as num?)?.toInt() ?? 0,
      readCount: (json['readCount'] as num?)?.toInt() ?? 0,
      publishDateAt: (json['publishDateAt'] as num?)?.toInt() ?? 0,
      videoCategoryValue: json['videoCategoryValue'] as String?,
      adult: json['adult'] as bool? ?? false,
      livePv: (json['livePv'] as num?)?.toInt() ?? 0,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
      channel: json['channel'] == null
          ? null
          : ChannelNestedDto.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChannelVideoDtoToJson(_ChannelVideoDto instance) =>
    <String, dynamic>{
      'videoNo': instance.videoNo,
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'videoType': instance.videoType,
      'publishDate': instance.publishDate,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'duration': instance.duration,
      'readCount': instance.readCount,
      'publishDateAt': instance.publishDateAt,
      'videoCategoryValue': instance.videoCategoryValue,
      'adult': instance.adult,
      'livePv': instance.livePv,
      'tags': instance.tags,
      'channel': instance.channel,
      'blindType': instance.blindType,
      'watchTimeline': instance.watchTimeline,
    };

_ChannelNestedDto _$ChannelNestedDtoFromJson(Map<String, dynamic> json) =>
    _ChannelNestedDto(
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
          : ChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$ChannelNestedDtoToJson(_ChannelNestedDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
    };

_ChannelPersonalDataDto _$ChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _ChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : ChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$ChannelPersonalDataDtoToJson(
  _ChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_ChannelPersonalFollowingDto _$ChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _ChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$ChannelPersonalFollowingDtoToJson(
  _ChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
