// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_results_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchTagLiveListDto _$SearchTagLiveListDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagLiveListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SearchTagLiveDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SearchTagLiveDto>[],
  page: json['page'] == null
      ? null
      : SearchTagLivePageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SearchTagLiveListDtoToJson(
  _SearchTagLiveListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_SearchTagLivePageDto _$SearchTagLivePageDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagLivePageDto(
  next: json['next'] == null
      ? null
      : SearchTagLivePageNextDto.fromJson(json['next'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchTagLivePageDtoToJson(
  _SearchTagLivePageDto instance,
) => <String, dynamic>{'next': instance.next};

_SearchTagLivePageNextDto _$SearchTagLivePageNextDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagLivePageNextDto(
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt(),
  liveId: (json['liveId'] as num?)?.toInt(),
);

Map<String, dynamic> _$SearchTagLivePageNextDtoToJson(
  _SearchTagLivePageNextDto instance,
) => <String, dynamic>{
  'concurrentUserCount': instance.concurrentUserCount,
  'liveId': instance.liveId,
};

_SearchTagVideoListDto _$SearchTagVideoListDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagVideoListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => SearchTagVideoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SearchTagVideoDto>[],
  page: json['page'] == null
      ? null
      : SearchTagVideoPageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SearchTagVideoListDtoToJson(
  _SearchTagVideoListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_SearchTagVideoPageDto _$SearchTagVideoPageDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagVideoPageDto(
  next: json['next'] == null
      ? null
      : SearchTagVideoPageNextDto.fromJson(
          json['next'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SearchTagVideoPageDtoToJson(
  _SearchTagVideoPageDto instance,
) => <String, dynamic>{'next': instance.next};

_SearchTagVideoPageNextDto _$SearchTagVideoPageNextDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagVideoPageNextDto(start: (json['start'] as num?)?.toInt());

Map<String, dynamic> _$SearchTagVideoPageNextDtoToJson(
  _SearchTagVideoPageNextDto instance,
) => <String, dynamic>{'start': instance.start};

_SearchTagLiveDto _$SearchTagLiveDtoFromJson(Map<String, dynamic> json) =>
    _SearchTagLiveDto(
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
          : SearchTagChannelDto.fromJson(
              json['channel'] as Map<String, dynamic>,
            ),
      blindType: json['blindType'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      watchPartyType: json['watchPartyType'] as String?,
      party: json['party'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchTagLiveDtoToJson(_SearchTagLiveDto instance) =>
    <String, dynamic>{
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
      'party': instance.party,
    };

_SearchTagVideoDto _$SearchTagVideoDtoFromJson(Map<String, dynamic> json) =>
    _SearchTagVideoDto(
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
          : SearchTagChannelDto.fromJson(
              json['channel'] as Map<String, dynamic>,
            ),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchTagVideoDtoToJson(_SearchTagVideoDto instance) =>
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

_SearchTagChannelDto _$SearchTagChannelDtoFromJson(Map<String, dynamic> json) =>
    _SearchTagChannelDto(
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
          : SearchTagChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchTagChannelDtoToJson(
  _SearchTagChannelDto instance,
) => <String, dynamic>{
  'channelId': instance.channelId,
  'channelName': instance.channelName,
  'channelImageUrl': instance.channelImageUrl,
  'verifiedMark': instance.verifiedMark,
  'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
  'personalData': instance.personalData,
};

_SearchTagChannelPersonalDataDto _$SearchTagChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _SearchTagChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : SearchTagChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$SearchTagChannelPersonalDataDtoToJson(
  _SearchTagChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_SearchTagChannelPersonalFollowingDto
_$SearchTagChannelPersonalFollowingDtoFromJson(Map<String, dynamic> json) =>
    _SearchTagChannelPersonalFollowingDto(
      following: json['following'] as bool? ?? false,
      notification: json['notification'] as bool? ?? false,
      followDate: json['followDate'] as String?,
    );

Map<String, dynamic> _$SearchTagChannelPersonalFollowingDtoToJson(
  _SearchTagChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
