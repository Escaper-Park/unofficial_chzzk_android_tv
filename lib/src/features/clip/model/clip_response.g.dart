// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PopularClipResponseImpl _$$PopularClipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularClipResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : PopularClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PopularClipResponseImplToJson(
        _$PopularClipResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$PopularClipPageImpl _$$PopularClipPageImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularClipPageImpl(
      next: json['next'] == null
          ? null
          : PopularClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$PopularClipPageImplToJson(
        _$PopularClipPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$PopularClipNextImpl _$$PopularClipNextImplFromJson(
        Map<String, dynamic> json) =>
    _$PopularClipNextImpl(
      next: json['next'] as String?,
    );

Map<String, dynamic> _$$PopularClipNextImplToJson(
        _$PopularClipNextImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$CategoryClipResponseImpl _$$CategoryClipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryClipResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryClipResponseImplToJson(
        _$CategoryClipResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$CategoryClipPageImpl _$$CategoryClipPageImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryClipPageImpl(
      next: json['next'] == null
          ? null
          : CategoryClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryClipPageImplToJson(
        _$CategoryClipPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$CategoryClipNextImpl _$$CategoryClipNextImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryClipNextImpl(
      clipUID: json['clipUID'] as String?,
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CategoryClipNextImplToJson(
        _$CategoryClipNextImpl instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'readCount': instance.readCount,
    };

_$ChannelClipResponseImpl _$$ChannelClipResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelClipResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : ChannelClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasStreamerClips: json['hasStreamerClips'] as bool?,
    );

Map<String, dynamic> _$$ChannelClipResponseImplToJson(
        _$ChannelClipResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
      'hasStreamerClips': instance.hasStreamerClips,
    };

_$ChannelClipPageImpl _$$ChannelClipPageImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelClipPageImpl(
      next: json['next'] == null
          ? null
          : ChannelClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ChannelClipPageImplToJson(
        _$ChannelClipPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$ChannelClipNextImpl _$$ChannelClipNextImplFromJson(
        Map<String, dynamic> json) =>
    _$ChannelClipNextImpl(
      clipUID: json['clipUID'] as String?,
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$ChannelClipNextImplToJson(
        _$ChannelClipNextImpl instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'readCount': instance.readCount,
    };
