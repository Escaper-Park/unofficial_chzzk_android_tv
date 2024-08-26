// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NaverClipImpl _$$NaverClipImplFromJson(Map<String, dynamic> json) =>
    _$NaverClipImpl(
      clipUID: json['clipUID'] as String,
      videoId: json['videoId'] as String?,
      clipTitle: json['clipTitle'] as String,
      ownerChannelId: json['ownerChannelId'] as String,
      thumbnailImageUrl: json['thumbnailImageUrl'] as String?,
      categoryType: json['categoryType'] as String?,
      clipCategory: json['clipCategory'] as String?,
      duration: (json['duration'] as num).toInt(),
      adult: json['adult'] as bool,
      createdDate: json['createdDate'] as String,
      recId: json['recId'] as String,
      privateUserBlock: json['privateUserBlock'] as bool?,
    );

Map<String, dynamic> _$$NaverClipImplToJson(_$NaverClipImpl instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'videoId': instance.videoId,
      'clipTitle': instance.clipTitle,
      'ownerChannelId': instance.ownerChannelId,
      'thumbnailImageUrl': instance.thumbnailImageUrl,
      'categoryType': instance.categoryType,
      'clipCategory': instance.clipCategory,
      'duration': instance.duration,
      'adult': instance.adult,
      'createdDate': instance.createdDate,
      'recId': instance.recId,
      'privateUserBlock': instance.privateUserBlock,
    };

_$ClipResponseImpl _$$ClipResponseImplFromJson(Map<String, dynamic> json) =>
    _$ClipResponseImpl(
      size: (json['size'] as num?)?.toInt(),
      next: _clipPageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ClipResponseImplToJson(_$ClipResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };

_$ClipPageImpl _$$ClipPageImplFromJson(Map<String, dynamic> json) =>
    _$ClipPageImpl(
      clipUID: json['clipUID'] as String?,
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ClipPageImplToJson(_$ClipPageImpl instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'readCount': instance.readCount,
    };

_$PopularClipResponseImpl _$$PopularClipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularClipResponseImpl(
      size: (json['size'] as num).toInt(),
      next: _popularClipPageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PopularClipResponseImplToJson(
        _$PopularClipResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };

_$PopularClipPageImpl _$$PopularClipPageImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularClipPageImpl(
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$PopularClipPageImplToJson(
        _$PopularClipPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };
