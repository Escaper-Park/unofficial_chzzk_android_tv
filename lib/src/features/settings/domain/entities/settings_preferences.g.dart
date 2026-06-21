// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'settings_preferences.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SettingsPreferences _$SettingsPreferencesFromJson(Map<String, dynamic> json) =>
    _SettingsPreferences(
      generalSetting: json['generalSetting'] == null
          ? defaultGeneralSetting
          : GeneralSetting.fromJson(
              json['generalSetting'] as Map<String, dynamic>,
            ),
      liveSettings: json['liveSettings'] == null
          ? defaultLiveSettings
          : LiveSettings.fromJson(json['liveSettings'] as Map<String, dynamic>),
      vodSettings: json['vodSettings'] == null
          ? defaultVodSettings
          : VodSettings.fromJson(json['vodSettings'] as Map<String, dynamic>),
      chatSettings: json['chatSettings'] == null
          ? defaultChatSettings
          : ChatSettings.fromJson(json['chatSettings'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SettingsPreferencesToJson(
  _SettingsPreferences instance,
) => <String, dynamic>{
  'generalSetting': instance.generalSetting,
  'liveSettings': instance.liveSettings,
  'vodSettings': instance.vodSettings,
  'chatSettings': instance.chatSettings,
};
