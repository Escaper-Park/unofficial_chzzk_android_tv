// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$WatchingHistoryImpl _$$WatchingHistoryImplFromJson(
        Map<String, dynamic> json) =>
    _$WatchingHistoryImpl(
      historyNo: json['historyNo'] as String,
      channelId: json['channelId'] as String,
      videoNo: (json['videoNo'] as num).toInt(),
      contentType: json['contentType'] as String,
      timeline: (json['timeline'] as num).toInt(),
      date: json['date'] as String,
      videoResponse:
          Vod.fromJson(json['videoResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$WatchingHistoryImplToJson(
        _$WatchingHistoryImpl instance) =>
    <String, dynamic>{
      'historyNo': instance.historyNo,
      'channelId': instance.channelId,
      'videoNo': instance.videoNo,
      'contentType': instance.contentType,
      'timeline': instance.timeline,
      'date': instance.date,
      'videoResponse': instance.videoResponse,
    };
