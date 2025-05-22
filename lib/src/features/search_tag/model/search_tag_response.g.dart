// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'search_tag_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchTagLiveResponse _$SearchTagLiveResponseFromJson(
        Map<String, dynamic> json) =>
    SearchTagLiveResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : SearchTagLivePage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => LiveInfo.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchTagLiveResponseToJson(
        SearchTagLiveResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

SearchTagLivePage _$SearchTagLivePageFromJson(Map<String, dynamic> json) =>
    SearchTagLivePage(
      next: json['next'] == null
          ? null
          : SearchTagLiveNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchTagLivePageToJson(SearchTagLivePage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

SearchTagLiveNext _$SearchTagLiveNextFromJson(Map<String, dynamic> json) =>
    SearchTagLiveNext(
      concurrentUserCount: (json['concurrentUserCount'] as num).toInt(),
      liveId: (json['liveId'] as num).toInt(),
    );

Map<String, dynamic> _$SearchTagLiveNextToJson(SearchTagLiveNext instance) =>
    <String, dynamic>{
      'concurrentUserCount': instance.concurrentUserCount,
      'liveId': instance.liveId,
    };

SearchTagVodResponse _$SearchTagVodResponseFromJson(
        Map<String, dynamic> json) =>
    SearchTagVodResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : SearchTagVodPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => Vod.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SearchTagVodResponseToJson(
        SearchTagVodResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

SearchTagVodPage _$SearchTagVodPageFromJson(Map<String, dynamic> json) =>
    SearchTagVodPage(
      next: json['next'] == null
          ? null
          : SearchTagVodNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SearchTagVodPageToJson(SearchTagVodPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

SearchTagVodNext _$SearchTagVodNextFromJson(Map<String, dynamic> json) =>
    SearchTagVodNext(
      start: (json['start'] as num).toInt(),
    );

Map<String, dynamic> _$SearchTagVodNextToJson(SearchTagVodNext instance) =>
    <String, dynamic>{
      'start': instance.start,
    };
