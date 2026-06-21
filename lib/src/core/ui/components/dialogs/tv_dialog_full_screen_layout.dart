part of 'tv_dialog.dart';

class _TvFullScreenDialog extends StatelessWidget {
  const _TvFullScreenDialog({
    required this.dialog,
  });

  final TvDialog dialog;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return Align(
      alignment: Alignment.center,
      child: SizedBox(
        width: TvDialogDesign.fullScreenWidth,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            _TvDialogIcon(icon: dialog.icon),
            const SizedBox(height: TvDialogDesign.iconTitleGap),
            Text(
              dialog.title,
              textAlign: TextAlign.center,
              style: textTheme.headlineMedium?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: TvDialogDesign.titleContentGap),
            Text(
              dialog.content,
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge?.copyWith(
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: TvDialogDesign.contentActionGap),
            _TvFullScreenDialogActions(
              dialog: dialog,
              buttonDesign: _fullScreenButtonDesign,
            ),
          ],
        ),
      ),
    );
  }

  TvButtonDesign get _fullScreenButtonDesign {
    return TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: null,
    ).copyWith(focusedScale: TvDialogDesign.focusedActionScale);
  }
}

class _TvFullScreenDialogActions extends StatelessWidget {
  const _TvFullScreenDialogActions({
    required this.dialog,
    required this.buttonDesign,
  });

  final TvDialog dialog;
  final TvButtonDesign buttonDesign;

  @override
  Widget build(BuildContext context) {
    if (dialog.type == TvDialogType.confirm) {
      return SizedBox(
        width: double.infinity,
        child: TvButton.label(
          text: dialog.primaryLabel,
          onPressed: dialog.onPrimaryPressed,
          design: buttonDesign,
          autofocus: true,
        ),
      );
    }

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: TvDialogDesign.actionsGap,
      children: [
        TvButton.label(
          text: dialog.secondaryLabel!,
          onPressed: dialog.onSecondaryPressed!,
          design: buttonDesign,
          autofocus: true,
        ),
        TvButton.label(
          text: dialog.primaryLabel,
          onPressed: dialog.onPrimaryPressed,
          design: buttonDesign,
          autofocus: false,
        ),
      ],
    );
  }
}

class _TvDialogIcon extends StatelessWidget {
  const _TvDialogIcon({
    required this.icon,
  });

  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return SizedBox.square(
      dimension: TvDialogDesign.iconContainerSize,
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.surfaceContainerHighest,
          borderRadius: TvDialogDesign.iconRadius,
        ),
        child: Icon(
          icon ?? Icons.logout,
          size: TvDialogDesign.iconSize,
          color: colorScheme.onSurface,
        ),
      ),
    );
  }
}
