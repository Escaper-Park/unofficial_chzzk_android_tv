part of 'tv_dialog.dart';

class _TvDialogBackground extends StatelessWidget {
  const _TvDialogBackground({
    required this.dialog,
  });

  final TvDialog dialog;

  @override
  Widget build(BuildContext context) {
    if (dialog.backgroundType == TvDialogBackgroundType.fullScreen) {
      return ColoredBox(color: Theme.of(context).scaffoldBackgroundColor);
    }

    return const TvScrim(type: TvScrimType.dialog);
  }
}
