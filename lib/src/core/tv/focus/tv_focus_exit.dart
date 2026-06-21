part of 'tv_focus_section.dart';

class TvFocusExit extends StatelessWidget {
  const TvFocusExit({
    super.key,
    this.up,
    this.down,
    this.left,
    this.right,
    this.upFocusAlignment,
    this.downFocusAlignment,
    this.leftFocusAlignment,
    this.rightFocusAlignment,
    this.upEnsureVisible = true,
    this.downEnsureVisible = true,
    this.leftEnsureVisible = true,
    this.rightEnsureVisible = true,
    this.upEnsureVisibleScope = false,
    this.downEnsureVisibleScope = false,
    this.leftEnsureVisibleScope = false,
    this.rightEnsureVisibleScope = false,
    required this.child,
  });

  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final FocusScopeNode? left;
  final FocusScopeNode? right;
  final double? upFocusAlignment;
  final double? downFocusAlignment;
  final double? leftFocusAlignment;
  final double? rightFocusAlignment;
  final bool upEnsureVisible;
  final bool downEnsureVisible;
  final bool leftEnsureVisible;
  final bool rightEnsureVisible;
  final bool upEnsureVisibleScope;
  final bool downEnsureVisibleScope;
  final bool leftEnsureVisibleScope;
  final bool rightEnsureVisibleScope;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final targets = _targets;
    if (targets.isEmpty) {
      return child;
    }

    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }

        final target = targets[event.logicalKey];
        if (target == null) {
          return KeyEventResult.ignored;
        }

        final handled = requestTvSectionFocus(
          target.node,
          ensureVisibleAlignment: target.ensureVisibleAlignment,
          ensureVisible: target.ensureVisible,
          ensureVisibleScope: target.ensureVisibleScope,
        );
        return handled ? KeyEventResult.handled : KeyEventResult.ignored;
      },
      child: child,
    );
  }

  Map<LogicalKeyboardKey, _TvFocusTarget> get _targets {
    final targets = <LogicalKeyboardKey, _TvFocusTarget>{};

    _addTarget(
      targets,
      DpadKey.up,
      up,
      upFocusAlignment,
      upEnsureVisible,
      upEnsureVisibleScope,
    );
    _addTarget(
      targets,
      DpadKey.down,
      down,
      downFocusAlignment,
      downEnsureVisible,
      downEnsureVisibleScope,
    );
    _addTarget(
      targets,
      DpadKey.left,
      left,
      leftFocusAlignment,
      leftEnsureVisible,
      leftEnsureVisibleScope,
    );
    _addTarget(
      targets,
      DpadKey.right,
      right,
      rightFocusAlignment,
      rightEnsureVisible,
      rightEnsureVisibleScope,
    );

    return targets;
  }
}

Widget _wrapWithFocusExit({
  FocusScopeNode? up,
  FocusScopeNode? down,
  FocusScopeNode? left,
  FocusScopeNode? right,
  double? upFocusAlignment,
  double? downFocusAlignment,
  double? leftFocusAlignment,
  double? rightFocusAlignment,
  bool upEnsureVisible = true,
  bool downEnsureVisible = true,
  bool leftEnsureVisible = true,
  bool rightEnsureVisible = true,
  bool upEnsureVisibleScope = false,
  bool downEnsureVisibleScope = false,
  bool leftEnsureVisibleScope = false,
  bool rightEnsureVisibleScope = false,
  required Widget child,
}) {
  if (up == null && down == null && left == null && right == null) {
    return child;
  }

  return TvFocusExit(
    up: up,
    down: down,
    left: left,
    right: right,
    upFocusAlignment: upFocusAlignment,
    downFocusAlignment: downFocusAlignment,
    leftFocusAlignment: leftFocusAlignment,
    rightFocusAlignment: rightFocusAlignment,
    upEnsureVisible: upEnsureVisible,
    downEnsureVisible: downEnsureVisible,
    leftEnsureVisible: leftEnsureVisible,
    rightEnsureVisible: rightEnsureVisible,
    upEnsureVisibleScope: upEnsureVisibleScope,
    downEnsureVisibleScope: downEnsureVisibleScope,
    leftEnsureVisibleScope: leftEnsureVisibleScope,
    rightEnsureVisibleScope: rightEnsureVisibleScope,
    child: child,
  );
}

void _addTarget(
  Map<LogicalKeyboardKey, _TvFocusTarget> targets,
  DpadKey key,
  FocusScopeNode? target,
  double? ensureVisibleAlignment,
  bool ensureVisible,
  bool ensureVisibleScope,
) {
  if (target == null) {
    return;
  }

  targets[key.logicalKey] = _TvFocusTarget(
    node: target,
    ensureVisibleAlignment:
        ensureVisibleAlignment ?? _defaultEnsureVisibleAlignment,
    ensureVisible: ensureVisible,
    ensureVisibleScope: ensureVisibleScope,
  );
}

final class _TvFocusTarget {
  const _TvFocusTarget({
    required this.node,
    required this.ensureVisibleAlignment,
    required this.ensureVisible,
    required this.ensureVisibleScope,
  });

  final FocusScopeNode node;
  final double ensureVisibleAlignment;
  final bool ensureVisible;
  final bool ensureVisibleScope;
}
