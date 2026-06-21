// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'live_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LiveSettings _$LiveSettingsFromJson(Map<String, dynamic> json) =>
    _LiveSettings(
      latencyIndex: (json['latencyIndex'] as num?)?.toInt() ?? 1,
      showGroupInVideoPlayer:
          (json['showGroupInVideoPlayer'] as num?)?.toInt() ?? 0,
      resolutionIndex: (json['resolutionIndex'] as num?)?.toInt() ?? 3,
      chatWindowIndex: (json['chatWindowIndex'] as num?)?.toInt() ?? 0,
      multiviewMaxCount: (json['multiviewMaxCount'] as num?)?.toInt() ?? 2,
      multiviewResolutionIndex:
          (json['multiviewResolutionIndex'] as num?)?.toInt() ?? 0,
      multiviewScreenModeIndex:
          (json['multiviewScreenModeIndex'] as num?)?.toInt() ?? 0,
      multiviewChatWindowIndex:
          (json['multiviewChatWindowIndex'] as num?)?.toInt() ?? 0,
      multiviewChatPositionX:
          (json['multiviewChatPositionX'] as num?)?.toInt() ?? 0,
      multiviewChatPositionY:
          (json['multiviewChatPositionY'] as num?)?.toInt() ?? 50,
      multiviewPipLayoutIndex:
          (json['multiviewPipLayoutIndex'] as num?)?.toInt() ?? 1,
      multiviewPipPositionX:
          (json['multiviewPipPositionX'] as num?)?.toInt() ?? 100,
      multiviewPipPositionY:
          (json['multiviewPipPositionY'] as num?)?.toInt() ?? 0,
      multiviewPipSize: (json['multiviewPipSize'] as num?)?.toInt() ?? 40,
    );

Map<String, dynamic> _$LiveSettingsToJson(_LiveSettings instance) =>
    <String, dynamic>{
      'latencyIndex': instance.latencyIndex,
      'showGroupInVideoPlayer': instance.showGroupInVideoPlayer,
      'resolutionIndex': instance.resolutionIndex,
      'chatWindowIndex': instance.chatWindowIndex,
      'multiviewMaxCount': instance.multiviewMaxCount,
      'multiviewResolutionIndex': instance.multiviewResolutionIndex,
      'multiviewScreenModeIndex': instance.multiviewScreenModeIndex,
      'multiviewChatWindowIndex': instance.multiviewChatWindowIndex,
      'multiviewChatPositionX': instance.multiviewChatPositionX,
      'multiviewChatPositionY': instance.multiviewChatPositionY,
      'multiviewPipLayoutIndex': instance.multiviewPipLayoutIndex,
      'multiviewPipPositionX': instance.multiviewPipPositionX,
      'multiviewPipPositionY': instance.multiviewPipPositionY,
      'multiviewPipSize': instance.multiviewPipSize,
    };
