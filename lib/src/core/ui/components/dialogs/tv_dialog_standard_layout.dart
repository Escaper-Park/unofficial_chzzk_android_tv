part of 'tv_dialog.dart';

class _TvStandardDialog extends StatelessWidget {
  const _TvStandardDialog({
    required this.dialog,
  });

  final TvDialog dialog;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;

    return SizedBox(
      width: TvDialogDesign.standardWidth,
      child: AlertDialog(
        constraints: const BoxConstraints.tightFor(
          width: TvDialogDesign.standardWidth,
        ),
        insetPadding: EdgeInsets.zero,
        titlePadding: TvDialogDesign.standardTitlePadding,
        contentPadding: TvDialogDesign.standardContentPadding,
        actionsPadding: TvDialogDesign.standardActionsPadding,
        buttonPadding: EdgeInsets.zero,
        backgroundColor: colorScheme.inverseSurface,
        elevation: TvDialogDesign.standardElevation,
        shadowColor: Colors.black,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: TvDialogDesign.standardRadius,
        ),
        title: Text(
          dialog.title,
          style: textTheme.headlineSmall?.copyWith(color: colorScheme.surface),
        ),
        content: Text(
          dialog.content,
          style: textTheme.bodyMedium?.copyWith(
            color: colorScheme.surfaceContainerHighest,
          ),
        ),
        actions: [
          _TvStandardDialogActions(dialog: dialog),
        ],
      ),
    );
  }
}

class _TvStandardDialogActions extends StatelessWidget {
  const _TvStandardDialogActions({
    required this.dialog,
  });

  final TvDialog dialog;

  @override
  Widget build(BuildContext context) {
    if (dialog.type == TvDialogType.confirm) {
      return _TvDialogAction(
        label: dialog.primaryLabel,
        onPressed: dialog.onPrimaryPressed,
        autofocus: true,
        size: const Size(
          TvDialogDesign.standardActionFullWidth,
          TvDialogDesign.standardActionHeight,
        ),
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: TvDialogDesign.actionsGap,
      children: [
        _TvDialogAction(
          label: dialog.secondaryLabel!,
          onPressed: dialog.onSecondaryPressed!,
          autofocus: true,
        ),
        _TvDialogAction(
          label: dialog.primaryLabel,
          onPressed: dialog.onPrimaryPressed,
          autofocus: false,
        ),
      ],
    );
  }
}
