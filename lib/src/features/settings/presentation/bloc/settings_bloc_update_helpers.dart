part of 'settings_bloc.dart';

extension _SettingsBlocUpdateHelpers on SettingsBloc {
  Future<void> _onUpdateCheckRequested(
    _UpdateCheckRequested event,
    Emitter<SettingsState> emit,
  ) async {
    emit(
      state.copyWith(
        updateStatus: SettingsUpdateStatus.checking,
        latestRelease: null,
      ),
    );

    try {
      final latestRelease = await updateRepository.fetchLatestRelease();
      emit(
        state.copyWith(
          updateStatus: SettingsUpdateStatus.success,
          latestRelease: latestRelease,
        ),
      );
    } on Object {
      emit(
        state.copyWith(
          updateStatus: SettingsUpdateStatus.failure,
          latestRelease: null,
        ),
      );
    }
  }
}
