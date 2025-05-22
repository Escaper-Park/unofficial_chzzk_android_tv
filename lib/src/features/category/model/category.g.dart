// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Category _$CategoryFromJson(Map<String, dynamic> json) => Category(
      categoryType: json['categoryType'] as String,
      categoryId: json['categoryId'] as String,
      categoryValue: json['categoryValue'] as String,
      posterImageUrl: json['posterImageUrl'] as String?,
      openLiveCount: (json['openLiveCount'] as num).toInt(),
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      existLounge: json['existLounge'] as bool?,
      following: json['following'] as bool?,
      newCategory: json['newCategory'] as bool?,
    );

Map<String, dynamic> _$CategoryToJson(Category instance) => <String, dynamic>{
      'categoryType': instance.categoryType,
      'categoryId': instance.categoryId,
      'categoryValue': instance.categoryValue,
      'posterImageUrl': instance.posterImageUrl,
      'openLiveCount': instance.openLiveCount,
      'concurrentUserCount': instance.concurrentUserCount,
      'tags': instance.tags,
      'existLounge': instance.existLounge,
      'following': instance.following,
      'newCategory': instance.newCategory,
    };
