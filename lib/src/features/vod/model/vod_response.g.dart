// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodResponseImpl _$$VodResponseImplFromJson(Map<String, dynamic> json) =>
    _$VodResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : VodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$VodResponseImplToJson(_$VodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$VodPageImpl _$$VodPageImplFromJson(Map<String, dynamic> json) =>
    _$VodPageImpl(
      next: json['next'] == null
          ? null
          : VodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$VodPageImplToJson(_$VodPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$VodNextImpl _$$VodNextImplFromJson(Map<String, dynamic> json) =>
    _$VodNextImpl(
      publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$VodNextImplToJson(_$VodNextImpl instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
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

_$FollowingVodResponseImpl _$$FollowingVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingVodResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : FollowingVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingVodResponseImplToJson(
        _$FollowingVodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$FollowingVodPageImpl _$$FollowingVodPageImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingVodPageImpl(
      next: json['next'] == null
          ? null
          : FollowingVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$FollowingVodPageImplToJson(
        _$FollowingVodPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$FollowingVodNextImpl _$$FollowingVodNextImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingVodNextImpl(
      nextNo: json['nextNo'] as String?,
    );

Map<String, dynamic> _$$FollowingVodNextImplToJson(
        _$FollowingVodNextImpl instance) =>
    <String, dynamic>{
      'nextNo': instance.nextNo,
    };

_$CategoryVodResponseImpl _$$CategoryVodResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryVodResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryVodResponseImplToJson(
        _$CategoryVodResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$CategoryVodPageImpl _$$CategoryVodPageImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryVodPageImpl(
      next: json['next'] == null
          ? null
          : CategoryVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryVodPageImplToJson(
        _$CategoryVodPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$CategoryVodNextImpl _$$CategoryVodNextImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryVodNextImpl(
      publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$CategoryVodNextImplToJson(
        _$CategoryVodNextImpl instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };
