// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SearchTagLiveResponseImpl _$$SearchTagLiveResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagLiveResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : SearchTagLivePage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchTagLiveResponseImplToJson(
        _$SearchTagLiveResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$SearchTagLivePageImpl _$$SearchTagLivePageImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagLivePageImpl(
      next: json['next'] == null
          ? null
          : SearchTagLiveNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchTagLivePageImplToJson(
        _$SearchTagLivePageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$SearchTagLiveNextImpl _$$SearchTagLiveNextImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagLiveNextImpl(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      liveId: (json['liveId'] as num).toInt(),
    );

Map<String, dynamic> _$$SearchTagLiveNextImplToJson(
        _$SearchTagLiveNextImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };

_$SearchTagVodResponseImpl _$$SearchTagVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagVodResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : SearchTagVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SearchTagVodResponseImplToJson(
        _$SearchTagVodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$SearchTagVodPageImpl _$$SearchTagVodPageImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagVodPageImpl(
      next: json['next'] == null
          ? null
          : SearchTagVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$SearchTagVodPageImplToJson(
        _$SearchTagVodPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$SearchTagVodNextImpl _$$SearchTagVodNextImplFromJson(
        Map<String, dynamic> json) =>
    _$SearchTagVodNextImpl(
      start: (json['start'] as num).toInt(),
    );

Map<String, dynamic> _$$SearchTagVodNextImplToJson(
        _$SearchTagVodNextImpl instance) =>
    <String, dynamic>{
      'start': instance.start,
    };
