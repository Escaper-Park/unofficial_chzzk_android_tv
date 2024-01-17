import 'package:flutter/material.dart';

class MenuHeaderText extends StatelessWidget {
  const MenuHeaderText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w700,
      ),
    );
  }
}
