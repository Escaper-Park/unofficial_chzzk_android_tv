import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common/constants/styles.dart';
import 'controller/virtual_keyboard_input_controller.dart';
import 'virtual_keyboard_key_button.dart';
import 'virtual_keyboard_keys.dart';

class VirtualKeyboardLayout extends HookConsumerWidget {
  const VirtualKeyboardLayout({
    super.key,
    required this.onEnterPressed,
  });

  final Function(String inputString) onEnterPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final keyboardCase = useState<KeyboardCase>(KeyboardCase.lowerCase);
    final keyboardLanguage =
        useState<KeyboardLanguage>(KeyboardLanguage.english);
    final focusScopeNode = useFocusScopeNode();

    List<String> keyboardKeys;

    if (keyboardLanguage.value == KeyboardLanguage.english) {
      keyboardKeys = keyboardCase.value == KeyboardCase.lowerCase
          ? VirtualKeyboardKeys.lowerCaseKeys
          : VirtualKeyboardKeys.upperCaseKeys;
    } else {
      keyboardKeys = keyboardCase.value == KeyboardCase.lowerCase
          ? VirtualKeyboardKeys.lowerCaseKoreanKeys
          : VirtualKeyboardKeys.upperCaseKoreanKeys;
    }

    return FocusScope(
      node: focusScopeNode,
      child: GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 12,
          crossAxisSpacing: 5.0,
          mainAxisSpacing: 5.0,
          childAspectRatio: 1 / 1,
        ),
        itemCount: keyboardKeys.length,
        itemBuilder: (context, index) {
          return VirtualKeyboardKeyButton(
            autofocus: index == 0 ? true : false,
            keyboardKey: keyboardKeys[index],
            onPressed: (keyboardKey) {
              switch (index) {
                case 35: // backspace
                  ref
                      .read(virtualKeyboardInputControllerProvider.notifier)
                      .removeCharacter();
                  break;
                case 36: // shift
                  keyboardCase.value =
                      (keyboardCase.value == KeyboardCase.lowerCase)
                          ? KeyboardCase.upperCase
                          : KeyboardCase.lowerCase;
                  break;
                case 47: // enter
                  final String inputString =
                      ref.read(virtualKeyboardInputControllerProvider);
                  onEnterPressed(inputString);
                  break;
                case 48: // KOR/ENG
                  keyboardLanguage.value =
                      (keyboardLanguage.value == KeyboardLanguage.english)
                          ? KeyboardLanguage.korean
                          : KeyboardLanguage.english;

                default:
                  ref
                      .read(virtualKeyboardInputControllerProvider.notifier)
                      .addCharacter(keyboardKey, keyboardLanguage.value);

                  break;
              }
            },
            fontColor:
                (index == 36 && keyboardCase.value == KeyboardCase.upperCase)
                    ? AppColors.chzzkColor
                    : AppColors.whiteColor,
          );
        },
      ),
    );
  }
}
