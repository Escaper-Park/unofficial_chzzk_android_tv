// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_update_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsReleaseDto _$SettingsReleaseDtoFromJson(Map<String, dynamic> json) =>
    _SettingsReleaseDto(
      tagName: json['tag_name'] as String,
      body: json['body'] as String? ?? '',
    );

Map<String, dynamic> _$SettingsReleaseDtoToJson(_SettingsReleaseDto instance) =>
    <String, dynamic>{'tag_name': instance.tagName, 'body': instance.body};
