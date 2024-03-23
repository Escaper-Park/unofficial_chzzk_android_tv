import 'package:flutter/material.dart';

import '../../../../common/widgets/center_text.dart';
import '../../../../common/widgets/focused_outline_button.dart';

class LiveExploreErrorButton extends StatelessWidget {
  const LiveExploreErrorButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: IntrinsicWidth(
        child: IntrinsicHeight(
          child: FocusedOutlineButton(
            padding: const EdgeInsets.all(10.0),
            autofocus: true,
            onPressed: onPressed,
            child: CenterText(text: text),
          ),
        ),
      ),
    );
  }
}
