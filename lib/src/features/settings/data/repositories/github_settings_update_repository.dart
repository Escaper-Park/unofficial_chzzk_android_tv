import '../../domain/entities/settings_update_info.dart';
import '../../domain/failures/settings_update_failure.dart';
import '../../domain/repositories/settings_update_repository.dart';
import '../data_sources/settings_update_api.dart';
import '../mappers/settings_update_mapper.dart';

final class GithubSettingsUpdateRepository implements SettingsUpdateRepository {
  const GithubSettingsUpdateRepository({
    required this.api,
  });

  final SettingsUpdateApi api;

  @override
  Future<SettingsUpdateInfo> fetchLatestRelease() async {
    try {
      final response = await api.getLatestRelease();
      if (response.tagName.isEmpty) {
        throw const SettingsUpdateLoadFailure();
      }

      return settingsUpdateInfoFromDto(response);
    } on Object catch (_, stackTrace) {
      Error.throwWithStackTrace(
        const SettingsUpdateLoadFailure(),
        stackTrace,
      );
    }
  }
}
