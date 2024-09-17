// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodImpl _$$VodImplFromJson(Map<String, dynamic> json) => _$VodImpl(
      videoNo: (json['videoNo'] as num).toInt(),
      videoId: json['videoId'] as String?,
      videoTitle: json['videoTitle'] as String,
      videoType: json['videoType'] as String,
      publishDate: json['publishDate'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      trailerUrl: json['trailerUrl'] as String?,
      duration: (json['duration'] as num).toInt(),
      readCount: (json['readCount'] as num).toInt(),
      publishDateAt: (json['publishDateAt'] as num).toInt(),
      categoryType: json['categoryType'] as String?,
      videoCategory: json['videoCategory'] as String?,
      videoCategoryValue: json['videoCategoryValue'] as String?,
      exposure: json['exposure'] as bool,
      adult: json['adult'] as bool,
      clipActive: json['clipActive'] as bool,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      blindType: json['blindType'],
      livePv: (json['livePv'] as num?)?.toInt(),
      watchTimeline: (json['watchTimeline'] as num?)?.toInt(),
      paidPromotion: json['paidPromotion'] as bool?,
      inKey: json['inKey'] as String?,
      liveOpenDate: json['liveOpenDate'] as String?,
      vodStatus: json['vodStatus'] as String?,
      userAdultStatus: json['userAdultStatus'] as String?,
    );

Map<String, dynamic> _$$VodImplToJson(_$VodImpl instance) => <String, dynamic>{
      'videoNo': instance.videoNo,
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'videoType': instance.videoType,
      'publishDate': instance.publishDate,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'trailerUrl': instance.trailerUrl,
      'duration': instance.duration,
      'readCount': instance.readCount,
      'publishDateAt': instance.publishDateAt,
      'categoryType': instance.categoryType,
      'videoCategory': instance.videoCategory,
      'videoCategoryValue': instance.videoCategoryValue,
      'exposure': instance.exposure,
      'adult': instance.adult,
      'clipActive': instance.clipActive,
      'channel': instance.channel,
      'blindType': instance.blindType,
      'livePv': instance.livePv,
      'watchTimeline': instance.watchTimeline,
      'paidPromotion': instance.paidPromotion,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'vodStatus': instance.vodStatus,
      'userAdultStatus': instance.userAdultStatus,
    };

_$ChannelVodResponseImpl _$$ChannelVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelVodResponseImpl(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChannelVodResponseImplToJson(
        _$ChannelVodResponseImpl instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

_$FollowingVodImpl _$$FollowingVodImplFromJson(Map<String, dynamic> json) =>
    _$FollowingVodImpl(
      type: json['type'] as String,
      vod: Vod.fromJson(json['content'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingVodImplToJson(_$FollowingVodImpl instance) =>
    <String, dynamic>{
      'type': instance.type,
      'content': instance.vod,
    };

_$FollowingVodResponseImpl _$$FollowingVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingVodResponseImpl(
      size: (json['size'] as num).toInt(),
      next: _followingVodPageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => FollowingVod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingVodResponseImplToJson(
        _$FollowingVodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };

_$PopularVodResponseImpl _$$PopularVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularVodResponseImpl(
      videos: (json['videos'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PopularVodResponseImplToJson(
        _$PopularVodResponseImpl instance) =>
    <String, dynamic>{
      'videos': instance.videos,
    };

_$CategoryVodResponseImpl _$$CategoryVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryVodResponseImpl(
      size: (json['size'] as num).toInt(),
      next: _categoryVodPageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryVodResponseImplToJson(
        _$CategoryVodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };

_$CategoryVodPageImpl _$$CategoryVodPageImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryVodPageImpl(
      publishDateAt: (json['publishDateAt'] as num).toInt(),
      readCount: (json['readCount'] as num).toInt(),
    );

Map<String, dynamic> _$$CategoryVodPageImplToJson(
        _$CategoryVodPageImpl instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };
