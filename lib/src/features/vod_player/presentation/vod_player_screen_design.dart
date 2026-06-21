import 'package:flutter/material.dart';

abstract final class VodPlayerScreenDesign {
  static const backgroundColor = Color(0xFF000000);
  static const statusMaxWidth = 420.0;
  static const statusContentGap = 16.0;
  static const exitNoticeDuration = Duration(seconds: 2);
  static const seekFeedbackDuration = Duration(milliseconds: 760);

  static TextStyle? statusTextStyle(BuildContext context) {
    return Theme.of(context).textTheme.titleMedium?.copyWith(
      color: Theme.of(context).colorScheme.onSurface,
    );
  }
}
