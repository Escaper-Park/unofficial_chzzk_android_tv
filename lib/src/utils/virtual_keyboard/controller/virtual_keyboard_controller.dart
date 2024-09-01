import 'package:hangul/hangul.dart' as hangul;
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../data/virtual_keyboard_data.dart';

part 'virtual_keyboard_controller.g.dart';

@riverpod
class VirtualKeyboardController extends _$VirtualKeyboardController {
  // Input
  @override
  String build() {
    return '';
  }

  void addCharacter(String char, KeyboardLanguage language) {
    // ENG
    if (language == KeyboardLanguage.english) {
      state = state + char;
    }
    // KOR
    else {
      _addKoreanCharacter(char);
    }
  }

  void _addKoreanCharacter(String char) {
    final input = hangul.HangulInput(state);

    input.pushCharacter(char);

    state = input.text;
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
