import 'package:freezed_annotation/freezed_annotation.dart';

part 'settings_update_dtos.freezed.dart';
part 'settings_update_dtos.g.dart';

@freezed
abstract class SettingsReleaseDto with _$SettingsReleaseDto {
  const factory SettingsReleaseDto({
    @JsonKey(name: 'tag_name') required String tagName,
    @Default('') String body,
  }) = _SettingsReleaseDto;

  factory SettingsReleaseDto.fromJson(Map<String, dynamic> json) =>
      _$SettingsReleaseDtoFromJson(json);
}
