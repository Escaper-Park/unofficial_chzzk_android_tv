import '../entities/settings_update_info.dart';

// ignore: one_member_abstracts
abstract interface class SettingsUpdateRepository {
  Future<SettingsUpdateInfo> fetchLatestRelease();
}
