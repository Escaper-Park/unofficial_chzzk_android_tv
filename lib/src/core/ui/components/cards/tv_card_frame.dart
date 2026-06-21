part of 'tv_card.dart';

class _TvCardFrame extends StatelessWidget {
  const _TvCardFrame({
    required this.focused,
    required this.design,
    required this.child,
  });

  final bool focused;
  final TvCardDesign design;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final shape = RoundedRectangleBorder(borderRadius: design.radius);

    return Card(
      margin: EdgeInsets.zero,
      color: design.backgroundColor ?? Colors.transparent,
      elevation: focused ? design.focusedElevation : 0,
      shadowColor: focused ? design.focusedShadowColor : null,
      surfaceTintColor: Colors.transparent,
      shape: shape,
      clipBehavior: Clip.antiAlias,
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          child,
          if (focused && design.focusOutlineWidth > 0)
            Positioned.fill(
              child: IgnorePointer(
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    borderRadius: design.radius,
                    border: Border.all(
                      color: design.focusOutlineColor,
                      width: design.focusOutlineWidth,
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
