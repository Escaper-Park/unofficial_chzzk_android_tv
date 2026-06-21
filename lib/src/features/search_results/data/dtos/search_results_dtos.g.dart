// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_results_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SearchChannelListDto _$SearchChannelListDtoFromJson(
  Map<String, dynamic> json,
) => _SearchChannelListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map(
            (e) => SearchChannelResultDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <SearchChannelResultDto>[],
  page: json['page'] == null
      ? null
      : SearchPageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
  totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
  totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$SearchChannelListDtoToJson(
  _SearchChannelListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
  'totalCount': instance.totalCount,
  'totalPages': instance.totalPages,
};

_SearchVideoListDto _$SearchVideoListDtoFromJson(Map<String, dynamic> json) =>
    _SearchVideoListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => SearchVideoResultDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <SearchVideoResultDto>[],
      page: json['page'] == null
          ? null
          : SearchPageDto.fromJson(json['page'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchVideoListDtoToJson(_SearchVideoListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
    };

_SearchLiveListDto _$SearchLiveListDtoFromJson(Map<String, dynamic> json) =>
    _SearchLiveListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map(
                (e) => SearchLiveResultDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <SearchLiveResultDto>[],
      page: json['page'] == null
          ? null
          : SearchPageDto.fromJson(json['page'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt() ?? 0,
      totalCount: (json['totalCount'] as num?)?.toInt() ?? 0,
      totalPages: (json['totalPages'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$SearchLiveListDtoToJson(_SearchLiveListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
    };

_SearchPageDto _$SearchPageDtoFromJson(Map<String, dynamic> json) =>
    _SearchPageDto(
      next: json['next'] == null
          ? null
          : SearchPageNextDto.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchPageDtoToJson(_SearchPageDto instance) =>
    <String, dynamic>{'next': instance.next};

_SearchPageNextDto _$SearchPageNextDtoFromJson(Map<String, dynamic> json) =>
    _SearchPageNextDto(offset: (json['offset'] as num?)?.toInt());

Map<String, dynamic> _$SearchPageNextDtoToJson(_SearchPageNextDto instance) =>
    <String, dynamic>{'offset': instance.offset};

_SearchChannelResultDto _$SearchChannelResultDtoFromJson(
  Map<String, dynamic> json,
) => _SearchChannelResultDto(
  channel: json['channel'] == null
      ? null
      : SearchChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
  content: json['content'] == null
      ? null
      : SearchChannelContentDto.fromJson(
          json['content'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$SearchChannelResultDtoToJson(
  _SearchChannelResultDto instance,
) => <String, dynamic>{
  'channel': instance.channel,
  'content': instance.content,
};

_SearchVideoResultDto _$SearchVideoResultDtoFromJson(
  Map<String, dynamic> json,
) => _SearchVideoResultDto(
  channel: json['channel'] == null
      ? null
      : SearchChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
  video: json['video'] == null
      ? null
      : SearchVideoDto.fromJson(json['video'] as Map<String, dynamic>),
);

Map<String, dynamic> _$SearchVideoResultDtoToJson(
  _SearchVideoResultDto instance,
) => <String, dynamic>{'channel': instance.channel, 'video': instance.video};

_SearchLiveResultDto _$SearchLiveResultDtoFromJson(Map<String, dynamic> json) =>
    _SearchLiveResultDto(
      channel: json['channel'] == null
          ? null
          : SearchChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
      live: json['live'] == null
          ? null
          : SearchLiveDto.fromJson(json['live'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchLiveResultDtoToJson(
  _SearchLiveResultDto instance,
) => <String, dynamic>{'channel': instance.channel, 'live': instance.live};

_SearchChannelContentDto _$SearchChannelContentDtoFromJson(
  Map<String, dynamic> json,
) => _SearchChannelContentDto(
  live: json['live'] == null
      ? null
      : SearchLiveDto.fromJson(json['live'] as Map<String, dynamic>),
  videos:
      (json['videos'] as List<dynamic>?)
          ?.map((e) => SearchVideoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <SearchVideoDto>[],
);

Map<String, dynamic> _$SearchChannelContentDtoToJson(
  _SearchChannelContentDto instance,
) => <String, dynamic>{'live': instance.live, 'videos': instance.videos};

_SearchLiveDto _$SearchLiveDtoFromJson(Map<String, dynamic> json) =>
    _SearchLiveDto(
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
      chatChannelId: json['chatChannelId'] as String?,
      liveCategoryValue: json['liveCategoryValue'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      watchPartyType: json['watchPartyType'] as String?,
      channelId: json['channelId'] as String?,
      livePlaybackJson: json['livePlaybackJson'] as String?,
      party: json['party'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$SearchLiveDtoToJson(_SearchLiveDto instance) =>
    <String, dynamic>{
      'liveId': instance.liveId,
      'liveTitle': instance.liveTitle,
      'liveImageUrl': instance.liveImageUrl,
      'defaultThumbnailImageUrl': instance.defaultThumbnailImageUrl,
      'concurrentUserCount': instance.concurrentUserCount,
      'openDate': instance.openDate,
      'adult': instance.adult,
      'tags': instance.tags,
      'chatChannelId': instance.chatChannelId,
      'liveCategoryValue': instance.liveCategoryValue,
      'watchPartyTag': instance.watchPartyTag,
      'watchPartyType': instance.watchPartyType,
      'channelId': instance.channelId,
      'livePlaybackJson': instance.livePlaybackJson,
      'party': instance.party,
    };

_SearchVideoDto _$SearchVideoDtoFromJson(Map<String, dynamic> json) =>
    _SearchVideoDto(
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
          : SearchChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$SearchVideoDtoToJson(_SearchVideoDto instance) =>
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

_SearchChannelDto _$SearchChannelDtoFromJson(Map<String, dynamic> json) =>
    _SearchChannelDto(
      channelId: json['channelId'] as String? ?? '',
      channelName: json['channelName'] as String? ?? '',
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
          : SearchChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$SearchChannelDtoToJson(_SearchChannelDto instance) =>
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

_SearchChannelPersonalDataDto _$SearchChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _SearchChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : SearchChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$SearchChannelPersonalDataDtoToJson(
  _SearchChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_SearchChannelPersonalFollowingDto _$SearchChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _SearchChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$SearchChannelPersonalFollowingDtoToJson(
  _SearchChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
