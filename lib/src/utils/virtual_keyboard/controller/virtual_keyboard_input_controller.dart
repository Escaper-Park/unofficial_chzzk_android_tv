import 'package:hangul/hangul.dart' as hangul;
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'virtual_keyboard_input_controller.g.dart';

@riverpod
class VirtualKeyboardInputController extends _$VirtualKeyboardInputController {
  @override
  String build() {
    return '';
  }

  void addKoreanCharacter(String char) {
    final input = hangul.HangulInput(state);

    input.pushCharacter(char);

    state = input.text;
  }

  void addCharacter(String char) {
    state = state + char;
  }

  void removeCharacter() {
    if (state.isNotEmpty) {
      state = state.substring(0, state.length - 1);
    }
  }

  void reset() {
    state = '';
  }
}
