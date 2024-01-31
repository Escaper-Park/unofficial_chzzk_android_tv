// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'video.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VideoImpl _$$VideoImplFromJson(Map<String, dynamic> json) => _$VideoImpl(
      videoNo: json['videoNo'] as int,
      videoId: json['videoId'] as String?,
      videoTitle: json['videoTitle'] as String,
      videoType: json['videoType'] as String?,
      publishDate: json['publishDate'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      trailerUrl: json['trailerUrl'] as String?,
      duration: json['duration'] as int,
      publishDateAt: json['publishDateAt'] as int,
      videoCategoryValue: json['videoCategoryValue'] as String?,
      adult: json['adult'] as bool,
      channel: Channel.fromJson(json['channel'] as Map<String, dynamic>),
      inKey: json['inKey'] as String?,
      liveOpenDate: json['liveOpenDate'] as String?,
      userAdultStatus: json['userAdultStatus'] as String?,
    );

Map<String, dynamic> _$$VideoImplToJson(_$VideoImpl instance) =>
    <String, dynamic>{
      'videoNo': instance.videoNo,
      'videoId': instance.videoId,
      'videoTitle': instance.videoTitle,
      'videoType': instance.videoType,
      'publishDate': instance.publishDate,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'trailerUrl': instance.trailerUrl,
      'duration': instance.duration,
      'publishDateAt': instance.publishDateAt,
      'videoCategoryValue': instance.videoCategoryValue,
      'adult': instance.adult,
      'channel': instance.channel,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'userAdultStatus': instance.userAdultStatus,
    };
