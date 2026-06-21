// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_history_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WatchingHistoryListDto _$WatchingHistoryListDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => WatchingHistoryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <WatchingHistoryDto>[],
  page: json['page'] == null
      ? null
      : WatchingHistoryPageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$WatchingHistoryListDtoToJson(
  _WatchingHistoryListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_WatchingHistoryPageDto _$WatchingHistoryPageDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryPageDto(
  next: json['next'] == null
      ? null
      : WatchingHistoryPageNextDto.fromJson(
          json['next'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WatchingHistoryPageDtoToJson(
  _WatchingHistoryPageDto instance,
) => <String, dynamic>{'next': instance.next};

_WatchingHistoryPageNextDto _$WatchingHistoryPageNextDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryPageNextDto(lastTime: (json['lastTime'] as num?)?.toInt());

Map<String, dynamic> _$WatchingHistoryPageNextDtoToJson(
  _WatchingHistoryPageNextDto instance,
) => <String, dynamic>{'lastTime': instance.lastTime};

_WatchingHistoryDto _$WatchingHistoryDtoFromJson(Map<String, dynamic> json) =>
    _WatchingHistoryDto(
      historyNo: json['historyNo'] as String? ?? '',
      channelId: json['channelId'] as String? ?? '',
      videoNo: (json['videoNo'] as num?)?.toInt() ?? 0,
      timeline: (json['timeline'] as num?)?.toInt() ?? 0,
      contentType: json['contentType'] as String? ?? '',
      date: json['date'] as String?,
      videoResponse: json['videoResponse'] == null
          ? null
          : WatchingHistoryVideoDto.fromJson(
              json['videoResponse'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$WatchingHistoryDtoToJson(_WatchingHistoryDto instance) =>
    <String, dynamic>{
      'historyNo': instance.historyNo,
      'channelId': instance.channelId,
      'videoNo': instance.videoNo,
      'timeline': instance.timeline,
      'contentType': instance.contentType,
      'date': instance.date,
      'videoResponse': instance.videoResponse,
    };

_WatchingHistoryVideoDto _$WatchingHistoryVideoDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryVideoDto(
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
      : WatchingHistoryChannelDto.fromJson(
          json['channel'] as Map<String, dynamic>,
        ),
  blindType: json['blindType'] as String?,
  watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
);

Map<String, dynamic> _$WatchingHistoryVideoDtoToJson(
  _WatchingHistoryVideoDto instance,
) => <String, dynamic>{
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

_WatchingHistoryChannelDto _$WatchingHistoryChannelDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryChannelDto(
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
      : WatchingHistoryChannelPersonalDataDto.fromJson(
          json['personalData'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$WatchingHistoryChannelDtoToJson(
  _WatchingHistoryChannelDto instance,
) => <String, dynamic>{
  'channelId': instance.channelId,
  'channelName': instance.channelName,
  'channelImageUrl': instance.channelImageUrl,
  'verifiedMark': instance.verifiedMark,
  'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
  'personalData': instance.personalData,
};

_WatchingHistoryChannelPersonalDataDto
_$WatchingHistoryChannelPersonalDataDtoFromJson(Map<String, dynamic> json) =>
    _WatchingHistoryChannelPersonalDataDto(
      following: json['following'] == null
          ? null
          : WatchingHistoryChannelPersonalFollowingDto.fromJson(
              json['following'] as Map<String, dynamic>,
            ),
      privateUserBlock: json['privateUserBlock'] as bool? ?? false,
    );

Map<String, dynamic> _$WatchingHistoryChannelPersonalDataDtoToJson(
  _WatchingHistoryChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_WatchingHistoryChannelPersonalFollowingDto
_$WatchingHistoryChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _WatchingHistoryChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$WatchingHistoryChannelPersonalFollowingDtoToJson(
  _WatchingHistoryChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
