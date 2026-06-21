part of 'auth_screen_bloc.dart';

enum AuthInputField {
  naverId,
  password,
  captcha,
}

enum AuthScreenStatus {
  idle,
  webViewLoading,
  reloading,
  submitting,
  checkingSession,
  sessionPending,
  loginCompleted,
  enterIdFirst,
  enterPassword,
  prepareLoginFailure,
  webViewControlFailure,
  loginPageLoadFailure,
}

@Freezed(toStringOverride: false)
abstract class AuthScreenState with _$AuthScreenState {
  const AuthScreenState._();

  const factory AuthScreenState({
    @Default('') String naverId,
    @Default('') String password,
    @Default('') String captcha,
    @Default(AuthInputField.naverId) AuthInputField activeInput,
    @Default(false) bool isCaptchaRequired,
    @Default(false) bool isPasswordVisible,
    @Default(false) bool isKeyboardOpen,
    @Default(false) bool isPageLoading,
    @Default(false) bool isSubmitting,
    @Default(false) bool isCapturingSession,
    @Default(false) bool isLoginCompleted,
    @Default(0) int reloadRequestId,
    @Default(0) int submitRequestId,
    @Default(AuthScreenStatus.idle) AuthScreenStatus status,
  }) = _AuthScreenState;

  String get activeValue {
    return switch (activeInput) {
      AuthInputField.naverId => naverId,
      AuthInputField.password => password,
      AuthInputField.captcha => captcha,
    };
  }
}
