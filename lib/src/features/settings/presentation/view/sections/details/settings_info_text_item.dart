import 'package:flutter/material.dart';

import '../../../settings_screen_design.dart';

class SettingsInfoTextItem extends StatelessWidget {
  const SettingsInfoTextItem({
    super.key,
    required this.title,
    required this.description,
    this.focusNode,
    this.autofocus = false,
  });

  final String title;
  final String description;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final child = SizedBox(
      width: double.infinity,
      child: Padding(
        padding: SettingsScreenDesign.infoTextPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              softWrap: true,
              style: textTheme.titleSmall?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: SettingsScreenDesign.infoTextTitleGap),
            Text(
              description,
              softWrap: true,
              style: textTheme.bodySmall?.copyWith(
                color: colorScheme.onSurface.withValues(alpha: 0.82),
                height: 1.35,
              ),
            ),
          ],
        ),
      ),
    );

    if (focusNode == null && !autofocus) {
      return child;
    }

    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      includeSemantics: false,
      child: child,
    );
  }
}
