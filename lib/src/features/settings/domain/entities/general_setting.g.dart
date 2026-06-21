// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'general_setting.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneralSetting _$GeneralSettingFromJson(
  Map<String, dynamic> json,
) => _GeneralSetting(
  showImmersive: (json['showImmersive'] as num?)?.toInt() ?? 1,
  showFollowingLive: (json['showFollowingLive'] as num?)?.toInt() ?? 1,
  showPopularLive: (json['showPopularLive'] as num?)?.toInt() ?? 1,
  showWatchingHistory: (json['showWatchingHistory'] as num?)?.toInt() ?? 1,
  showPopularVod: (json['showPopularVod'] as num?)?.toInt() ?? 0,
  showFollowingCategory: (json['showFollowingCategory'] as num?)?.toInt() ?? 1,
  showTrendingCategory: (json['showTrendingCategory'] as num?)?.toInt() ?? 0,
  streamingPreview: (json['streamingPreview'] as num?)?.toInt() ?? 0,
  streamingPreviewAudioEnabled:
      (json['streamingPreviewAudioEnabled'] as num?)?.toInt() ?? 0,
  streamingPreviewSeconds:
      (json['streamingPreviewSeconds'] as num?)?.toInt() ?? 5,
  streamingPreviewDurationIndex:
      (json['streamingPreviewDurationIndex'] as num?)?.toInt() ?? 2,
  streamingPreviewResolutionIndex:
      (json['streamingPreviewResolutionIndex'] as num?)?.toInt() ?? 2,
  liveCardPreviewResolutionIndex:
      (json['liveCardPreviewResolutionIndex'] as num?)?.toInt() ?? 0,
  overlayControlsDisplayTime:
      (json['overlayControlsDisplayTime'] as num?)?.toInt() ?? 15,
  videoViewTypeIndex:
      (json['videoViewTypeIndex'] as num?)?.toInt() ??
      playerVideoViewTypeIndexMin,
);

Map<String, dynamic> _$GeneralSettingToJson(
  _GeneralSetting instance,
) => <String, dynamic>{
  'showImmersive': instance.showImmersive,
  'showFollowingLive': instance.showFollowingLive,
  'showPopularLive': instance.showPopularLive,
  'showWatchingHistory': instance.showWatchingHistory,
  'showPopularVod': instance.showPopularVod,
  'showFollowingCategory': instance.showFollowingCategory,
  'showTrendingCategory': instance.showTrendingCategory,
  'streamingPreview': instance.streamingPreview,
  'streamingPreviewAudioEnabled': instance.streamingPreviewAudioEnabled,
  'streamingPreviewSeconds': instance.streamingPreviewSeconds,
  'streamingPreviewDurationIndex': instance.streamingPreviewDurationIndex,
  'streamingPreviewResolutionIndex': instance.streamingPreviewResolutionIndex,
  'liveCardPreviewResolutionIndex': instance.liveCardPreviewResolutionIndex,
  'overlayControlsDisplayTime': instance.overlayControlsDisplayTime,
  'videoViewTypeIndex': instance.videoViewTypeIndex,
};
