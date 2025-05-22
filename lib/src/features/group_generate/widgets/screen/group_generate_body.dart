part of '../../group_generate_screen.dart';

class _GroupGenerateBody extends StatelessWidget {
  const _GroupGenerateBody({
    required this.header,
    required this.inputField,
    required this.keyboard,
  });

  final Widget header;
  final Widget inputField;
  final Widget keyboard;

  @override
  Widget build(BuildContext context) {
    final keyboardWidth = context.screenWidth * 0.6;

    return Column(
      children: [
        Expanded(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              header,
              inputField,
            ],
          ),
        ),
        SizedBox(
          width: keyboardWidth,
          child: keyboard,
        ),
      ],
    );
  }
}
