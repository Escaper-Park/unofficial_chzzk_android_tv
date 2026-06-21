import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

import '../../domain/entities/settings_preferences.dart';
import '../../domain/repositories/settings_preferences_repository.dart';
import 'settings_preferences_storage_keys.dart';

part 'shared_preferences_settings_repository_codec.dart';
part 'shared_preferences_settings_repository_normalization.dart';

final class SharedPreferencesSettingsRepository
    implements SettingsPreferencesRepository {
  const SharedPreferencesSettingsRepository({
    required this.preferences,
  });

  final SharedPreferences preferences;

  @override
  Future<SettingsPreferences> read() async {
    final rawValue = preferences.getString(
      SettingsPreferencesStorageKeys.preferences,
    );
    if (rawValue == null || rawValue.isEmpty) {
      return defaultSettingsPreferences;
    }

    try {
      final decoded = jsonDecode(rawValue);
      if (decoded is! Map) {
        return defaultSettingsPreferences;
      }

      final decodedPreferences = _decodePreferences(_jsonObject(decoded));
      final preferences = _normalizePreferences(decodedPreferences);
      if (preferences != decodedPreferences) {
        try {
          await _writeNow(preferences);
        } on Object {
          // Keep the normalized in-memory value even if repair persistence fails.
        }
      }
      return preferences;
    } on Object {
      return defaultSettingsPreferences;
    }
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    await _writeNow(_normalizePreferences(preferences));
  }

  Future<void> _writeNow(SettingsPreferences preferences) async {
    final didSave = await this.preferences.setString(
      SettingsPreferencesStorageKeys.preferences,
      jsonEncode(preferences.toJson()),
    );
    if (!didSave) {
      throw StateError('Failed to save settings preferences.');
    }
  }
}
