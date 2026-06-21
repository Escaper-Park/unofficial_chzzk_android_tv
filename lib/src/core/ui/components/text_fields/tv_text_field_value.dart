part of 'tv_text_field.dart';

class _TvTextFieldValue extends StatelessWidget {
  const _TvTextFieldValue({
    required this.text,
    required this.showCursor,
    required this.design,
    required this.colorScheme,
    required this.textStyle,
    required this.showingHint,
    required this.cursorVisible,
  });

  final String text;
  final bool showCursor;
  final TvTextFieldDesign design;
  final ColorScheme colorScheme;
  final TextStyle? textStyle;
  final bool showingHint;
  final bool cursorVisible;

  @override
  Widget build(BuildContext context) {
    final resolvedStyle = textStyle?.copyWith(
      color: design.inputTextColor(
        colorScheme: colorScheme,
        showingHint: showingHint,
      ),
    );

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Flexible(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: resolvedStyle,
          ),
        ),
        if (showCursor)
          Opacity(
            opacity: cursorVisible ? 1 : 0,
            child: Container(
              key: const Key('tv-text-field-cursor'),
              width: design.cursorWidth,
              height: design.cursorHeight,
              margin: EdgeInsets.only(left: design.cursorGap),
              color: design.cursorColor(colorScheme),
            ),
          ),
      ],
    );
  }
}
