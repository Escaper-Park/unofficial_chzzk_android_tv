part of 'app_shell.dart';

class _AppShellNavigationBackdrop extends StatelessWidget {
  const _AppShellNavigationBackdrop({
    required this.translucent,
  });

  final bool translucent;

  @override
  Widget build(BuildContext context) {
    if (!translucent) {
      return ColoredBox(
        color: AppShellDesign.opaqueNavigationBackdropColor(
          Theme.of(context),
        ),
      );
    }

    return const DecoratedBox(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppShellDesign.immersiveNavigationBackdropStartColor,
            AppShellDesign.immersiveNavigationBackdropEndColor,
          ],
        ),
      ),
    );
  }
}

class _AppShellContentSlot extends StatelessWidget {
  const _AppShellContentSlot({
    required this.node,
    required this.extendsBehindNavigation,
    required this.child,
  });

  final FocusScopeNode node;
  final bool extendsBehindNavigation;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (extendsBehindNavigation) {
      return Positioned.fill(
        child: TvFocusSection(
          node: node,
          child: child,
        ),
      );
    }

    return Positioned.fill(
      child: Column(
        children: [
          const SizedBox(height: AppShellDesign.height),
          Expanded(
            child: TvFocusSection(
              node: node,
              child: child,
            ),
          ),
        ],
      ),
    );
  }
}
