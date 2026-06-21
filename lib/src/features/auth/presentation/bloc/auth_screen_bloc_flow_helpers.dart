part of 'auth_screen_bloc.dart';

extension _AuthScreenBlocFlowHelpers on AuthScreenBloc {
  void _onReloadRequested(
    _ReloadRequested event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(
        captcha: '',
        activeInput: state.activeInput == AuthInputField.captcha
            ? AuthInputField.password
            : state.activeInput,
        isCaptchaRequired: false,
        isKeyboardOpen: false,
        isSubmitting: false,
        isCapturingSession: false,
        reloadRequestId: state.reloadRequestId + 1,
        status: AuthScreenStatus.reloading,
      ),
    );
  }

  void _onLoginRequested(
    _LoginRequested event,
    Emitter<AuthScreenState> emit,
  ) {
    _emitLoginRequest(state, emit);
  }

  void _onWebViewLoadingChanged(
    _WebViewLoadingChanged event,
    Emitter<AuthScreenState> emit,
  ) {
    final status = switch ((event.isLoading, state.status)) {
      (true, _) => AuthScreenStatus.webViewLoading,
      (false, AuthScreenStatus.webViewLoading) => AuthScreenStatus.idle,
      _ => state.status,
    };

    emit(
      state.copyWith(
        isPageLoading: event.isLoading,
        status: status,
      ),
    );
  }

  void _onCaptchaRequirementChanged(
    _CaptchaRequirementChanged event,
    Emitter<AuthScreenState> emit,
  ) {
    final activeInput = switch ((event.isRequired, state.activeInput)) {
      (true, _) => AuthInputField.captcha,
      (false, AuthInputField.captcha) => AuthInputField.password,
      (false, final input) => input,
    };

    emit(
      state.copyWith(
        captcha: event.isRequired ? state.captcha : '',
        activeInput: activeInput,
        isCaptchaRequired: event.isRequired,
        isKeyboardOpen: event.isRequired,
        status: event.isRequired ? AuthScreenStatus.idle : _clearableStatus(),
      ),
    );
  }

  void _onLoginSubmissionStarted(
    _LoginSubmissionStarted event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(
        isSubmitting: true,
        isKeyboardOpen: false,
        status: AuthScreenStatus.submitting,
      ),
    );
  }

  void _onSessionCaptureStarted(
    _SessionCaptureStarted event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(
        isSubmitting: false,
        isCapturingSession: true,
        status: AuthScreenStatus.checkingSession,
      ),
    );
  }

  void _onSessionCapturePending(
    _SessionCapturePending event,
    Emitter<AuthScreenState> emit,
  ) {
    final status = state.isCaptchaRequired
        ? AuthScreenStatus.idle
        : AuthScreenStatus.sessionPending;

    emit(
      state.copyWith(
        isSubmitting: false,
        isCapturingSession: false,
        status: status,
      ),
    );
  }

  void _onLoginCompleted(
    _LoginCompleted event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(
        password: '',
        captcha: '',
        isSubmitting: false,
        isCapturingSession: false,
        isKeyboardOpen: false,
        isLoginCompleted: true,
        status: AuthScreenStatus.loginCompleted,
      ),
    );
  }

  void _onFailureReported(
    _FailureReported event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(
        password: '',
        captcha: '',
        isPageLoading: false,
        isSubmitting: false,
        isCapturingSession: false,
        status: event.status,
      ),
    );
  }
}
