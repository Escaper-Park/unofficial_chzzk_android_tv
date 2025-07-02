// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'following_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FollowingResponseImpl _$$FollowingResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$FollowingResponseImpl(
      totalCount: (json['totalCount'] as num?)?.toInt(),
      totalPage: (json['totalPage'] as num?)?.toInt(),
      followingList: (json['followingList'] as List<dynamic>)
          .map((e) => Following.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FollowingResponseImplToJson(
        _$FollowingResponseImpl instance) =>
    <String, dynamic>{
      'totalCount': instance.totalCount,
      'totalPage': instance.totalPage,
      'followingList': instance.followingList,
    };
