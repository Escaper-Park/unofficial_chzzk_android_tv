// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VodResponse _$VodResponseFromJson(Map<String, dynamic> json) => VodResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : VodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$VodResponseToJson(VodResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

VodPage _$VodPageFromJson(Map<String, dynamic> json) => VodPage(
      next: json['next'] == null
          ? null
          : VodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VodPageToJson(VodPage instance) => <String, dynamic>{
      'next': instance.next,
    };

VodNext _$VodNextFromJson(Map<String, dynamic> json) => VodNext(
      publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$VodNextToJson(VodNext instance) => <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };

ChannelVodResponse _$ChannelVodResponseFromJson(Map<String, dynamic> json) =>
    ChannelVodResponse(
      page: (json['page'] as num).toInt(),
      size: (json['size'] as num).toInt(),
      totalCount: (json['totalCount'] as num).toInt(),
      totalPages: (json['totalPages'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChannelVodResponseToJson(ChannelVodResponse instance) =>
    <String, dynamic>{
      'page': instance.page,
      'size': instance.size,
      'totalCount': instance.totalCount,
      'totalPages': instance.totalPages,
      'data': instance.data,
    };

FollowingVodResponse _$FollowingVodResponseFromJson(
        Map<String, dynamic> json) =>
    FollowingVodResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : FollowingVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FollowingVodResponseToJson(
        FollowingVodResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

FollowingVodPage _$FollowingVodPageFromJson(Map<String, dynamic> json) =>
    FollowingVodPage(
      next: json['next'] == null
          ? null
          : FollowingVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$FollowingVodPageToJson(FollowingVodPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

FollowingVodNext _$FollowingVodNextFromJson(Map<String, dynamic> json) =>
    FollowingVodNext(
      nextNo: json['nextNo'] as String?,
    );

Map<String, dynamic> _$FollowingVodNextToJson(FollowingVodNext instance) =>
    <String, dynamic>{
      'nextNo': instance.nextNo,
    };

CategoryVodResponse _$CategoryVodResponseFromJson(Map<String, dynamic> json) =>
    CategoryVodResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryVodResponseToJson(
        CategoryVodResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

CategoryVodPage _$CategoryVodPageFromJson(Map<String, dynamic> json) =>
    CategoryVodPage(
      next: json['next'] == null
          ? null
          : CategoryVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryVodPageToJson(CategoryVodPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

CategoryVodNext _$CategoryVodNextFromJson(Map<String, dynamic> json) =>
    CategoryVodNext(
      publishDateAt: (json['publishDateAt'] as num?)?.toInt(),
      readCount: (json['readCount'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CategoryVodNextToJson(CategoryVodNext instance) =>
    <String, dynamic>{
      'publishDateAt': instance.publishDateAt,
      'readCount': instance.readCount,
    };
