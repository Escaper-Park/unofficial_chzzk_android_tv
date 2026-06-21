part of 'tv_text_field.dart';

class _TvTextFieldText extends StatelessWidget {
  const _TvTextFieldText({
    required this.text,
    required this.color,
    required this.style,
  });

  final String text;
  final Color color;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      style: style?.copyWith(color: color),
    );
  }
}
