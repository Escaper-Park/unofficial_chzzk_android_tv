// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchingHistoryResponse _$WatchingHistoryResponseFromJson(
        Map<String, dynamic> json) =>
    WatchingHistoryResponse(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : WatchingHistoryPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => WatchingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$WatchingHistoryResponseToJson(
        WatchingHistoryResponse instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

WatchingHistoryPage _$WatchingHistoryPageFromJson(Map<String, dynamic> json) =>
    WatchingHistoryPage(
      next: json['next'] == null
          ? null
          : WatchingHistoryNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchingHistoryPageToJson(
        WatchingHistoryPage instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

WatchingHistoryNext _$WatchingHistoryNextFromJson(Map<String, dynamic> json) =>
    WatchingHistoryNext(
      lastTime: (json['lastTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$WatchingHistoryNextToJson(
        WatchingHistoryNext instance) =>
    <String, dynamic>{
      'lastTime': instance.lastTime,
    };
