part of 'channel_screen.dart';

class _ChannelModalOverlayHost extends StatelessWidget {
  const _ChannelModalOverlayHost({
    required this.sortController,
    required this.groupController,
    required this.sortOverlay,
    required this.groupOverlay,
    required this.child,
  });

  final OverlayPortalController sortController;
  final OverlayPortalController groupController;
  final Widget sortOverlay;
  final Widget groupOverlay;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return OverlayPortal(
      controller: sortController,
      overlayLocation: OverlayChildLocation.rootOverlay,
      overlayChildBuilder: (_) => sortOverlay,
      child: OverlayPortal(
        controller: groupController,
        overlayLocation: OverlayChildLocation.rootOverlay,
        overlayChildBuilder: (_) => groupOverlay,
        child: child,
      ),
    );
  }
}
