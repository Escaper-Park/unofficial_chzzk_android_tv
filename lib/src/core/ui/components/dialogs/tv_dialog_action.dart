part of 'tv_dialog.dart';

class _TvDialogAction extends HookWidget {
  const _TvDialogAction({
    required this.label,
    required this.onPressed,
    required this.autofocus,
    this.size = TvDialogDesign.standardActionSize,
  });

  final String label;
  final VoidCallback onPressed;
  final bool autofocus;
  final Size size;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    final colorScheme = Theme.of(context).colorScheme;
    final focused = focusNode.hasFocus;
    final activationGuard = useMemoized(TvActivationGuard.new);

    return AnimatedScale(
      scale: focused ? TvDialogDesign.focusedActionScale : 1,
      duration: const Duration(milliseconds: 120),
      child: FilledButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: () => activationGuard.run(onPressed),
        style: ButtonStyle(
          fixedSize: WidgetStatePropertyAll(size),
          padding: const WidgetStatePropertyAll(EdgeInsets.zero),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap,
          visualDensity: VisualDensity.compact,
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          backgroundColor: WidgetStatePropertyAll(
            focused ? colorScheme.onInverseSurface : colorScheme.outline,
          ),
          foregroundColor: WidgetStatePropertyAll(
            focused
                ? colorScheme.onSurface
                : colorScheme.surfaceContainerHighest,
          ),
          textStyle: WidgetStatePropertyAll(
            Theme.of(context).textTheme.titleSmall,
          ),
          shape: WidgetStatePropertyAll(
            RoundedRectangleBorder(borderRadius: TvDialogDesign.actionRadius),
          ),
          elevation: WidgetStatePropertyAll(
            focused ? TvDialogDesign.standardElevation : 0,
          ),
          shadowColor: const WidgetStatePropertyAll(Colors.black),
          surfaceTintColor: const WidgetStatePropertyAll(Colors.transparent),
        ),
        child: Text(
          label,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ),
    );
  }
}
