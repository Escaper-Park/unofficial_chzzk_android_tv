import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_settings.freezed.dart';
part 'stream_settings.g.dart';

@freezed
class StreamSettings with _$StreamSettings {
  const factory StreamSettings({
    /// The index of default resolution of single view live streaming.
    ///
    /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
    required int resolutionIndex,

    /// The index of default resolution of multi view live streaming.
    ///
    /// 0: 360p, 1: 480p, 2: 720p, 3: 1080p, 4: auto
    required int multiviewResolutionIndex,

    /// The index of default resolution of vod streaming.
    ///
    /// 0: 720p, 1: 1080p, 2: auto
    required int vodResolutionIndex,

    /// The index of default screen mode of single view live streaming.
    ///
    /// 0: off, 1: overlay, 2: side
    required int liveChatWindowIndex,

    /// The index of default screen mode of vod streaming.
    ///
    /// 0: off, 1: overlay, 2: side
    required int vodChatWindowIndex,

    /// 0: HLS, 1:LLHLS
    required int latencyIndex,

    /// The time(in seconds) that the overlay controls are displayed.
    required int overlayControlsDisplayTime,

    /// Interval of vod playback controls.
    ///
    /// 0: 5s, 1: 10s, 2: 30s
    required int vodPlaybackIntervalIndex,

    /// Show custom group in video player overlay to navigate other videos.
    ///
    /// 0: false, 1: true
    required int showGroupInVideoPlayer,
  }) = _StreamSettings;

  factory StreamSettings.fromJson(Map<String, dynamic> json) =>
      _$StreamSettingsFromJson(json);
}
