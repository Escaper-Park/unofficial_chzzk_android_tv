import '../../domain/entities/settings_update_info.dart';
import '../dtos/settings_update_dtos.dart';

SettingsUpdateInfo settingsUpdateInfoFromDto(SettingsReleaseDto dto) {
  return SettingsReleaseInfo(
    tagName: dto.tagName,
    body: dto.body,
  );
}
