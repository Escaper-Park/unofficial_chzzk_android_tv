import 'package:flutter/material.dart';

class VodPlayerChapterTextBlock extends StatelessWidget {
  const VodPlayerChapterTextBlock({
    super.key,
    required this.title,
    required this.timeText,
    required this.titleStyle,
    required this.timeStyle,
  });

  final String title;
  final String timeText;
  final TextStyle? titleStyle;
  final TextStyle? timeStyle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: titleStyle,
        ),
        const SizedBox(height: 4),
        SizedBox(
          width: double.infinity,
          child: Text(
            timeText,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.left,
            style: timeStyle,
          ),
        ),
      ],
    );
  }
}
