import 'package:flutter/material.dart';

class FocusUtils {
  static void changeFocus({
    required FocusNode currentFocus,
    required FocusNode nextFocus,
  }) async {
    // If currentFocus == nextFocus, show textfield keyboard again.
    currentFocus.unfocus();

    await Future.delayed(const Duration(milliseconds: 300)).then((_) {
      nextFocus.requestFocus();
    });
  }
}
