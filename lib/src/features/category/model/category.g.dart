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
      openLiveCount: json['openLiveCount'] as int,
      concurrentUserCount: json['concurrentUserCount'] as int,
    );

Map<String, dynamic> _$$CategoryImplToJson(_$CategoryImpl instance) =>
    <String, dynamic>{
      'categoryType': instance.categoryType,
      'categoryId': instance.categoryId,
      'categoryValue': instance.categoryValue,
      'posterImageUrl': instance.posterImageUrl,
      'openLiveCount': instance.openLiveCount,
      'concurrentUserCount': instance.concurrentUserCount,
    };

_$CategoryPageImpl _$$CategoryPageImplFromJson(Map<String, dynamic> json) =>
    _$CategoryPageImpl(
      concurrentUserCount: json['concurrentUserCount'] as int,
      openLiveCount: json['openLiveCount'] as int,
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$$CategoryPageImplToJson(_$CategoryPageImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'openLiveCount': instance.openLiveCount,
      'categoryId': instance.categoryId,
    };
