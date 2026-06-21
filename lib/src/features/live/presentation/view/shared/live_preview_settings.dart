import 'package:flutter/foundation.dart';

import '../../../../settings/domain/entities/settings_preferences.dart';
import '../../../domain/entities/live_detail.dart';
import '../../../domain/entities/live_feed.dart';

@immutable
final class LivePreviewSettings {
  const LivePreviewSettings({
    required this.enabled,
    required this.audioEnabled,
    required this.waitDuration,
    required this.playbackDuration,
    required this.resolutionIndex,
    required this.videoViewType,
  });

  factory LivePreviewSettings.liveCard(GeneralSetting setting) {
    return LivePreviewSettings(
      enabled: setting.streamingPreview != 0,
      audioEnabled: setting.streamingPreviewAudioEnabled != 0,
      waitDuration: Duration(seconds: setting.streamingPreviewSeconds),
      playbackDuration: _previewDuration(setting.streamingPreviewDurationIndex),
      resolutionIndex: setting.liveCardPreviewResolutionIndex,
      videoViewType: setting.videoViewType,
    );
  }

  factory LivePreviewSettings.immersive(GeneralSetting setting) {
    return LivePreviewSettings(
      enabled: setting.streamingPreview != 0,
      audioEnabled: setting.streamingPreviewAudioEnabled != 0,
      waitDuration: Duration(seconds: setting.streamingPreviewSeconds),
      playbackDuration: _previewDuration(setting.streamingPreviewDurationIndex),
      resolutionIndex: setting.streamingPreviewResolutionIndex,
      videoViewType: setting.videoViewType,
    );
  }

  final bool enabled;
  final bool audioEnabled;
  final Duration waitDuration;
  final Duration? playbackDuration;
  final int resolutionIndex;
  final PlayerVideoViewType videoViewType;

  @override
  bool operator ==(Object other) {
    return other is LivePreviewSettings &&
        other.enabled == enabled &&
        other.audioEnabled == audioEnabled &&
        other.waitDuration == waitDuration &&
        other.playbackDuration == playbackDuration &&
        other.resolutionIndex == resolutionIndex &&
        other.videoViewType == videoViewType;
  }

  @override
  int get hashCode {
    return Object.hash(
      enabled,
      audioEnabled,
      waitDuration,
      playbackDuration,
      resolutionIndex,
      videoViewType,
    );
  }
}

bool canAttemptLivePreviewFromFeed(Live item) {
  final channelId = _nonBlank(item.channel?.channelId);
  return channelId != null &&
      !item.adult &&
      _normalized(item.blindType) == null &&
      !_isMemberOnly(item.membershipBenefitType);
}

bool canPlayLivePreviewFromDetail(LiveDetail detail) {
  return _normalized(detail.status) == _openStatus &&
      !detail.adult &&
      _normalized(detail.blindType) == null &&
      !_isMemberOnly(detail.membershipBenefitType);
}

Duration? _previewDuration(int index) {
  return switch (index) {
    0 => const Duration(seconds: 10),
    1 => const Duration(seconds: 15),
    2 => const Duration(seconds: 30),
    3 => const Duration(seconds: 60),
    4 => null,
    _ => const Duration(seconds: 30),
  };
}

bool _isMemberOnly(String? value) {
  return _normalized(value) == _membershipBenefitType;
}

String? _nonBlank(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed;
}

String? _normalized(String? value) {
  final trimmed = value?.trim();
  if (trimmed == null || trimmed.isEmpty) {
    return null;
  }

  return trimmed.toUpperCase();
}

const _membershipBenefitType = 'MEMBER_ONLY';
const _openStatus = 'OPEN';
