// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VodEvent _$VodEventFromJson(Map<String, dynamic> json) => VodEvent(
      channelId: json['channelId'] as String,
      videoNo: (json['videoNo'] as num).toInt(),
      payload: Payload.fromJson(json['payload'] as Map<String, dynamic>),
      totalLength: (json['totalLength'] as num).toInt(),
    );

Map<String, dynamic> _$VodEventToJson(VodEvent instance) => <String, dynamic>{
      'channelId': instance.channelId,
      'videoNo': instance.videoNo,
      'payload': instance.payload.toJson(),
      'totalLength': instance.totalLength,
    };

Payload _$PayloadFromJson(Map<String, dynamic> json) => Payload(
      watchEventType: json['watchEventType'] as String,
      sessionId: json['sessionId'] as String,
      duration: (json['duration'] as num).toInt(),
      positionAt: (json['positionAt'] as num).toInt(),
      awt: (json['awt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PayloadToJson(Payload instance) => <String, dynamic>{
      'watchEventType': instance.watchEventType,
      'sessionId': instance.sessionId,
      'duration': instance.duration,
      'positionAt': instance.positionAt,
      'awt': instance.awt,
    };
