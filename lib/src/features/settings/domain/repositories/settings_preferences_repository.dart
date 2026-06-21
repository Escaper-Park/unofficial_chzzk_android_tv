import '../entities/settings_preferences.dart';

abstract interface class SettingsPreferencesRepository {
  Future<SettingsPreferences> read();

  Future<void> save(SettingsPreferences preferences);
}
