import 'dart:async';

import '../../../../core/tv/keyboard/keyboard.dart';
import '../bloc/auth_screen_bloc.dart';

final class AuthKeyboardBinding {
  AuthKeyboardBinding(this._bloc);

  final AuthScreenBloc _bloc;

  TvKeyboardCubit? _cubit;
  AuthInputField? _input;

  TvKeyboardCubit? get cubit => _cubit;

  void sync(AuthScreenState state) {
    if (_input == state.activeInput &&
        _cubit?.state.value == state.activeValue) {
      return;
    }

    closeKeyboard();
    _input = state.activeInput;
    _cubit = TvKeyboardCubit(
      initialValue: state.activeValue,
      initialInputMode: state.activeInput == AuthInputField.captcha
          ? TvKeyboardInputMode.korean
          : TvKeyboardInputMode.english,
      onChanged: (value) {
        _bloc.add(AuthScreenEvent.keyboardValueChanged(value));
      },
      onSubmitted: (value) {
        _bloc.add(AuthScreenEvent.keyboardSubmitted(value));
      },
      onCancelled: () {
        _bloc.add(const AuthScreenEvent.keyboardClosed());
      },
    );
  }

  void closeKeyboard() {
    final cubit = _cubit;
    if (cubit != null) {
      unawaited(cubit.close());
    }
    _cubit = null;
    _input = null;
  }

  void dispose() {
    closeKeyboard();
  }
}
