part of '../../group_generate_screen.dart';

class _GroupGenerateKeyboard extends StatelessWidget {
  const _GroupGenerateKeyboard({
    required this.onEnterPressed,
  });

  final void Function(String groupName) onEnterPressed;

  @override
  Widget build(BuildContext context) {
    return VirtualKeyboardLayout(
      routeName: AppRoute.groupGenerate.routeName,
      initialLanguage: KeyboardLanguage.korean,
      enterKeyName: '만들기',
      onEnterPressed: (inputText) => onEnterPressed(inputText),
    );
  }
}
