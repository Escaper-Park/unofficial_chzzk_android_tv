// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodImpl _$$VodImplFromJson(Map<String, dynamic> json) => _$VodImpl(
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
      readCount: json['readCount'] as int?,
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
      'publishDateAt': instance.publishDateAt,
      'videoCategoryValue': instance.videoCategoryValue,
      'adult': instance.adult,
      'channel': instance.channel,
      'inKey': instance.inKey,
      'liveOpenDate': instance.liveOpenDate,
      'readCount': instance.readCount,
    };

_$VodPageImpl _$$VodPageImplFromJson(Map<String, dynamic> json) =>
    _$VodPageImpl(
      publishDateAt: json['publishDateAt'] as int?,
      readCount: json['readCount'] as int?,
    );

Map<String, dynamic> _$$VodPageImplToJson(_$VodPageImpl instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };
