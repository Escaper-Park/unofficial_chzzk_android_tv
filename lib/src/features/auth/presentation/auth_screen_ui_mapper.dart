import 'auth_screen_string.dart';
import 'bloc/auth_screen_bloc.dart';

abstract final class AuthScreenUiMapper {
  static String description(AuthScreenState state) {
    final message = statusMessage(state.status);
    if (message != null) {
      return message;
    }

    return switch (state.activeInput) {
      AuthInputField.naverId => AuthScreenString.idDescription,
      AuthInputField.password => AuthScreenString.passwordDescription,
      AuthInputField.captcha => AuthScreenString.captchaDescription,
    };
  }

  static String passwordActionLabel(AuthScreenState state) {
    if (state.isPasswordVisible) {
      return AuthScreenString.hidePassword;
    }

    return AuthScreenString.showPassword;
  }

  static String? statusMessage(AuthScreenStatus status) {
    return switch (status) {
      AuthScreenStatus.idle => null,
      AuthScreenStatus.webViewLoading => AuthScreenString.webViewLoading,
      AuthScreenStatus.reloading => AuthScreenString.reloading,
      AuthScreenStatus.submitting => AuthScreenString.submitting,
      AuthScreenStatus.checkingSession => AuthScreenString.checkingSession,
      AuthScreenStatus.sessionPending => AuthScreenString.sessionPending,
      AuthScreenStatus.loginCompleted => AuthScreenString.loginCompleted,
      AuthScreenStatus.enterIdFirst => AuthScreenString.enterIdFirst,
      AuthScreenStatus.enterPassword => AuthScreenString.enterPassword,
      AuthScreenStatus.prepareLoginFailure =>
        AuthScreenString.prepareLoginFailure,
      AuthScreenStatus.webViewControlFailure =>
        AuthScreenString.webViewControlFailure,
      AuthScreenStatus.loginPageLoadFailure =>
        AuthScreenString.loginPageLoadFailure,
    };
  }
}
