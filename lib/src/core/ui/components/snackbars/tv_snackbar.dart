import 'package:flutter/material.dart';

import 'tv_snackbar_design.dart';

class TvSnackbar extends StatelessWidget {
  const TvSnackbar({
    super.key,
    required this.message,
    this.icon,
    this.maxLines = 1,
    this.alignToBottom = true,
  });

  final String message;
  final IconData? icon;
  final int maxLines;
  final bool alignToBottom;

  @override
  Widget build(BuildContext context) {
    final design = TvSnackbarDesign.resolve(
      hasIcon: icon != null,
      maxLines: maxLines,
    );
    final content = SizedBox(
      width: design.width,
      height: design.height,
      child: SnackBar(
        duration: TvSnackbarDesign.duration,
        behavior: SnackBarBehavior.floating,
        margin: EdgeInsets.zero,
        padding: EdgeInsets.zero,
        elevation: 0,
        animation: kAlwaysCompleteAnimation,
        backgroundColor: Theme.of(context).colorScheme.inverseSurface,
        shape: RoundedRectangleBorder(borderRadius: design.radius),
        content: _TvSnackbarContent(
          message: message,
          icon: icon,
          design: design,
        ),
      ),
    );

    if (!alignToBottom) {
      return content;
    }

    return Align(
      alignment: Alignment.bottomCenter,
      child: Padding(
        padding: TvSnackbarDesign.outsideSpacing,
        child: content,
      ),
    );
  }
}

class _TvSnackbarContent extends StatelessWidget {
  const _TvSnackbarContent({
    required this.message,
    required this.icon,
    required this.design,
  });

  final String message;
  final IconData? icon;
  final TvSnackbarDesign design;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: design.height,
      child: Padding(
        padding: design.padding,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: design.iconTextGap,
          children: [
            if (icon != null)
              SizedBox.square(
                dimension: design.iconContainerSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: colorScheme.onSurfaceVariant,
                    borderRadius: design.iconContainerRadius,
                  ),
                  child: Padding(
                    padding: design.iconPadding,
                    child: Icon(
                      icon,
                      size: design.iconSize,
                      color: colorScheme.onInverseSurface,
                    ),
                  ),
                ),
              ),
            Expanded(
              child: Text(
                message,
                maxLines: design.maxLines,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                  color: colorScheme.onInverseSurface,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
