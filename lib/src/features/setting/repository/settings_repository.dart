import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

/// T: ChatSettings, StreamSettings
abstract class SettingsRepository<T> {
  final SharedPreferences prefs;
  final String dbKey;

  SettingsRepository({
    required this.prefs,
    required this.dbKey,
  });

  /// Make own initial settings.
  T initSettings();

  T getSettings() {
    final settingsJson = prefs.getString(dbKey);

    if (settingsJson == null) return _addInitialSettings();

    try {
      return fromJson(json.decode(settingsJson));
    } catch (_) {
      return _addInitialSettings();
    }
  }

  Future<void> updateSettings(T settings) async {
    await prefs.setString(
      dbKey,
      json.encode(toJson(settings)),
    );
  }

  T _addInitialSettings() {
    final T settings = initSettings();

    prefs.setString(
      dbKey,
      json.encode(toJson(settings)),
    );

    return settings;
  }

  T fromJson(Map<String, dynamic> json);
  Map<String, dynamic> toJson(T settings);
}
