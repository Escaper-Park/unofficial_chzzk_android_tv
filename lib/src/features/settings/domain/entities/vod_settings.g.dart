// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vod_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_VodSettings _$VodSettingsFromJson(Map<String, dynamic> json) => _VodSettings(
  resolutionIndex: (json['resolutionIndex'] as num?)?.toInt() ?? 3,
  chatWindowIndex: (json['chatWindowIndex'] as num?)?.toInt() ?? 0,
  playbackIntervalIndex: (json['playbackIntervalIndex'] as num?)?.toInt() ?? 1,
);

Map<String, dynamic> _$VodSettingsToJson(_VodSettings instance) =>
    <String, dynamic>{
      'resolutionIndex': instance.resolutionIndex,
      'chatWindowIndex': instance.chatWindowIndex,
      'playbackIntervalIndex': instance.playbackIntervalIndex,
    };
