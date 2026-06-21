part of 'auth_screen_bloc.dart';

@Freezed(toStringOverride: false)
sealed class AuthScreenEvent with _$AuthScreenEvent {
  const factory AuthScreenEvent.inputSelected(AuthInputField input) =
      _InputSelected;

  const factory AuthScreenEvent.keyboardValueChanged(String value) =
      _KeyboardValueChanged;

  const factory AuthScreenEvent.keyboardSubmitted(String value) =
      _KeyboardSubmitted;

  const factory AuthScreenEvent.keyboardClosed() = _KeyboardClosed;

  const factory AuthScreenEvent.passwordVisibilityToggled() =
      _PasswordVisibilityToggled;

  const factory AuthScreenEvent.reloadRequested() = _ReloadRequested;

  const factory AuthScreenEvent.loginRequested() = _LoginRequested;

  const factory AuthScreenEvent.webViewLoadingChanged({
    required bool isLoading,
  }) = _WebViewLoadingChanged;

  const factory AuthScreenEvent.captchaRequirementChanged({
    required bool isRequired,
  }) = _CaptchaRequirementChanged;

  const factory AuthScreenEvent.loginSubmissionStarted() =
      _LoginSubmissionStarted;

  const factory AuthScreenEvent.sessionCaptureStarted() =
      _SessionCaptureStarted;

  const factory AuthScreenEvent.sessionCapturePending() =
      _SessionCapturePending;

  const factory AuthScreenEvent.loginCompleted() = _LoginCompleted;

  const factory AuthScreenEvent.failureReported(AuthScreenStatus status) =
      _FailureReported;
}
