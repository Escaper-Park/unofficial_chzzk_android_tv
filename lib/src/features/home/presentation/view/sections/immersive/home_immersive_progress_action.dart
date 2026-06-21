part of 'home_immersive_list.dart';

class _HomeImmersiveProgressAction extends StatefulWidget {
  const _HomeImmersiveProgressAction({
    required this.text,
    required this.progress,
    required this.onPressed,
    this.focusNode,
    this.autofocus = false,
  });

  final String text;
  final double progress;
  final VoidCallback onPressed;
  final FocusNode? focusNode;
  final bool autofocus;

  @override
  State<_HomeImmersiveProgressAction> createState() =>
      _HomeImmersiveProgressActionState();
}

class _HomeImmersiveProgressActionState
    extends State<_HomeImmersiveProgressAction> {
  late final FocusNode _ownedFocusNode;
  late final TvActivationGuard _activationGuard;

  FocusNode get _focusNode => widget.focusNode ?? _ownedFocusNode;

  @override
  void initState() {
    super.initState();
    _ownedFocusNode = FocusNode();
    _activationGuard = TvActivationGuard();
    _focusNode.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(_HomeImmersiveProgressAction oldWidget) {
    super.didUpdateWidget(oldWidget);
    final oldFocusNode = oldWidget.focusNode ?? _ownedFocusNode;
    final newFocusNode = _focusNode;
    if (oldFocusNode == newFocusNode) {
      return;
    }

    oldFocusNode.removeListener(_handleFocusChange);
    newFocusNode.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    _focusNode.removeListener(_handleFocusChange);
    _ownedFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final design = TvButtonDesign.resolve(
      type: TvButtonType.filled,
      iconButtonSize: null,
    );
    final colorScheme = Theme.of(context).colorScheme;
    final focused = _focusNode.hasFocus;
    final progress = widget.progress.clamp(0, 1).toDouble();

    return AnimatedScale(
      scale: focused ? design.focusedScale : 1,
      duration: TvButtonDesign.focusScaleDuration,
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          autofocus: widget.autofocus,
          focusNode: _focusNode,
          onTap: () => _activationGuard.run(widget.onPressed),
          customBorder: RoundedRectangleBorder(borderRadius: design.radius),
          overlayColor: const WidgetStatePropertyAll(Colors.transparent),
          splashFactory: NoSplash.splashFactory,
          child: ClipRRect(
            borderRadius: design.radius,
            child: Stack(
              children: [
                Positioned.fill(
                  child: ColoredBox(
                    color: focused
                        ? colorScheme.inverseSurface
                        : colorScheme.surfaceContainerHighest,
                  ),
                ),
                Positioned.fill(
                  child: FractionallySizedBox(
                    alignment: Alignment.centerLeft,
                    widthFactor: progress,
                    child: const ColoredBox(color: AppColorTokens.brandColor),
                  ),
                ),
                ConstrainedBox(
                  constraints: BoxConstraints(minHeight: design.height),
                  child: Padding(
                    padding: design.padding,
                    child: Text(
                      widget.text,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: Theme.of(context).textTheme.labelLarge?.copyWith(
                        color: colorScheme.onInverseSurface,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _handleFocusChange() {
    if (mounted) {
      setState(() {});
    }
  }
}
