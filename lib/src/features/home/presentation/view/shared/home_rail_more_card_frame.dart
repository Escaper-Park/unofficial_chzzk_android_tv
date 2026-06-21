part of 'home_rail_more_card.dart';

class _HomeRailMoreCardFrame extends HookWidget {
  const _HomeRailMoreCardFrame({
    required this.width,
    required this.height,
    required this.autofocus,
    required this.focusedElevation,
    required this.focusedShadowColor,
    required this.onPressed,
  });

  final double width;
  final double height;
  final bool autofocus;
  final TvCardElevation focusedElevation;
  final Color? focusedShadowColor;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);
    final focused = focusNode.hasFocus;
    const radius = HomeRailMoreCardDesign.radius;

    void activate() {
      activationGuard.run(onPressed);
    }

    return Card(
      margin: EdgeInsets.zero,
      color: HomeRailMoreCardDesign.surfaceColor,
      elevation: focused ? focusedElevation.value : 0,
      shadowColor: focused ? focusedShadowColor : null,
      surfaceTintColor: Colors.transparent,
      shape: const RoundedRectangleBorder(borderRadius: radius),
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          InkWell(
            autofocus: autofocus,
            focusNode: focusNode,
            onTap: activate,
            customBorder: const RoundedRectangleBorder(borderRadius: radius),
            overlayColor: const WidgetStatePropertyAll(Colors.transparent),
            splashFactory: NoSplash.splashFactory,
            child: SizedBox(
              width: width,
              height: height,
              child: const Center(child: _MoreLabel()),
            ),
          ),
          if (focused)
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: radius,
                    border: Border.all(
                      color: AppColorTokens.brandColor,
                      width: HomeCategoryCardDesign.focusOutlineWidth,
                    ),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
