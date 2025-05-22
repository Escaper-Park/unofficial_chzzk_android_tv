import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:hangul/hangul.dart' show HangulInput;

import '../../../common/constants/enums.dart'
    show KeyboardCase, KeyboardLanguage;
import '../data/virtual_keyboard_data.dart' show VirtualKeyboardData;

part 'virtual_keyboard_controller.g.dart';

@riverpod
class VirtualKeyboardController extends _$VirtualKeyboardController {
  @override
  String build({required String routeName}) {
    return '';
  }

  void addCharacter({
    required String char,
    required KeyboardLanguage language,
  }) {
    switch (language) {
      case KeyboardLanguage.english:
        state = state + char;
      case KeyboardLanguage.korean:
        _addKoreanCharacter(char);
    }
  }

  void _addKoreanCharacter(String char) {
    final currentInput = HangulInput(state);
    currentInput.pushCharacter(char);
    state = currentInput.text;
  }

  void removeLastCharacter() {
    if (state.isNotEmpty) state = state.substring(0, state.length - 1);
  }

  void reset() {
    state = '';
  }
}

mixin class VirtualKeyboardEvent {
  VirtualKeyboardController _controller(WidgetRef ref, String routeName) =>
      ref.read(
        virtualKeyboardControllerProvider(routeName: routeName).notifier,
      );

  String _getCurrentInput(WidgetRef ref, String routeName) =>
      ref.read(virtualKeyboardControllerProvider(routeName: routeName));

  void _addCharacter(
    WidgetRef ref, {
    required String routeName,
    required String char,
    required KeyboardLanguage language,
  }) {
    _controller(ref, routeName).addCharacter(char: char, language: language);
  }

  void onKeyPressed(
    WidgetRef ref, {
    required String routeName,
    required String char,
    required KeyboardLanguage language,
    void Function(String inputText)? onKeyPressed,
  }) {
    _addCharacter(ref, routeName: routeName, char: char, language: language);

    if (onKeyPressed != null) {
      final String inputText = _getCurrentInput(ref, routeName);
      onKeyPressed(inputText);
    }
  }

  void removeLastCharacter(
    WidgetRef ref, {
    required String routeName,
    void Function(String inputText)? onKeyPressed,
  }) {
    _controller(ref, routeName).removeLastCharacter();

    if (onKeyPressed != null) {
      final String inputText = _getCurrentInput(ref, routeName);
      onKeyPressed(inputText);
    }
  }

  void reset(WidgetRef ref, String routeName) {
    _controller(ref, routeName).reset();
  }

  void changeCase(ValueNotifier<KeyboardCase> keyboardCaseState) {
    keyboardCaseState.value = (keyboardCaseState.value == KeyboardCase.lower)
        ? KeyboardCase.upper
        : KeyboardCase.lower;
  }

  void changeLanguage(ValueNotifier<KeyboardLanguage> keyboardLanguageState) {
    keyboardLanguageState.value =
        (keyboardLanguageState.value == KeyboardLanguage.english)
            ? KeyboardLanguage.korean
            : KeyboardLanguage.english;
  }

  void enter(
    WidgetRef ref,
    String routeName,
    Function(String key) onEnterPressed,
  ) {
    final String inputText = _getCurrentInput(ref, routeName);
    onEnterPressed(inputText);
  }
}

mixin class VirtualKeyboardState {
  String currentInputText(WidgetRef ref, String routeName) =>
      ref.watch(virtualKeyboardControllerProvider(routeName: routeName));

  List<String> getQwertyKeyboardKeys(
    KeyboardCase keyboardCase,
    KeyboardLanguage language,
  ) {
    return switch (language) {
      KeyboardLanguage.english => keyboardCase == KeyboardCase.lower
          ? VirtualKeyboardData.qwertyLowerCaseKeys
          : VirtualKeyboardData.qwertyUpperCaseKeys,
      KeyboardLanguage.korean => keyboardCase == KeyboardCase.lower
          ? VirtualKeyboardData.qwertyLowerCaseKoreanKeys
          : VirtualKeyboardData.qwertyUpperCaseKoreanKeys,
    };
  }
}
