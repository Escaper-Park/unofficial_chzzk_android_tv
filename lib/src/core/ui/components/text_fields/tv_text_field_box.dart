part of 'tv_text_field.dart';

class _TvTextFieldBox extends StatelessWidget {
  const _TvTextFieldBox({
    required this.value,
    required this.hintText,
    required this.showHint,
    required this.active,
    required this.focused,
    required this.design,
    required this.colorScheme,
    required this.textStyle,
    required this.cursorVisible,
  });

  final String value;
  final String? hintText;
  final bool showHint;
  final bool active;
  final bool focused;
  final TvTextFieldDesign design;
  final ColorScheme colorScheme;
  final TextStyle? textStyle;
  final bool cursorVisible;

  @override
  Widget build(BuildContext context) {
    final showingHint =
        showHint && !active && value.isEmpty && hintText != null;
    final border = OutlineInputBorder(
      borderRadius: design.radius,
      borderSide: BorderSide(
        color: design.outlineColor(
          colorScheme: colorScheme,
          active: active,
        ),
        width: design.outlineWidth,
      ),
    );

    return SizedBox(
      height: design.fieldHeight,
      child: InputDecorator(
        isFocused: focused,
        isEmpty: !showingHint && value.isEmpty,
        decoration: InputDecoration(
          isDense: true,
          filled: true,
          fillColor: design.fieldBackgroundColor(
            colorScheme: colorScheme,
            focused: focused,
            active: active,
          ),
          contentPadding: design.fieldPadding,
          enabledBorder: border,
          focusedBorder: border,
          border: border,
        ),
        child: Align(
          alignment: Alignment.centerLeft,
          child: _TvTextFieldValue(
            text: showingHint ? hintText! : value,
            showCursor: active,
            design: design,
            colorScheme: colorScheme,
            textStyle: textStyle,
            showingHint: showingHint,
            cursorVisible: cursorVisible,
          ),
        ),
      ),
    );
  }
}
