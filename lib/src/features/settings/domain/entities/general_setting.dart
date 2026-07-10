import 'package:freezed_annotation/freezed_annotation.dart';

part 'general_setting.freezed.dart';
part 'general_setting.g.dart';

const playerVideoViewTypeIndexMin = 0;
const playerVideoViewTypeIndexMax = 1;

enum PlayerVideoViewType {
  textureView,
  platformView,
}

@freezed
abstract class GeneralSetting with _$GeneralSetting {
  const GeneralSetting._();

  const factory GeneralSetting({
    @Default(1) int showImmersive,
    @Default(1) int showFollowingLive,
    @Default(1) int showPopularLive,
    @Default(1) int showWatchingHistory,
    @Default(0) int showPopularVod,
    @Default(1) int showFollowingCategory,
    @Default(0) int showTrendingCategory,
    @Default(0) int streamingPreview,
    @Default(0) int streamingPreviewAudioEnabled,
    @Default(5) int streamingPreviewSeconds,
    @Default(2) int streamingPreviewDurationIndex,
    @Default(2) int streamingPreviewResolutionIndex,
    @Default(0) int liveCardPreviewResolutionIndex,
    @Default(15) int overlayControlsDisplayTime,
    @Default(playerVideoViewTypeIndexMax) int videoViewTypeIndex,
  }) = _GeneralSetting;

  factory GeneralSetting.fromJson(Map<String, dynamic> json) =>
      _$GeneralSettingFromJson(json);

  PlayerVideoViewType get videoViewType {
    return switch (videoViewTypeIndex) {
      playerVideoViewTypeIndexMax => PlayerVideoViewType.platformView,
      _ => PlayerVideoViewType.textureView,
    };
  }
}

const defaultGeneralSetting = GeneralSetting(
  videoViewTypeIndex: playerVideoViewTypeIndexMax,
);
