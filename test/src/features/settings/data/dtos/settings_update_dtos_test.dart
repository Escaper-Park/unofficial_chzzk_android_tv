import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/data/dtos/settings_update_dtos.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/data/mappers/settings_update_mapper.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_update_info.dart';

void main() {
  test('maps latest release dto to the domain contract', () {
    const dto = SettingsReleaseDto(
      tagName: 'v1.0.0',
      body: 'Release notes',
    );

    final info = settingsUpdateInfoFromDto(dto);

    expect(info, isA<SettingsUpdateInfo>());
    expect(info, isNot(isA<SettingsReleaseDto>()));
    expect(info.tagName, 'v1.0.0');
    expect(info.body, 'Release notes');
  });

  test('latest release dto requires a release tag', () {
    expect(
      () => SettingsReleaseDto.fromJson(const <String, dynamic>{
        'body': 'Release notes',
      }),
      throwsA(isA<TypeError>()),
    );
  });
}
