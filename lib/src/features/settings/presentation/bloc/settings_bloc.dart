import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/utils/utils.dart';
import '../../domain/entities/settings_preferences.dart';
import '../../domain/entities/settings_update_info.dart';
import '../../domain/repositories/settings_preferences_repository.dart';
import '../../domain/repositories/settings_update_repository.dart';
import '../models/settings_preference_groups.dart';

part 'settings_bloc.freezed.dart';
part 'settings_event.dart';
part 'settings_bloc_preference_helpers.dart';
part 'settings_bloc_update_helpers.dart';
part 'settings_state.dart';

final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.preferencesRepository,
    required this.updateRepository,
  }) : super(const SettingsState()) {
    _sliderPreferencesCommit = DebouncedValueCommit<SettingsPreferences>(
      delay: _sliderSaveDebounceDuration,
      onDebounceElapsed: () {
        if (!isClosed) {
          add(const SettingsEvent.sliderSaveDebounceElapsed());
        }
      },
    );

    on<_Started>(_onStarted);
    on<_MenuSelected>(_onMenuSelected);
    on<_ToggleRequested>(_onToggleRequested);
    on<_EditorOpened>(_onEditorOpened);
    on<_EditorClosed>(_onEditorClosed);
    on<_OptionSelected>(_onOptionSelected);
    on<_SliderChanged>(_onSliderChanged);
    on<_SliderChangeCommitted>(_onSliderChangeCommitted);
    on<_SliderSaveDebounceElapsed>(_onSliderSaveDebounceElapsed);
    on<_ResetRequested>(_onResetRequested);
    on<_UpdateCheckRequested>(_onUpdateCheckRequested);
  }

  final SettingsPreferencesRepository preferencesRepository;
  final SettingsUpdateRepository updateRepository;
  late final DebouncedValueCommit<SettingsPreferences> _sliderPreferencesCommit;
  var _persistedPreferences = defaultSettingsPreferences;

  static const _sliderSaveDebounceDuration = Duration(milliseconds: 500);

  @override
  Future<void> close() async {
    try {
      if (_sliderPreferencesCommit.hasPendingValue) {
        final pendingPreferences = _sliderPreferencesCommit.takePendingValue();
        try {
          await preferencesRepository.save(pendingPreferences);
        } on Object {
          // Bloc is closing, so there is no live state left to report failure to.
        }
      }
    } finally {
      _sliderPreferencesCommit.dispose();
    }

    return super.close();
  }
}
