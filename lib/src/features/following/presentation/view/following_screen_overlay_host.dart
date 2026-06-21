part of 'following_screen.dart';

class _FollowingModalOverlayHost extends StatelessWidget {
  const _FollowingModalOverlayHost({
    required this.sortController,
    required this.channelController,
    required this.sortOverlay,
    required this.channelOverlay,
    required this.child,
  });

  final OverlayPortalController sortController;
  final OverlayPortalController channelController;
  final Widget sortOverlay;
  final Widget channelOverlay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: sortController,
      overlayLocation: OverlayChildLocation.rootOverlay,
      overlayChildBuilder: (_) => sortOverlay,
      child: OverlayPortal(
        controller: channelController,
        overlayLocation: OverlayChildLocation.rootOverlay,
        overlayChildBuilder: (_) => channelOverlay,
        child: child,
      ),
    );
  }
}
