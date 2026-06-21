// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CategoryListDto _$CategoryListDtoFromJson(Map<String, dynamic> json) =>
    _CategoryListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CategoryDto>[],
      page: json['page'] == null
          ? null
          : CategoryPageDto.fromJson(json['page'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CategoryListDtoToJson(_CategoryListDto instance) =>
    <String, dynamic>{
      'data': instance.data,
      'page': instance.page,
      'size': instance.size,
    };

_CategoryPageDto _$CategoryPageDtoFromJson(Map<String, dynamic> json) =>
    _CategoryPageDto(
      next: json['next'] == null
          ? null
          : CategoryPageNextDto.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryPageDtoToJson(_CategoryPageDto instance) =>
    <String, dynamic>{'next': instance.next};

_CategoryPageNextDto _$CategoryPageNextDtoFromJson(Map<String, dynamic> json) =>
    _CategoryPageNextDto(
      categoryId: json['categoryId'] as String?,
      categoryType: json['categoryType'] as String?,
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt(),
      openLiveCount: (json['openLiveCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryPageNextDtoToJson(
  _CategoryPageNextDto instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'categoryType': instance.categoryType,
  'concurrentUserCount': instance.concurrentUserCount,
  'openLiveCount': instance.openLiveCount,
};

_CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => _CategoryDto(
  categoryId: json['categoryId'] as String,
  categoryType: json['categoryType'] as String,
  categoryValue: json['categoryValue'] as String,
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
  dropsCampaignNos:
      (json['dropsCampaignNos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
  newCategory: json['newCategory'] as bool? ?? false,
  openLiveCount: (json['openLiveCount'] as num?)?.toInt() ?? 0,
  posterImageUrl: json['posterImageUrl'] as String?,
);

Map<String, dynamic> _$CategoryDtoToJson(_CategoryDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryType': instance.categoryType,
      'categoryValue': instance.categoryValue,
      'concurrentUserCount': instance.concurrentUserCount,
      'dropsCampaignNos': instance.dropsCampaignNos,
      'newCategory': instance.newCategory,
      'openLiveCount': instance.openLiveCount,
      'posterImageUrl': instance.posterImageUrl,
    };

_CategoryInfoDto _$CategoryInfoDtoFromJson(Map<String, dynamic> json) =>
    _CategoryInfoDto(
      categoryId: json['categoryId'] as String,
      categoryType: json['categoryType'] as String,
      categoryValue: json['categoryValue'] as String,
      concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
      existLounge: json['existLounge'] as bool? ?? false,
      following: json['following'] as bool? ?? false,
      newCategory: json['newCategory'] as bool? ?? false,
      openLiveCount: (json['openLiveCount'] as num?)?.toInt() ?? 0,
      posterImageUrl: json['posterImageUrl'] as String?,
      tags:
          (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList() ??
          const <String>[],
    );

Map<String, dynamic> _$CategoryInfoDtoToJson(_CategoryInfoDto instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'categoryType': instance.categoryType,
      'categoryValue': instance.categoryValue,
      'concurrentUserCount': instance.concurrentUserCount,
      'existLounge': instance.existLounge,
      'following': instance.following,
      'newCategory': instance.newCategory,
      'openLiveCount': instance.openLiveCount,
      'posterImageUrl': instance.posterImageUrl,
      'tags': instance.tags,
    };

_FollowingCategoryListDto _$FollowingCategoryListDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingCategoryListDto(
  followingList:
      (json['followingList'] as List<dynamic>?)
          ?.map((e) => FollowingCategoryDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <FollowingCategoryDto>[],
);

Map<String, dynamic> _$FollowingCategoryListDtoToJson(
  _FollowingCategoryListDto instance,
) => <String, dynamic>{'followingList': instance.followingList};

_FollowingCategoryDto _$FollowingCategoryDtoFromJson(
  Map<String, dynamic> json,
) => _FollowingCategoryDto(
  categoryId: json['categoryId'] as String,
  categoryType: json['categoryType'] as String,
  categoryValue: json['categoryValue'] as String,
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt() ?? 0,
  dropsCampaignNos:
      (json['dropsCampaignNos'] as List<dynamic>?)
          ?.map((e) => (e as num).toInt())
          .toList() ??
      const <int>[],
  followerCount: (json['followerCount'] as num?)?.toInt() ?? 0,
  newCategory: json['newCategory'] as bool? ?? false,
  openLiveCount: (json['openLiveCount'] as num?)?.toInt() ?? 0,
  posterImageUrl: json['posterImageUrl'] as String?,
);

Map<String, dynamic> _$FollowingCategoryDtoToJson(
  _FollowingCategoryDto instance,
) => <String, dynamic>{
  'categoryId': instance.categoryId,
  'categoryType': instance.categoryType,
  'categoryValue': instance.categoryValue,
  'concurrentUserCount': instance.concurrentUserCount,
  'dropsCampaignNos': instance.dropsCampaignNos,
  'followerCount': instance.followerCount,
  'newCategory': instance.newCategory,
  'openLiveCount': instance.openLiveCount,
  'posterImageUrl': instance.posterImageUrl,
};

_CategoryLiveListDto _$CategoryLiveListDtoFromJson(Map<String, dynamic> json) =>
    _CategoryLiveListDto(
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryLiveDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          const <CategoryLiveDto>[],
      page: json['page'] == null
          ? null
          : CategoryLivePageDto.fromJson(json['page'] as Map<String, dynamic>),
      size: (json['size'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$CategoryLiveListDtoToJson(
  _CategoryLiveListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_CategoryLivePageDto _$CategoryLivePageDtoFromJson(Map<String, dynamic> json) =>
    _CategoryLivePageDto(
      next: json['next'] == null
          ? null
          : CategoryLivePageNextDto.fromJson(
              json['next'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CategoryLivePageDtoToJson(
  _CategoryLivePageDto instance,
) => <String, dynamic>{'next': instance.next};

_CategoryLivePageNextDto _$CategoryLivePageNextDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryLivePageNextDto(
  concurrentUserCount: (json['concurrentUserCount'] as num?)?.toInt(),
  liveId: (json['liveId'] as num?)?.toInt(),
);

Map<String, dynamic> _$CategoryLivePageNextDtoToJson(
  _CategoryLivePageNextDto instance,
) => <String, dynamic>{
  'concurrentUserCount': instance.concurrentUserCount,
  'liveId': instance.liveId,
};

_CategoryLiveDto _$CategoryLiveDtoFromJson(Map<String, dynamic> json) =>
    _CategoryLiveDto(
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
          : CategoryChannelDto.fromJson(
              json['channel'] as Map<String, dynamic>,
            ),
      blindType: json['blindType'] as String?,
      watchPartyTag: json['watchPartyTag'] as String?,
      watchPartyType: json['watchPartyType'] as String?,
      party: json['party'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$CategoryLiveDtoToJson(_CategoryLiveDto instance) =>
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

_CategoryVideoListDto _$CategoryVideoListDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryVideoListDto(
  data:
      (json['data'] as List<dynamic>?)
          ?.map((e) => CategoryVideoDto.fromJson(e as Map<String, dynamic>))
          .toList() ??
      const <CategoryVideoDto>[],
  page: json['page'] == null
      ? null
      : CategoryVideoPageDto.fromJson(json['page'] as Map<String, dynamic>),
  size: (json['size'] as num?)?.toInt() ?? 0,
);

Map<String, dynamic> _$CategoryVideoListDtoToJson(
  _CategoryVideoListDto instance,
) => <String, dynamic>{
  'data': instance.data,
  'page': instance.page,
  'size': instance.size,
};

_CategoryVideoPageDto _$CategoryVideoPageDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryVideoPageDto(
  next: json['next'] == null
      ? null
      : CategoryVideoPageNextDto.fromJson(json['next'] as Map<String, dynamic>),
);

Map<String, dynamic> _$CategoryVideoPageDtoToJson(
  _CategoryVideoPageDto instance,
) => <String, dynamic>{'next': instance.next};

_CategoryVideoPageNextDto _$CategoryVideoPageNextDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryVideoPageNextDto(
  publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
  readCount: (json['readCount'] as num?)?.toInt(),
);

Map<String, dynamic> _$CategoryVideoPageNextDtoToJson(
  _CategoryVideoPageNextDto instance,
) => <String, dynamic>{
  'publishDateAt': instance.publishDateAt,
  'readCount': instance.readCount,
};

_CategoryVideoDto _$CategoryVideoDtoFromJson(Map<String, dynamic> json) =>
    _CategoryVideoDto(
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
          : CategoryChannelDto.fromJson(
              json['channel'] as Map<String, dynamic>,
            ),
      blindType: json['blindType'] as String?,
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryVideoDtoToJson(_CategoryVideoDto instance) =>
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

_CategoryChannelDto _$CategoryChannelDtoFromJson(Map<String, dynamic> json) =>
    _CategoryChannelDto(
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
          : CategoryChannelPersonalDataDto.fromJson(
              json['personalData'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$CategoryChannelDtoToJson(_CategoryChannelDto instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'channelName': instance.channelName,
      'channelImageUrl': instance.channelImageUrl,
      'verifiedMark': instance.verifiedMark,
      'activatedChannelBadgeIds': instance.activatedChannelBadgeIds,
      'personalData': instance.personalData,
    };

_CategoryChannelPersonalDataDto _$CategoryChannelPersonalDataDtoFromJson(
  Map<String, dynamic> json,
) => _CategoryChannelPersonalDataDto(
  following: json['following'] == null
      ? null
      : CategoryChannelPersonalFollowingDto.fromJson(
          json['following'] as Map<String, dynamic>,
        ),
  privateUserBlock: json['privateUserBlock'] as bool? ?? false,
);

Map<String, dynamic> _$CategoryChannelPersonalDataDtoToJson(
  _CategoryChannelPersonalDataDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'privateUserBlock': instance.privateUserBlock,
};

_CategoryChannelPersonalFollowingDto
_$CategoryChannelPersonalFollowingDtoFromJson(Map<String, dynamic> json) =>
    _CategoryChannelPersonalFollowingDto(
      following: json['following'] as bool? ?? false,
      notification: json['notification'] as bool? ?? false,
      followDate: json['followDate'] as String?,
    );

Map<String, dynamic> _$CategoryChannelPersonalFollowingDtoToJson(
  _CategoryChannelPersonalFollowingDto instance,
) => <String, dynamic>{
  'following': instance.following,
  'notification': instance.notification,
  'followDate': instance.followDate,
};
