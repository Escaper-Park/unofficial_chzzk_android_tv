part of 'tv_player_browse_overlay.dart';

class _TvPlayerBrowsePlaceholder extends StatelessWidget {
  const _TvPlayerBrowsePlaceholder({
    required this.node,
    required this.child,
    this.up,
    this.down,
    this.focusNode,
  });

  final FocusScopeNode node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final FocusNode? focusNode;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      child: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: TvPlayerBrowseOverlayDesign.headerHorizontalInset,
        ),
        child: focusNode == null
            ? child
            : Focus(
                focusNode: focusNode,
                autofocus: true,
                child: child,
              ),
      ),
    );
  }
}
