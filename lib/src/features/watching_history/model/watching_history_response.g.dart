// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_history_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchingHistoryResponseImpl _$$WatchingHistoryResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchingHistoryResponseImpl(
      size: (json['size'] as num).toInt(),
      page: json['page'] == null
          ? null
          : WatchingHistoryPage.fromJson(json['page'] as Map<String, dynamic>),
      data: (json['data'] as List<dynamic>)
          .map((e) => WatchingHistory.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$WatchingHistoryResponseImplToJson(
        _$WatchingHistoryResponseImpl instance) =>
    <String, dynamic>{
      'size': instance.size,
      'page': instance.page,
      'data': instance.data,
    };

_$WatchingHistoryPageImpl _$$WatchingHistoryPageImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchingHistoryPageImpl(
      next: json['next'] == null
          ? null
          : WatchingHistoryNext.fromJson(json['next'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WatchingHistoryPageImplToJson(
        _$WatchingHistoryPageImpl instance) =>
    <String, dynamic>{
      'next': instance.next,
    };

_$WatchingHistoryNextImpl _$$WatchingHistoryNextImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchingHistoryNextImpl(
      lastTime: (json['lastTime'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$WatchingHistoryNextImplToJson(
        _$WatchingHistoryNextImpl instance) =>
    <String, dynamic>{
      'lastTime': instance.lastTime,
    };
