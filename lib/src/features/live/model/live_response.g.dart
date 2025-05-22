// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LiveResponse _$LiveResponseFromJson(Map<String, dynamic> json) => LiveResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : LivePage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LiveResponseToJson(LiveResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

LivePage _$LivePageFromJson(Map<String, dynamic> json) => LivePage(
      next: json['next'] == null
          ? null
          : LiveNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LivePageToJson(LivePage instance) => <String, dynamic>{
      'next': instance.next,
    };

LiveNext _$LiveNextFromJson(Map<String, dynamic> json) => LiveNext(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      liveId: (json['liveId'] as num).toInt(),
    );

Map<String, dynamic> _$LiveNextToJson(LiveNext instance) => <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };
