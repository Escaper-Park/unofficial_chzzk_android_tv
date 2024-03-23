import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../utils/shared_preferences/shared_prefs.dart';
import '../repository/settings_repository.dart';

part 'settings_controller.g.dart';

@riverpod
class SettingsController extends _$SettingsController {
  late SettingsRepository _settingRepository;

  @override
  void build() {
    final SharedPreferences sharedPreferences = ref.read(sharedPrefsProvider);
    _settingRepository = SettingsRepository(sharedPreferences);
    return;
  }

  Future<void> setNaverIdPrefs(String naverId) async {
    await _settingRepository.setNaverIdPrefs(naverId);
  }

  String? getNaverIdPrefs() {
    return _settingRepository.getNaverIdPrefs();
  }

  Future<void> setPopularChannelsLength(int value) async {
    if (value <= 50 && value > 0) {
      await _settingRepository.setPopularChannelsLength(value);
    }
  }

  int getPopularChannelsLength() {
    return _settingRepository.getPopularChannelsLength();
  }
}
