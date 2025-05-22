// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watching_history.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchingHistory _$WatchingHistoryFromJson(Map<String, dynamic> json) =>
    WatchingHistory(
      historyNo: json['historyNo'] as String,
      channelId: json['channelId'] as String,
      videoNo: (json['videoNo'] as num).toInt(),
      contentType: json['contentType'] as String,
      timeline: (json['timeline'] as num).toInt(),
      date: json['date'] as String,
      videoResponse:
          Vod.fromJson(json['videoResponse'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$WatchingHistoryToJson(WatchingHistory instance) =>
    <String, dynamic>{
      'historyNo': instance.historyNo,
      'channelId': instance.channelId,
      'videoNo': instance.videoNo,
      'contentType': instance.contentType,
      'timeline': instance.timeline,
      'date': instance.date,
      'videoResponse': instance.videoResponse,
    };
