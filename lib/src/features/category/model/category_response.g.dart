// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryResponse _$CategoryResponseFromJson(Map<String, dynamic> json) =>
    CategoryResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CategoryResponseToJson(CategoryResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

CategoryPage _$CategoryPageFromJson(Map<String, dynamic> json) => CategoryPage(
      next: json['next'] == null
          ? null
          : CategoryNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryPageToJson(CategoryPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

CategoryNext _$CategoryNextFromJson(Map<String, dynamic> json) => CategoryNext(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      openLiveCount: (json['openLiveCount'] as num).toInt(),
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$CategoryNextToJson(CategoryNext instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'openLiveCount': instance.openLiveCount,
      'categoryId': instance.categoryId,
    };

FollowingCategoryResponse _$FollowingCategoryResponseFromJson(
        Map<String, dynamic> json) =>
    FollowingCategoryResponse(
      followingList: (json['followingList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FollowingCategoryResponseToJson(
        FollowingCategoryResponse instance) =>
    <String, dynamic>{
      'followingList': instance.followingList,
    };
