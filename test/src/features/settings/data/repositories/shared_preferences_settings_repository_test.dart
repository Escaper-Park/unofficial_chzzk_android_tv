import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/data/repositories/settings_preferences_storage_keys.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/data/repositories/shared_preferences_settings_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';

void main() {
  test('reads defaults when no preferences are stored', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final preferences = await repository.read();

    expect(preferences, defaultSettingsPreferences);
  });

  test('saves and restores settings preferences', () async {
    SharedPreferences.setMockInitialValues({});
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );
    const preferences = SettingsPreferences(
      generalSetting: GeneralSetting(showPopularVod: 1),
    );

    await repository.save(preferences);

    expect(await repository.read(), preferences);
  });

  test('ignores the previous storage key so settings start fresh', () async {
    SharedPreferences.setMockInitialValues({
      'settings.preferences.v1': jsonEncode({
        'homeSettings': {
          'showPopularVod': 1,
        },
      }),
    });
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final preferences = await repository.read();

    expect(preferences, defaultSettingsPreferences);
  });

  test('falls back to defaults when stored data is invalid', () async {
    SharedPreferences.setMockInitialValues({
      SettingsPreferencesStorageKeys.preferences: 'not-json',
    });
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final preferences = await repository.read();

    expect(preferences, defaultSettingsPreferences);
  });

  test('preserves valid sections when another section is corrupted', () async {
    SharedPreferences.setMockInitialValues({
      SettingsPreferencesStorageKeys.preferences: jsonEncode({
        'generalSetting': {
          'showPopularVod': 1,
        },
        'liveSettings': 'corrupted',
      }),
    });
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final preferences = await repository.read();

    expect(preferences.generalSetting.showPopularVod, 1);
    expect(preferences.liveSettings, defaultLiveSettings);
  });

  test(
    'missing video view setting defaults single playback to PlatformView',
    () async {
      SharedPreferences.setMockInitialValues({
        SettingsPreferencesStorageKeys.preferences: jsonEncode({
          'generalSetting': {
            'showPopularVod': 1,
          },
        }),
      });
      final repository = SharedPreferencesSettingsRepository(
        preferences: await SharedPreferences.getInstance(),
      );

      final preferences = await repository.read();

      expect(
        preferences.generalSetting.videoViewType,
        PlayerVideoViewType.platformView,
      );
      expect(
        const GeneralSetting().videoViewType,
        PlayerVideoViewType.platformView,
      );
    },
  );

  test('normalizes stored values outside known option ranges', () async {
    SharedPreferences.setMockInitialValues({
      SettingsPreferencesStorageKeys.preferences: jsonEncode({
        'generalSetting': {
          'showPopularVod': 7,
          'overlayControlsDisplayTime': 99,
          'videoViewTypeIndex': 99,
        },
        'liveSettings': {
          'multiviewMaxCount': 99,
          'multiviewScreenModeIndex': 99,
          'multiviewChatPositionX': -1,
          'multiviewChatPositionY': 101,
        },
        'vodSettings': {
          'resolutionIndex': 99,
          'playbackIntervalIndex': -1,
        },
        'chatSettings': {
          'chatMessageFontSize': 99,
          'useBadgeCollector': 99,
        },
      }),
    });
    final repository = SharedPreferencesSettingsRepository(
      preferences: await SharedPreferences.getInstance(),
    );

    final preferences = await repository.read();

    expect(preferences.generalSetting.showPopularVod, 0);
    expect(preferences.generalSetting.overlayControlsDisplayTime, 5);
    expect(preferences.generalSetting.videoViewTypeIndex, 0);
    expect(preferences.liveSettings.multiviewMaxCount, 2);
    expect(preferences.liveSettings.multiviewScreenModeIndex, 0);
    expect(preferences.liveSettings.multiviewChatPositionX, 0);
    expect(preferences.liveSettings.multiviewChatPositionY, 0);
    expect(preferences.vodSettings.resolutionIndex, 0);
    expect(preferences.vodSettings.playbackIntervalIndex, 0);
    expect(preferences.chatSettings.chatMessageFontSize, 1);
    expect(preferences.chatSettings.useBadgeCollector, 0);
  });
}
