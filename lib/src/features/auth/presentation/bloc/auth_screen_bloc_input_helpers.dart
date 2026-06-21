part of 'auth_screen_bloc.dart';

extension _AuthScreenBlocInputHelpers on AuthScreenBloc {
  void _onInputSelected(
    _InputSelected event,
    Emitter<AuthScreenState> emit,
  ) {
    if (event.input == AuthInputField.captcha && !state.isCaptchaRequired) {
      return;
    }

    emit(
      state.copyWith(
        activeInput: event.input,
        isKeyboardOpen: true,
        status: _clearableStatus(),
      ),
    );
  }

  void _onKeyboardValueChanged(
    _KeyboardValueChanged event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      _withActiveValue(event.value).copyWith(status: _clearableStatus()),
    );
  }

  void _onKeyboardSubmitted(
    _KeyboardSubmitted event,
    Emitter<AuthScreenState> emit,
  ) {
    final nextState = _withActiveValue(event.value);
    switch (nextState.activeInput) {
      case AuthInputField.naverId:
        if (nextState.naverId.trim().isEmpty) {
          emit(
            nextState.copyWith(
              status: AuthScreenStatus.enterIdFirst,
            ),
          );
          return;
        }
        emit(
          nextState.copyWith(
            activeInput: AuthInputField.password,
            isKeyboardOpen: true,
            status: AuthScreenStatus.idle,
          ),
        );
      case AuthInputField.password:
        if (nextState.isCaptchaRequired) {
          emit(
            nextState.copyWith(
              activeInput: AuthInputField.captcha,
              isKeyboardOpen: true,
              status: AuthScreenStatus.idle,
            ),
          );
          return;
        }
        _emitLoginRequest(nextState, emit);
      case AuthInputField.captcha:
        _emitLoginRequest(nextState, emit);
    }
  }

  void _onKeyboardClosed(
    _KeyboardClosed event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(state.copyWith(isKeyboardOpen: false));
  }

  void _onPasswordVisibilityToggled(
    _PasswordVisibilityToggled event,
    Emitter<AuthScreenState> emit,
  ) {
    emit(
      state.copyWith(isPasswordVisible: !state.isPasswordVisible),
    );
  }

  void _emitLoginRequest(
    AuthScreenState source,
    Emitter<AuthScreenState> emit,
  ) {
    if (source.naverId.trim().isEmpty) {
      emit(
        source.copyWith(
          activeInput: AuthInputField.naverId,
          isKeyboardOpen: true,
          status: AuthScreenStatus.enterIdFirst,
        ),
      );
      return;
    }

    if (source.password.isEmpty) {
      emit(
        source.copyWith(
          activeInput: AuthInputField.password,
          isKeyboardOpen: true,
          status: AuthScreenStatus.enterPassword,
        ),
      );
      return;
    }

    if (source.isCaptchaRequired && source.captcha.trim().isEmpty) {
      emit(
        source.copyWith(
          activeInput: AuthInputField.captcha,
          isKeyboardOpen: true,
          status: AuthScreenStatus.idle,
        ),
      );
      return;
    }

    emit(
      source.copyWith(
        isKeyboardOpen: false,
        submitRequestId: source.submitRequestId + 1,
        status: AuthScreenStatus.idle,
      ),
    );
  }

  AuthScreenState _withActiveValue(String value) {
    return switch (state.activeInput) {
      AuthInputField.naverId => state.copyWith(naverId: value),
      AuthInputField.password => state.copyWith(password: value),
      AuthInputField.captcha => state.copyWith(captcha: value),
    };
  }

  AuthScreenStatus _clearableStatus() {
    if (state.isSubmitting || state.isCapturingSession) {
      return state.status;
    }

    return AuthScreenStatus.idle;
  }
}
