// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stream_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StreamSettingsImpl _$$StreamSettingsImplFromJson(Map<String, dynamic> json) =>
    _$StreamSettingsImpl(
      resolutionIndex: (json['resolutionIndex'] as num).toInt(),
      multiviewResolutionIndex:
          (json['multiviewResolutionIndex'] as num).toInt(),
      vodResolutionIndex: (json['vodResolutionIndex'] as num).toInt(),
      liveChatWindowIndex: (json['liveChatWindowIndex'] as num).toInt(),
      vodChatWindowIndex: (json['vodChatWindowIndex'] as num).toInt(),
      latencyIndex: (json['latencyIndex'] as num).toInt(),
      overlayControlsDisplayTime:
          (json['overlayControlsDisplayTime'] as num).toInt(),
      vodPlaybackIntervalIndex:
          (json['vodPlaybackIntervalIndex'] as num).toInt(),
      showGroupInVideoPlayer: (json['showGroupInVideoPlayer'] as num).toInt(),
      vodPlaybackSpeedIndex: (json['vodPlaybackSpeedIndex'] as num).toInt(),
    );

Map<String, dynamic> _$$StreamSettingsImplToJson(
        _$StreamSettingsImpl instance) =>
    <String, dynamic>{
      'resolutionIndex': instance.resolutionIndex,
      'multiviewResolutionIndex': instance.multiviewResolutionIndex,
      'vodResolutionIndex': instance.vodResolutionIndex,
      'liveChatWindowIndex': instance.liveChatWindowIndex,
      'vodChatWindowIndex': instance.vodChatWindowIndex,
      'latencyIndex': instance.latencyIndex,
      'overlayControlsDisplayTime': instance.overlayControlsDisplayTime,
      'vodPlaybackIntervalIndex': instance.vodPlaybackIntervalIndex,
      'showGroupInVideoPlayer': instance.showGroupInVideoPlayer,
      'vodPlaybackSpeedIndex': instance.vodPlaybackSpeedIndex,
    };
