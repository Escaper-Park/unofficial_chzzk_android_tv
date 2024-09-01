import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';

class UpdateLogMarkdown extends StatelessWidget {
  const UpdateLogMarkdown({super.key, required this.log});

  final String log;

  @override
  Widget build(BuildContext context) {
    return Markdown(data: log);
  }
}
