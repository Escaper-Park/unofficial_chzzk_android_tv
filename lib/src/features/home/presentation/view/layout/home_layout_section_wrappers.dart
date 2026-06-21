part of 'home_layout.dart';

class _HomeSectionSpacing extends StatelessWidget {
  const _HomeSectionSpacing({
    required this.addTopGap,
    required this.child,
  });

  final bool addTopGap;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (!addTopGap) {
      return child;
    }

    return Padding(
      padding: const EdgeInsets.only(top: HomeScreenDesign.sectionGap),
      child: child,
    );
  }
}

class _HomeAutoScrollSection extends StatefulWidget {
  const _HomeAutoScrollSection({
    required this.node,
    required this.child,
  });

  final FocusScopeNode node;
  final Widget child;

  @override
  State<_HomeAutoScrollSection> createState() => _HomeAutoScrollSectionState();
}

class _HomeAutoScrollSectionState extends State<_HomeAutoScrollSection> {
  static const _visibleTolerance = 0.5;

  @override
  void initState() {
    super.initState();
    widget.node.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(_HomeAutoScrollSection oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.node == widget.node) {
      return;
    }

    oldWidget.node.removeListener(_handleFocusChange);
    widget.node.addListener(_handleFocusChange);
  }

  @override
  void dispose() {
    widget.node.removeListener(_handleFocusChange);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }

  void _handleFocusChange() {
    if (!widget.node.hasFocus) {
      return;
    }

    if (_isSectionFullyVisible()) {
      return;
    }

    unawaited(
      Scrollable.ensureVisible(
        context,
        duration: HomeScreenDesign.verticalScrollDuration,
        curve: Curves.easeOut,
        alignment: HomeScreenDesign.verticalScrollAlignment,
      ),
    );
  }

  bool _isSectionFullyVisible() {
    final scrollable = Scrollable.maybeOf(context);
    if (scrollable == null) {
      return false;
    }

    final sectionObject = context.findRenderObject();
    final viewportObject = scrollable.context.findRenderObject();
    if (sectionObject is! RenderBox || viewportObject is! RenderBox) {
      return false;
    }

    if (!sectionObject.attached ||
        !viewportObject.attached ||
        !sectionObject.hasSize ||
        !viewportObject.hasSize) {
      return false;
    }

    final sectionTopLeft = sectionObject.localToGlobal(
      Offset.zero,
      ancestor: viewportObject,
    );
    final sectionBottomRight = sectionObject.localToGlobal(
      Offset(sectionObject.size.width, sectionObject.size.height),
      ancestor: viewportObject,
    );

    return sectionTopLeft.dy >= -_visibleTolerance &&
        sectionBottomRight.dy <= viewportObject.size.height + _visibleTolerance;
  }
}
