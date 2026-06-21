import 'package:freezed_annotation/freezed_annotation.dart';

part 'tv_keyboard_state.freezed.dart';

enum TvKeyboardInputMode {
  korean,
  english,
}

@freezed
abstract class TvKeyboardState with _$TvKeyboardState {
  const factory TvKeyboardState({
    required String value,
    required TvKeyboardInputMode inputMode,
    required bool isShifted,
    required bool isCapsLocked,
  }) = _TvKeyboardState;
}
