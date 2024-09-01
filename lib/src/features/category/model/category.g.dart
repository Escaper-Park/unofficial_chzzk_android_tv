// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryImpl _$$CategoryImplFromJson(Map<String, dynamic> json) =>
    _$CategoryImpl(
      categoryType: json['categoryType'] as String,
      categoryId: json['categoryId'] as String,
      categoryValue: json['categoryValue'] as String,
      posterImageUrl: json['posterImageUrl'] as String?,
      openLiveCount: (json['openLiveCount'] as num).toInt(),
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      existLounge: json['existLounge'] as bool?,
      following: json['following'] as bool?,
      newCategory: json['newCategory'] as bool?,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'categoryType': instance.categoryType,
      'categoryId': instance.categoryId,
      'categoryValue': instance.categoryValue,
      'posterImageUrl': instance.posterImageUrl,
      'openLiveCount': instance.openLiveCount,
      'concurrentUserCount': instance.concurrentUserCount,
      'existLounge': instance.existLounge,
      'following': instance.following,
      'newCategory': instance.newCategory,
      'tags': instance.tags,
    };

_$CategoryPageImpl _$$CategoryPageImplFromJson(Map<String, dynamic> json) =>
    _$CategoryPageImpl(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      openLiveCount: (json['openLiveCount'] as num).toInt(),
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$$CategoryPageImplToJson(_$CategoryPageImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'openLiveCount': instance.openLiveCount,
      'categoryId': instance.categoryId,
    };

_$CategoryResponseImpl _$$CategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryResponseImpl(
      size: (json['size'] as num).toInt(),
      next: _categoryPageFromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryResponseImplToJson(
        _$CategoryResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.next,
      'data': instance.data,
    };
