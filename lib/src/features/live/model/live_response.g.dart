// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LiveResponseImpl _$$LiveResponseImplFromJson(Map<String, dynamic> json) =>
    _$LiveResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : LivePage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LiveResponseImplToJson(_$LiveResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$LivePageImpl _$$LivePageImplFromJson(Map<String, dynamic> json) =>
    _$LivePageImpl(
      next: json['next'] == null
          ? null
          : LiveNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$LivePageImplToJson(_$LivePageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$LiveNextImpl _$$LiveNextImplFromJson(Map<String, dynamic> json) =>
    _$LiveNextImpl(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      liveId: (json['liveId'] as num).toInt(),
    );

Map<String, dynamic> _$$LiveNextImplToJson(_$LiveNextImpl instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };
