// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$VodEventImpl _$$VodEventImplFromJson(Map<String, dynamic> json) =>
    _$VodEventImpl(
      channelId: json['channelId'] as String,
      videoNo: (json['videoNo'] as num).toInt(),
      payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
      totalLength: (json['totalLength'] as num).toInt(),
    );

Map<String, dynamic> _$$VodEventImplToJson(_$VodEventImpl instance) =>
    <String, dynamic>{
      'channelId': instance.channelId,
      'videoNo': instance.videoNo,
      'payload': instance.payload,
      'totalLength': instance.totalLength,
    };

_$PayloadImpl _$$PayloadImplFromJson(Map<String, dynamic> json) =>
    _$PayloadImpl(
      watchEventType: json['watchEventType'] as String,
      sessionId: json['sessionId'] as String,
      duration: (json['duration'] as num).toInt(),
      positionAt: (json['positionAt'] as num).toInt(),
      awt: (json['awt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$PayloadImplToJson(_$PayloadImpl instance) =>
    <String, dynamic>{
      'watchEventType': instance.watchEventType,
      'sessionId': instance.sessionId,
      'duration': instance.duration,
      'positionAt': instance.positionAt,
      'awt': instance.awt,
    };
