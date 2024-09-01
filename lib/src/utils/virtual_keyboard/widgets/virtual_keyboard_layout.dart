import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../common/constants/styles.dart';
import '../../../common/widgets/rounded_container.dart';
import '../controller/virtual_keyboard_controller.dart';
import '../data/virtual_keyboard_data.dart';
import './virtual_keyboard_key_button.dart';

class VirtualKeyboardLayout extends HookConsumerWidget {
  /// Virtual keyboard gridview layout.
  ///
  /// Use with the [VirtualkeyboardInputField].
  const VirtualKeyboardLayout({
    super.key,
    this.borderRadius = 10.0,
    this.backgroundColor = AppColors.greyContainerColor,
    this.padding = const EdgeInsets.all(10.0),
    this.margin = const EdgeInsets.only(right: 16.0),
    this.language = KeyboardLanguage.english,
    required this.onEnterPressed,
  });

  final double borderRadius;
  final Color backgroundColor;

  /// Empty space inside between the layout container and key buttons.
  final EdgeInsetsGeometry padding;

  /// Outside padding.
  final EdgeInsetsGeometry margin;

  /// Initial language setting.
  final KeyboardLanguage language;

  /// Characters: add, Back: remove, Enter: onEnterPressed.
  final Function(String inputString) onEnterPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final focusScopeNode = useFocusScopeNode();

    final keyboardCase = useState<KeyboardCase>(KeyboardCase.lowerCase);
    final keyboardLanguage = useState<KeyboardLanguage>(language);

    final List<String> keyboardKeys = switch (keyboardLanguage.value) {
      // ENG
      KeyboardLanguage.english => keyboardCase.value == KeyboardCase.lowerCase
          ? KeyboardKeyData.lowerCaseKeys
          : KeyboardKeyData.upperCaseKeys,
      // KOR
      KeyboardLanguage.korean => keyboardCase.value == KeyboardCase.lowerCase
          ? KeyboardKeyData.lowerCaseKoreanKeys
          : KeyboardKeyData.upperCaseKoreanKeys
    };

    return RoundedContainer(
      margin: margin,
      padding: padding,
      child: FocusScope(
        node: focusScopeNode,
        child: GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          // Set this true for fitting the size of [GridView] to the size of children.
          shrinkWrap: true,
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 12,
            crossAxisSpacing: 5,
            mainAxisSpacing: 5,
            childAspectRatio: 1 / 1,
          ),
          itemCount: keyboardKeys.length,
          itemBuilder: (context, index) {
            return VirtualKeyboardKeyButton(
              autofocus: index == 0 ? true : false,
              fontColor:
                  // highlight shift
                  (index == 36 && keyboardCase.value == KeyboardCase.upperCase)
                      ? AppColors.chzzkColor
                      : AppColors.whiteColor,
              keyboardKey: keyboardKeys[index],
              onPressed: (keyboardKey) {
                switch (index) {
                  case 35: // Backspace: remove
                    ref
                        .read(virtualKeyboardControllerProvider.notifier)
                        .removeCharacter();
                    break;
                  case 36: // Shift: change case
                    keyboardCase.value =
                        (keyboardCase.value == KeyboardCase.lowerCase)
                            ? KeyboardCase.upperCase
                            : KeyboardCase.lowerCase;
                    break;
                  case 47: // Enter: onEnterPressed
                    final String inputString =
                        ref.read(virtualKeyboardControllerProvider);

                    onEnterPressed(inputString);
                    break;
                  case 48: // (KOR/ENG): change language
                    keyboardLanguage.value =
                        (keyboardLanguage.value == KeyboardLanguage.english)
                            ? KeyboardLanguage.korean
                            : KeyboardLanguage.english;

                  default:
                    ref
                        .read(virtualKeyboardControllerProvider.notifier)
                        .addCharacter(keyboardKey, keyboardLanguage.value);

                    break;
                }
              },
            );
          },
        ),
      ),
    );
  }
}
