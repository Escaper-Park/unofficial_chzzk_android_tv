import 'package:freezed_annotation/freezed_annotation.dart';

part 'live_settings.freezed.dart';
part 'live_settings.g.dart';

@freezed
abstract class LiveSettings with _$LiveSettings {
  const LiveSettings._();

  const factory LiveSettings({
    @Default(1) int latencyIndex,
    @Default(0) int showGroupInVideoPlayer,
    @Default(3) int resolutionIndex,
    @Default(0) int chatWindowIndex,
    @Default(2) int multiviewMaxCount,
    @Default(0) int multiviewResolutionIndex,
    @Default(0) int multiviewScreenModeIndex,
    @Default(0) int multiviewChatWindowIndex,
    @Default(0) int multiviewChatPositionX,
    @Default(50) int multiviewChatPositionY,
    @Default(1) int multiviewPipLayoutIndex,
    @Default(100) int multiviewPipPositionX,
    @Default(0) int multiviewPipPositionY,
    @Default(40) int multiviewPipSize,
  }) = _LiveSettings;

  factory LiveSettings.fromJson(Map<String, dynamic> json) =>
      _$LiveSettingsFromJson(json);
}

const defaultLiveSettings = LiveSettings();
