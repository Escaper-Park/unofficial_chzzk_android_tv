part of 'home_bloc.dart';

@freezed
sealed class HomeEvent with _$HomeEvent {
  const factory HomeEvent.started({
    required bool isSignedIn,
  }) = _Started;

  const factory HomeEvent.refreshRequested({
    required bool isSignedIn,
  }) = _RefreshRequested;
}
