part of 'shared_preferences_settings_repository.dart';

SettingsPreferences _decodePreferences(Map<String, dynamic> json) {
  return SettingsPreferences(
    generalSetting: _decodeSection(
      json['generalSetting'],
      GeneralSetting.fromJson,
      defaultGeneralSetting,
    ),
    liveSettings: _decodeSection(
      json['liveSettings'],
      LiveSettings.fromJson,
      defaultLiveSettings,
    ),
    vodSettings: _decodeSection(
      json['vodSettings'],
      VodSettings.fromJson,
      defaultVodSettings,
    ),
    chatSettings: _decodeSection(
      json['chatSettings'],
      ChatSettings.fromJson,
      defaultChatSettings,
    ),
  );
}

T _decodeSection<T>(
  Object? rawValue,
  T Function(Map<String, dynamic>) fromJson,
  T fallback,
) {
  if (rawValue is! Map) {
    return fallback;
  }

  try {
    return fromJson(_jsonObject(rawValue));
  } on Object {
    return fallback;
  }
}

Map<String, dynamic> _jsonObject(Map<dynamic, dynamic> json) {
  return json.map((key, value) => MapEntry(key.toString(), value));
}
