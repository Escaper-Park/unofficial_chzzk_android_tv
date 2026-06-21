import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hangul/hangul.dart';

import 'tv_keyboard_state.dart';

class TvKeyboardCubit extends Cubit<TvKeyboardState> {
  TvKeyboardCubit({
    String initialValue = '',
    TvKeyboardInputMode initialInputMode = TvKeyboardInputMode.korean,
    this.onChanged,
    this.onSubmitted,
    this.onCancelled,
  }) : _input = HangulInput(initialValue),
       super(
         TvKeyboardState(
           value: initialValue,
           inputMode: initialInputMode,
           isShifted: false,
           isCapsLocked: false,
         ),
       );

  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;
  final VoidCallback? onCancelled;

  final HangulInput _input;

  void setInputMode(TvKeyboardInputMode inputMode) {
    emit(
      state.copyWith(
        inputMode: inputMode,
        isShifted: false,
        isCapsLocked: false,
      ),
    );
  }

  void toggleShift() {
    emit(state.copyWith(isShifted: !state.isShifted));
  }

  void toggleCapsLock() {
    emit(
      state.copyWith(
        isCapsLocked: !state.isCapsLocked,
        isShifted: false,
      ),
    );
  }

  void inputCharacter(String character) {
    _input.pushCharacter(character);
    _emitValue();
  }

  void backspace() {
    _input.backspace();
    _emitValue();
  }

  void clear() {
    _input.clear();
    _emitValue();
  }

  void submit() {
    onSubmitted?.call(state.value);
  }

  void cancel() {
    onCancelled?.call();
  }

  void _emitValue() {
    final value = _input.text;
    emit(
      state.copyWith(
        value: value,
        isShifted: false,
      ),
    );
    onChanged?.call(value);
  }
}
