part of 'search_results_layout.dart';

class _SearchResultsAutoScrollSection extends StatefulWidget {
  const _SearchResultsAutoScrollSection({
    required this.node,
    required this.alignment,
    required this.child,
  });

  final FocusScopeNode node;
  final double alignment;
  final Widget child;

  @override
  State<_SearchResultsAutoScrollSection> createState() {
    return _SearchResultsAutoScrollSectionState();
  }
}

class _SearchResultsAutoScrollSectionState
    extends State<_SearchResultsAutoScrollSection> {
  @override
  void initState() {
    super.initState();
    widget.node.addListener(_handleFocusChange);
  }

  @override
  void didUpdateWidget(_SearchResultsAutoScrollSection oldWidget) {
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

    unawaited(
      Scrollable.ensureVisible(
        context,
        duration: SearchResultsScreenDesign.verticalScrollDuration,
        curve: Curves.easeOut,
        alignment: widget.alignment,
      ),
    );
  }
}
