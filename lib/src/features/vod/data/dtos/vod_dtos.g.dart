// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VodListDto _$VodListDtoFromJson(Map<String, dynamic> json) => _VodListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => VodDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <VodDto>[],
  page: json['page'] == null
      ? null
      : VodPageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$VodListDtoToJson(_VodListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
    };

_FollowingVodListDto _$FollowingVodListDtoFromJson(Map<String, dynamic> json) =>
    _FollowingVodListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => VodDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <VodDto>[],
      page: json['page'] == null
          ? null
          : FollowingVodPageDto.fromJson(json['page'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FollowingVodListDtoToJson(
  _FollowingVodListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_VodPageDto _$VodPageDtoFromJson(Map<String, dynamic> json) => _VodPageDto(
  next: json['next'] == null
      ? null
      : VodPageNextDto.fromJson(json['next'] as Map<String, dynamic>),
);

Map<String, dynamic> _$VodPageDtoToJson(_VodPageDto instance) =>
    <String, dynamic>{'next': instance.next};

_VodPageNextDto _$VodPageNextDtoFromJson(Map<String, dynamic> json) =>
    _VodPageNextDto(
      publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VodPageNextDtoToJson(_VodPageNextDto instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };

_FollowingVodPageDto _$FollowingVodPageDtoFromJson(Map<String, dynamic> json) =>
    _FollowingVodPageDto(
      next: json['next'] == null
          ? null
          : FollowingVodPageNextDto.fromJson(
              json['next'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$FollowingVodPageDtoToJson(
  _FollowingVodPageDto instance,
) => <String, dynamic>{'next': instance.next};

_FollowingVodPageNextDto _$FollowingVodPageNextDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingVodPageNextDto(nextNo: json['nextNo'] as String?);

Map<String, dynamic> _$FollowingVodPageNextDtoToJson(
  _FollowingVodPageNextDto instance,
) => <String, dynamic>{'nextNo': instance.nextNo};

_VodDto _$VodDtoFromJson(Map<String, dynamic> json) => _VodDto(
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
      : VodChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
  blindType: json['blindType'] as String?,
  watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
  userAdultStatus: json['userAdultStatus'] as String?,
  membershipBenefitType: json['membershipBenefitType'] as String?,
);

Map<String, dynamic> _$VodDtoToJson(_VodDto instance) => <String, dynamic>{
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
  'userAdultStatus': instance.userAdultStatus,
  'membershipBenefitType': instance.membershipBenefitType,
};

_VodDetailDto _$VodDetailDtoFromJson(Map<String, dynamic> json) =>
    _VodDetailDto(
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
      chapterActive: json['chapterActive'] as bool? ?? false,
      chapters:
          (json['chapters'] as List<dynamic>?)
              ?.map((e) => VodChapterDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <VodChapterDto>[],
      channel: json['channel'] == null
          ? null
          : VodChannelDto.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
      inKey: json['inKey'] as String?,
      liveOpenDate: json['liveOpenDate'] as String?,
      liveRewindPlaybackJson: json['liveRewindPlaybackJson'] as String?,
      userAdultStatus: json['userAdultStatus'] as String?,
      videoChatEnabled: json['videoChatEnabled'] as bool? ?? false,
      videoChatChannelId: json['videoChatChannelId'] as String?,
      membershipBenefitType: json['membershipBenefitType'] as String?,
    );

Map<String, dynamic> _$VodDetailDtoToJson(_VodDetailDto instance) =>
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
      'chapterActive': instance.chapterActive,
      'chapters': instance.chapters,
      'channel': instance.channel,
      'blindType': instance.blindType,
      'watchTimeline': instance.watchTimeline,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'liveRewindPlaybackJson': instance.liveRewindPlaybackJson,
      'userAdultStatus': instance.userAdultStatus,
      'videoChatEnabled': instance.videoChatEnabled,
      'videoChatChannelId': instance.videoChatChannelId,
      'membershipBenefitType': instance.membershipBenefitType,
    };

_VodChapterDto _$VodChapterDtoFromJson(Map<String, dynamic> json) =>
    _VodChapterDto(
      title: json['title'] as String? ?? '',
      startTime: (json['startTime'] as num?)?.toInt() ?? 0,
      endTime: (json['endTime'] as num?)?.toInt() ?? 0,
      thumbnailUrl: json['thumbnailUrl'] as String?,
    );

Map<String, dynamic> _$VodChapterDtoToJson(_VodChapterDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'startTime': instance.startTime,
      'endTime': instance.endTime,
      'thumbnailUrl': instance.thumbnailUrl,
    };

_VodChannelDto _$VodChannelDtoFromJson(Map<String, dynamic> json) =>
    _VodChannelDto(
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
          : VodChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$VodChannelDtoToJson(_VodChannelDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
    };

_VodChannelPersonalDataDto _$VodChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _VodChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : VodChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$VodChannelPersonalDataDtoToJson(
  _VodChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_VodChannelPersonalFollowingDto _$VodChannelPersonalFollowingDtoFromJson(
  Map<String, dynamic> json,
) => _VodChannelPersonalFollowingDto(
  following: json['following'] as bool? ?? false,
  notification: json['notification'] as bool? ?? false,
  followDate: json['followDate'] as String?,
);

Map<String, dynamic> _$VodChannelPersonalFollowingDtoToJson(
  _VodChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};

_VodPlaybackDto _$VodPlaybackDtoFromJson(Map<String, dynamic> json) =>
    _VodPlaybackDto(
      version: json[r'$version'] as String?,
      mpd:
          (json['MPD'] as List<dynamic>?)
              ?.map(
                (e) => VodPlaybackMpdDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <VodPlaybackMpdDto>[],
    );

Map<String, dynamic> _$VodPlaybackDtoToJson(_VodPlaybackDto instance) =>
    <String, dynamic>{r'$version': instance.version, 'MPD': instance.mpd};

_VodPlaybackMpdDto _$VodPlaybackMpdDtoFromJson(Map<String, dynamic> json) =>
    _VodPlaybackMpdDto(
      period:
          (json['Period'] as List<dynamic>?)
              ?.map(
                (e) => VodPlaybackPeriodDto.fromJson(e as Map<String, dynamic>),
              )
              .toList() ??
          const <VodPlaybackPeriodDto>[],
    );

Map<String, dynamic> _$VodPlaybackMpdDtoToJson(_VodPlaybackMpdDto instance) =>
    <String, dynamic>{'Period': instance.period};

_VodPlaybackPeriodDto _$VodPlaybackPeriodDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackPeriodDto(
  adaptationSet:
      (json['AdaptationSet'] as List<dynamic>?)
          ?.map(
            (e) =>
                VodPlaybackAdaptationSetDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VodPlaybackAdaptationSetDto>[],
  supplementalProperty:
      (json['SupplementalProperty'] as List<dynamic>?)
          ?.map(
            (e) => VodPlaybackSupplementalPropertyDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <VodPlaybackSupplementalPropertyDto>[],
);

Map<String, dynamic> _$VodPlaybackPeriodDtoToJson(
  _VodPlaybackPeriodDto instance,
) => <String, dynamic>{
  'AdaptationSet': instance.adaptationSet,
  'SupplementalProperty': instance.supplementalProperty,
};

_VodPlaybackSupplementalPropertyDto
_$VodPlaybackSupplementalPropertyDtoFromJson(Map<String, dynamic> json) =>
    _VodPlaybackSupplementalPropertyDto(
      thumbnails:
          (json['nvod:Thumbnails'] as List<dynamic>?)
              ?.map(
                (e) => VodPlaybackThumbnailsDto.fromJson(
                  e as Map<String, dynamic>,
                ),
              )
              .toList() ??
          const <VodPlaybackThumbnailsDto>[],
    );

Map<String, dynamic> _$VodPlaybackSupplementalPropertyDtoToJson(
  _VodPlaybackSupplementalPropertyDto instance,
) => <String, dynamic>{'nvod:Thumbnails': instance.thumbnails};

_VodPlaybackThumbnailsDto _$VodPlaybackThumbnailsDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackThumbnailsDto(
  seekingThumbnail:
      (json['nvod:SeekingThumbnail'] as List<dynamic>?)
          ?.map(
            (e) => VodPlaybackSeekingThumbnailDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <VodPlaybackSeekingThumbnailDto>[],
);

Map<String, dynamic> _$VodPlaybackThumbnailsDtoToJson(
  _VodPlaybackThumbnailsDto instance,
) => <String, dynamic>{'nvod:SeekingThumbnail': instance.seekingThumbnail};

_VodPlaybackSeekingThumbnailDto _$VodPlaybackSeekingThumbnailDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackSeekingThumbnailDto(
  type: json['@type'] as String?,
  page:
      (json['nvod:Page'] as List<dynamic>?)
          ?.map(
            (e) =>
                VodPlaybackThumbnailPageDto.fromJson(e as Map<String, dynamic>),
          )
          .toList() ??
      const <VodPlaybackThumbnailPageDto>[],
  piece:
      (json['nvod:Piece'] as List<dynamic>?)
          ?.map(
            (e) => VodPlaybackThumbnailPieceDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <VodPlaybackThumbnailPieceDto>[],
  source:
      (json['nvod:Source'] as List<dynamic>?)
          ?.map(
            (e) => VodPlaybackThumbnailSourceDto.fromJson(
              e as Map<String, dynamic>,
            ),
          )
          .toList() ??
      const <VodPlaybackThumbnailSourceDto>[],
);

Map<String, dynamic> _$VodPlaybackSeekingThumbnailDtoToJson(
  _VodPlaybackSeekingThumbnailDto instance,
) => <String, dynamic>{
  '@type': instance.type,
  'nvod:Page': instance.page,
  'nvod:Piece': instance.piece,
  'nvod:Source': instance.source,
};

_VodPlaybackThumbnailPageDto _$VodPlaybackThumbnailPageDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackThumbnailPageDto(
  total: json['@total'] as String?,
  row: json['@row'] as String?,
  column: json['@column'] as String?,
  totalPieceSize: json['@totalPieceSize'] as String?,
);

Map<String, dynamic> _$VodPlaybackThumbnailPageDtoToJson(
  _VodPlaybackThumbnailPageDto instance,
) => <String, dynamic>{
  '@total': instance.total,
  '@row': instance.row,
  '@column': instance.column,
  '@totalPieceSize': instance.totalPieceSize,
};

_VodPlaybackThumbnailPieceDto _$VodPlaybackThumbnailPieceDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackThumbnailPieceDto(
  intervalType: json['@intervalType'] as String?,
  interval: json['@interval'] as String?,
  width: json['@width'] as String?,
  height: json['@height'] as String?,
);

Map<String, dynamic> _$VodPlaybackThumbnailPieceDtoToJson(
  _VodPlaybackThumbnailPieceDto instance,
) => <String, dynamic>{
  '@intervalType': instance.intervalType,
  '@interval': instance.interval,
  '@width': instance.width,
  '@height': instance.height,
};

_VodPlaybackThumbnailSourceDto _$VodPlaybackThumbnailSourceDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackThumbnailSourceDto(
  patternType: json['@patternType'] as String?,
  text: json['#text'] as String?,
);

Map<String, dynamic> _$VodPlaybackThumbnailSourceDtoToJson(
  _VodPlaybackThumbnailSourceDto instance,
) => <String, dynamic>{
  '@patternType': instance.patternType,
  '#text': instance.text,
};

_VodPlaybackAdaptationSetDto _$VodPlaybackAdaptationSetDtoFromJson(
  Map<String, dynamic> json,
) => _VodPlaybackAdaptationSetDto(naverVodM3u: json['@nvod:m3u'] as String?);

Map<String, dynamic> _$VodPlaybackAdaptationSetDtoToJson(
  _VodPlaybackAdaptationSetDto instance,
) => <String, dynamic>{'@nvod:m3u': instance.naverVodM3u};
