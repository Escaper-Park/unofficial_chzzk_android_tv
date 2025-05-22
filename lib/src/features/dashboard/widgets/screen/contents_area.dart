part of '../../dashboard_screen.dart';

class _ContentsArea extends StatelessWidget {
  /// Content screen located on the right side of the screen.
  ///
  /// It has a width of `(screen size width - collapsed sidebar width)`.
  const _ContentsArea({
    required this.contentsFSN,
    required this.child,
  });

  /// Contents area's [FocusScopeNode].
  final FocusScopeNode contentsFSN;

  final Widget child;

  @override
  Widget build(BuildContext context) {
    // screen width - collapsed sidebar width
    final contentsAreaWidth =
        context.screenWidth - Dimensions.collapsedSidebarWidth;

    return Positioned(
      left: Dimensions.collapsedSidebarWidth,
      width: contentsAreaWidth,
      child: FocusScope(
        node: contentsFSN,
        child: child,
      ),
    );
  }
}
