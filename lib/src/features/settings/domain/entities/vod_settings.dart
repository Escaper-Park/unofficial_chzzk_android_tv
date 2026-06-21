import 'package:freezed_annotation/freezed_annotation.dart';

part 'vod_settings.freezed.dart';
part 'vod_settings.g.dart';

@freezed
abstract class VodSettings with _$VodSettings {
  const VodSettings._();

  const factory VodSettings({
    @Default(3) int resolutionIndex,
    @Default(0) int chatWindowIndex,
    @Default(1) int playbackIntervalIndex,
  }) = _VodSettings;

  factory VodSettings.fromJson(Map<String, dynamic> json) =>
      _$VodSettingsFromJson(json);
}

const defaultVodSettings = VodSettings();
