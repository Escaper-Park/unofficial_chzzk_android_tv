part of 'tv_modal_panel.dart';

class _TvModalPanelPositioned extends StatelessWidget {
  const _TvModalPanelPositioned({
    required this.type,
    required this.position,
    required this.anchorLink,
    required this.anchorOffset,
    required this.child,
  });

  final TvModalPanelType type;
  final TvModalPanelPosition position;
  final LayerLink? anchorLink;
  final Offset anchorOffset;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final anchorLink = this.anchorLink;
    if (anchorLink != null) {
      return Positioned.fill(
        child: CompositedTransformFollower(
          link: anchorLink,
          offset: anchorOffset,
          showWhenUnlinked: false,
          child: Align(
            alignment: Alignment.topLeft,
            child: child,
          ),
        ),
      );
    }

    final alignment = switch (position) {
      TvModalPanelPosition.left => Alignment.centerLeft,
      TvModalPanelPosition.right => Alignment.centerRight,
      TvModalPanelPosition.above => Alignment.bottomCenter,
    };

    if (type == TvModalPanelType.large) {
      return Align(alignment: alignment, child: child);
    }

    return Padding(
      padding: TvModalPanelDesign.standardOuterSpacing,
      child: Align(alignment: alignment, child: child),
    );
  }
}
