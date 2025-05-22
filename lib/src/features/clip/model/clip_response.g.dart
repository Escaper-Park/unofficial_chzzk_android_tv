// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'clip_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PopularClipResponse _$PopularClipResponseFromJson(Map<String, dynamic> json) =>
    PopularClipResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : PopularClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PopularClipResponseToJson(
        PopularClipResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

PopularClipPage _$PopularClipPageFromJson(Map<String, dynamic> json) =>
    PopularClipPage(
      next: json['next'] == null
          ? null
          : PopularClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PopularClipPageToJson(PopularClipPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

PopularClipNext _$PopularClipNextFromJson(Map<String, dynamic> json) =>
    PopularClipNext(
      next: json['next'] as String?,
    );

Map<String, dynamic> _$PopularClipNextToJson(PopularClipNext instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

CategoryClipResponse _$CategoryClipResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryClipResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryClipResponseToJson(
        CategoryClipResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

CategoryClipPage _$CategoryClipPageFromJson(Map<String, dynamic> json) =>
    CategoryClipPage(
      next: json['next'] == null
          ? null
          : CategoryClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryClipPageToJson(CategoryClipPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

CategoryClipNext _$CategoryClipNextFromJson(Map<String, dynamic> json) =>
    CategoryClipNext(
      clipUID: json['clipUID'] as String?,
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryClipNextToJson(CategoryClipNext instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'readCount': instance.readCount,
    };

ChannelClipResponse _$ChannelClipResponseFromJson(Map<String, dynamic> json) =>
    ChannelClipResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : ChannelClipPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => NaverClip.fromJson(e as Map<String, dynamic>))
          .toList(),
      hasStreamerClips: json['hasStreamerClips'] as bool?,
    );

Map<String, dynamic> _$ChannelClipResponseToJson(
        ChannelClipResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
      'hasStreamerClips': instance.hasStreamerClips,
    };

ChannelClipPage _$ChannelClipPageFromJson(Map<String, dynamic> json) =>
    ChannelClipPage(
      next: json['next'] == null
          ? null
          : ChannelClipNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ChannelClipPageToJson(ChannelClipPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

ChannelClipNext _$ChannelClipNextFromJson(Map<String, dynamic> json) =>
    ChannelClipNext(
      clipUID: json['clipUID'] as String?,
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$ChannelClipNextToJson(ChannelClipNext instance) =>
    <String, dynamic>{
      'clipUID': instance.clipUID,
      'readCount': instance.readCount,
    };
