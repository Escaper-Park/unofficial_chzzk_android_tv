import 'package:flutter/material.dart';

class CenterText extends StatelessWidget {
  const CenterText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(text),
    );
  }
}
