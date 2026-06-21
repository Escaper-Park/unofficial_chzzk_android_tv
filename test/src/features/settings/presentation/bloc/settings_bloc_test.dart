// ignore_for_file: cascade_invocations

import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_preferences.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/entities/settings_update_info.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_preferences_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/domain/repositories/settings_update_repository.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:unofficial_chzzk_android_tv/src/features/settings/presentation/models/settings_preference_groups.dart';

void main() {
  test('loads stored preferences', () async {
    const preferences = SettingsPreferences(
      generalSetting: GeneralSetting(showPopularVod: 1),
    );
    final repository = _FakeSettingsPreferencesRepository(
      preferences: preferences,
    );
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);

    expect(bloc.state.preferences, preferences);

    await bloc.close();
  });

  test('toggles and saves a home preference', () async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);

    bloc.add(SettingsEvent.toggleRequested(_refForHome('인기 VOD')));
    await _waitFor(() => repository.savedPreferences.isNotEmpty);

    expect(
      repository.savedPreferences.last.generalSetting.showPopularVod,
      1,
    );

    await bloc.close();
  });

  test('select option saves and closes the editor', () async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final ref = _optionRefFor(SettingsCategoryId.liveStreaming);

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);
    bloc.add(SettingsEvent.editorOpened(ref));
    await _waitFor(() => bloc.state.activeEditor == ref);

    bloc.add(SettingsEvent.optionSelected(ref: ref, value: 4));
    await _waitFor(() => repository.savedPreferences.isNotEmpty);

    expect(repository.savedPreferences.last.liveSettings.resolutionIndex, 4);
    expect(bloc.state.activeEditor, isNull);

    await bloc.close();
  });

  test(
    'select option rolls back and keeps editor open when save fails',
    () async {
      final repository = _FakeSettingsPreferencesRepository(failSaves: true);
      final bloc = SettingsBloc(
        preferencesRepository: repository,
        updateRepository: const _FakeSettingsUpdateRepository(),
      );
      final ref = _refFor(SettingsCategoryId.liveStreaming, '湲곕낯 ?쇱씠釉??붿쭏');

      bloc.add(const SettingsEvent.started());
      await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);
      final persisted = bloc.state.preferences;
      bloc.add(SettingsEvent.editorOpened(ref));
      await _waitFor(() => bloc.state.activeEditor == ref);

      bloc.add(SettingsEvent.optionSelected(ref: ref, value: 4));
      await _waitFor(() => bloc.state.saveStatus == SettingsSaveStatus.failure);

      expect(bloc.state.preferences, persisted);
      expect(bloc.state.activeEditor, ref);
      expect(repository.savedPreferences, isEmpty);

      await bloc.close();
    },
  );

  test('slider changes update state immediately and save on commit', () async {
    final repository = _FakeSettingsPreferencesRepository();
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final ref = _sliderRefFor(SettingsCategoryId.general);

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);

    bloc.add(SettingsEvent.sliderChanged(ref: ref, value: 20));
    await _waitFor(() {
      return bloc.state.preferences.generalSetting.overlayControlsDisplayTime ==
          20;
    });

    expect(repository.savedPreferences, isEmpty);
    await Future<void>.delayed(const Duration(milliseconds: 600));
    expect(repository.savedPreferences, isEmpty);

    bloc.add(const SettingsEvent.sliderChangeCommitted());
    await Future<void>.delayed(const Duration(milliseconds: 600));
    await _waitFor(() => repository.savedPreferences.isNotEmpty);

    expect(
      repository
          .savedPreferences
          .last
          .generalSetting
          .overlayControlsDisplayTime,
      20,
    );

    await bloc.close();
  });

  test('slider save failure rolls back to the last persisted value', () async {
    final repository = _FakeSettingsPreferencesRepository(failSaves: true);
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    final ref = _sliderRefFor(SettingsCategoryId.general);

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);
    final persisted = bloc.state.preferences;

    bloc.add(SettingsEvent.sliderChanged(ref: ref, value: 20));
    await _waitFor(() {
      return bloc.state.preferences.generalSetting.overlayControlsDisplayTime ==
          20;
    });

    bloc.add(const SettingsEvent.sliderSaveDebounceElapsed());
    await _waitFor(() => bloc.state.saveStatus == SettingsSaveStatus.failure);

    expect(bloc.state.preferences, persisted);
    expect(repository.savedPreferences, isEmpty);

    await bloc.close();
  });

  test('ignores selecting the current menu category', () async {
    final bloc = SettingsBloc(
      preferencesRepository: _FakeSettingsPreferencesRepository(),
      updateRepository: const _FakeSettingsUpdateRepository(),
    );
    const ref = SettingsPreferenceRef(
      category: SettingsCategoryId.general,
      index: 0,
    );

    bloc.add(const SettingsEvent.editorOpened(ref));
    await _waitFor(() => bloc.state.activeEditor == ref);

    bloc.add(const SettingsEvent.menuSelected(SettingsCategoryId.general));
    await Future<void>.delayed(Duration.zero);

    expect(bloc.state.selectedCategory, SettingsCategoryId.general);
    expect(bloc.state.activeEditor, ref);

    await bloc.close();
  });

  test('reset restores only the selected section', () async {
    const preferences = SettingsPreferences(
      generalSetting: GeneralSetting(
        showPopularVod: 1,
      ),
      liveSettings: LiveSettings(
        resolutionIndex: 4,
      ),
      chatSettings: ChatSettings(showChatTime: 1),
    );
    final repository = _FakeSettingsPreferencesRepository(
      preferences: preferences,
    );
    final bloc = SettingsBloc(
      preferencesRepository: repository,
      updateRepository: const _FakeSettingsUpdateRepository(),
    );

    bloc.add(const SettingsEvent.started());
    await _waitFor(() => bloc.state.loadStatus == SettingsLoadStatus.ready);
    bloc.add(const SettingsEvent.resetRequested());
    await _waitFor(() => repository.savedPreferences.isNotEmpty);

    final saved = repository.savedPreferences.last;
    expect(saved.generalSetting.showPopularVod, 0);
    expect(saved.liveSettings.resolutionIndex, 4);
    expect(saved.chatSettings.showChatTime, 1);

    await bloc.close();
  });
}

SettingsPreferenceRef _refForHome(String title) {
  return _refFor(SettingsCategoryId.general, title);
}

SettingsPreferenceRef _sliderRefFor(SettingsCategoryId category) {
  final items = settingsPreferencesFor(category);
  final index = items.indexWhere((item) {
    return item.optionSet.controlType == SettingsPreferenceControlType.slider;
  });
  if (index < 0) {
    fail('Missing slider settings preference: $category');
  }

  return SettingsPreferenceRef(category: category, index: index);
}

SettingsPreferenceRef _optionRefFor(SettingsCategoryId category) {
  final items = settingsPreferencesFor(category);
  var index = items.indexWhere((item) {
    return item.optionSet == settingsResolutionOptionSet;
  });
  index = index >= 0
      ? index
      : items.indexWhere((item) {
          return item.optionSet.controlType ==
              SettingsPreferenceControlType.select;
        });
  if (index < 0) {
    fail('Missing option settings preference: $category');
  }

  return SettingsPreferenceRef(category: category, index: index);
}

SettingsPreferenceRef _refFor(SettingsCategoryId category, String title) {
  final items = settingsPreferencesFor(category);
  final index = items.indexWhere((item) => item.title == title);
  if (index < 0) {
    if (category == SettingsCategoryId.liveStreaming) {
      return _optionRefFor(category);
    }

    fail('Missing settings preference: $title');
  }

  return SettingsPreferenceRef(category: category, index: index);
}

Future<void> _waitFor(bool Function() condition) async {
  for (var attempt = 0; attempt < 20; attempt += 1) {
    if (condition()) {
      return;
    }
    await Future<void>.delayed(Duration.zero);
  }

  fail('Condition was not met.');
}

final class _FakeSettingsPreferencesRepository
    implements SettingsPreferencesRepository {
  _FakeSettingsPreferencesRepository({
    this.preferences = defaultSettingsPreferences,
    this.failSaves = false,
  });

  SettingsPreferences preferences;
  final bool failSaves;
  final savedPreferences = <SettingsPreferences>[];

  @override
  Future<SettingsPreferences> read() async {
    return preferences;
  }

  @override
  Future<void> save(SettingsPreferences preferences) async {
    if (failSaves) {
      throw StateError('save failed');
    }

    this.preferences = preferences;
    savedPreferences.add(preferences);
  }
}

final class _FakeSettingsUpdateRepository implements SettingsUpdateRepository {
  const _FakeSettingsUpdateRepository();

  @override
  Future<SettingsUpdateInfo> fetchLatestRelease() async {
    return const _FakeSettingsUpdateInfo(tagName: 'v0.4.1+1', body: '');
  }
}

final class _FakeSettingsUpdateInfo implements SettingsUpdateInfo {
  const _FakeSettingsUpdateInfo({
    required this.tagName,
    required this.body,
  });

  @override
  final String tagName;

  @override
  final String body;
}
