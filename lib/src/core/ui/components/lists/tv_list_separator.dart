import 'package:flutter/material.dart';

class TvListHeader extends StatelessWidget {
  const TvListHeader({
    super.key,
    required this.text,
    this.leading,
    this.trailing,
    this.dense = false,
    this.showDivider = false,
  });

  final String text;
  final Widget? leading;
  final Widget? trailing;
  final bool dense;
  final bool showDivider;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    final textStyle = dense ? textTheme.labelMedium : textTheme.titleLarge;

    return SizedBox(
      height: dense ? 36 : 52,
      child: Column(
        children: [
          Expanded(
            child: Padding(
              padding: dense
                  ? const EdgeInsets.symmetric(horizontal: 12, vertical: 10)
                  : const EdgeInsets.fromLTRB(16, 8, 16, 16),
              child: Row(
                spacing: dense ? 6 : 8,
                mainAxisAlignment: dense
                    ? MainAxisAlignment.center
                    : MainAxisAlignment.start,
                children: [
                  if (leading != null)
                    SizedBox.square(dimension: dense ? 16 : 24, child: leading),
                  Flexible(
                    child: Text(
                      text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      textAlign: dense ? TextAlign.center : TextAlign.left,
                      style: textStyle?.copyWith(
                        color: colorScheme.inverseSurface,
                      ),
                    ),
                  ),
                  if (trailing != null)
                    SizedBox.square(
                      dimension: dense ? 16 : 24,
                      child: trailing,
                    ),
                ],
              ),
            ),
          ),
          if (showDivider) const TvListDivider(),
        ],
      ),
    );
  }
}

class TvListSectionHeader extends StatelessWidget {
  const TvListSectionHeader({
    super.key,
    required this.text,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox(
      height: 32,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Align(
          alignment: Alignment.centerLeft,
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
              color: colorScheme.inverseSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
      ),
    );
  }
}

class TvListDivider extends StatelessWidget {
  const TvListDivider({super.key});

  @override
  Widget build(BuildContext context) {
    return Divider(
      height: 1,
      thickness: 1,
      color: Theme.of(context).colorScheme.outlineVariant,
    );
  }
}
