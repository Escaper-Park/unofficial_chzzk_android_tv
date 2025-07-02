// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CategoryResponseImpl _$$CategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$CategoryResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : CategoryPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CategoryResponseImplToJson(
        _$CategoryResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$CategoryPageImpl _$$CategoryPageImplFromJson(Map<String, dynamic> json) =>
    _$CategoryPageImpl(
      next: json['next'] == null
          ? null
          : CategoryNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CategoryPageImplToJson(_$CategoryPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$CategoryNextImpl _$$CategoryNextImplFromJson(Map<String, dynamic> json) =>
    _$CategoryNextImpl(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      openLiveCount: (json['openLiveCount'] as num).toInt(),
      categoryId: json['categoryId'] as String,
    );

Map<String, dynamic> _$$CategoryNextImplToJson(_$CategoryNextImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'openLiveCount': instance.openLiveCount,
      'categoryId': instance.categoryId,
    };

_$FollowingCategoryResponseImpl _$$FollowingCategoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingCategoryResponseImpl(
      followingList: (json['followingList'] as List<dynamic>?)
          ?.map((e) => Category.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingCategoryResponseImplToJson(
        _$FollowingCategoryResponseImpl instance) =>
    <String, dynamic>{
      'followingList': instance.followingList,
    };
