import 'package:freezed_annotation/freezed_annotation.dart';

part 'stream_settings.freezed.dart';
part 'stream_settings.g.dart';

@freezed
class StreamSettings with _$StreamSettings {
  const factory StreamSettings({
    /// The index of default resolution of single view live streaming.
    ///
    /// 0: 360p, 1: 480p, 2:720p, 3:1080p
    required int resolutionIndex,

    /// The index of default resolution of multi view live streaming.
    ///
    /// 0: 360p, 1: 480p, 2:720p, 3:1080p
    required int multiviewResolutionIndex,

    /// The index of default screen mode of single view live streaming.
    ///
    /// 0: full, 1: singleview overlay chat, 2: single view full chat
    ///
    /// 3: multiview -> don't save
    required int screenModeIndex,

    /// 0: HLS, 1:LLHLS
    required int latencyIndex,

    /// The time(in seconds) that the overlay controls are displayed.
    required int overlayControlsDisplayTime,

    /// Interval of vod playback controls.
    ///
    /// 0: 5s, 1: 10s, 2: 30s
    required int vodPlaybackIntervalIndex,
  }) = _StreamSettings;

  factory StreamSettings.fromJson(Map<String, dynamic> json) =>
      _$StreamSettingsFromJson(json);
}
