// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseVideo _$BaseVideoFromJson(Map<String, dynamic> json) => BaseVideo(
      json['videoNo'] as int,
      json['videoId'] as String?,
      json['videoTitle'] as String,
      json['videoType'] as String,
      json['publishDate'] as String,
      json['thumbnailImageUrl'] as String?,
      json['trailerUrl'] as String?,
      json['duration'] as int,
      json['readCount'] as int,
      json['publishDateAt'] as int,
      json['categoryType'] as String?,
      json['videoCategory'] as String?,
      json['videoCategoryValue'] as String?,
      json['exposure'] as bool,
      json['adult'] as bool,
      ChannelWithPersonalData.fromJson(json['channel'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$BaseVideoToJson(BaseVideo instance) => <String, dynamic>{
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
      'channel': instance.channel,
    };

Video _$VideoFromJson(Map<String, dynamic> json) => Video(
      json['videoNo'] as int,
      json['videoId'] as String?,
      json['videoTitle'] as String,
      json['videoType'] as String,
      json['publishDate'] as String,
      json['thumbnailImageUrl'] as String?,
      json['trailerUrl'] as String?,
      json['duration'] as int,
      json['readCount'] as int,
      json['publishDateAt'] as int,
      json['categoryType'] as String?,
      json['videoCategory'] as String?,
      json['videoCategoryValue'] as String?,
      json['exposure'] as bool,
      json['adult'] as bool,
      ChannelWithPersonalData.fromJson(json['channel'] as Map<String, dynamic>),
      json['paidPromotion'] as bool,
      json['inKey'] as String?,
      json['liveOpenDate'] as String?,
      json['vodStatus'] as String?,
      json['prevVideo'] == null
          ? null
          : BaseVideo.fromJson(json['prevVideo'] as Map<String, dynamic>),
      json['nextVideo'] == null
          ? null
          : BaseVideo.fromJson(json['nextVideo'] as Map<String, dynamic>),
      json['userAdultStatus'] as String?,
    );

Map<String, dynamic> _$VideoToJson(Video instance) => <String, dynamic>{
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
      'channel': instance.channel,
      'paidPromotion': instance.paidPromotion,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'vodStatus': instance.vodStatus,
      'prevVideo': instance.prevVideo,
      'nextVideo': instance.nextVideo,
      'userAdultStatus': instance.userAdultStatus,
    };
