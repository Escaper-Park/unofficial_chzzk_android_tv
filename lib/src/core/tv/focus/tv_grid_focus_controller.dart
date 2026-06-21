part of 'tv_focus_section.dart';

class TvGridFocusController {
  const TvGridFocusController._({
    required this.itemCount,
    required this.crossAxisCount,
    required this._up,
    required this._down,
    required this._left,
    required this._right,
    required this._upFocusAlignment,
    required this._downFocusAlignment,
    required this._leftFocusAlignment,
    required this._rightFocusAlignment,
    required this._upEnsureVisible,
    required this._downEnsureVisible,
    required this._leftEnsureVisible,
    required this._rightEnsureVisible,
    required this._upEnsureVisibleScope,
    required this._downEnsureVisibleScope,
    required this._leftEnsureVisibleScope,
    required this._rightEnsureVisibleScope,
  });

  final int itemCount;
  final int crossAxisCount;
  final FocusScopeNode? _up;
  final FocusScopeNode? _down;
  final FocusScopeNode? _left;
  final FocusScopeNode? _right;
  final double? _upFocusAlignment;
  final double? _downFocusAlignment;
  final double? _leftFocusAlignment;
  final double? _rightFocusAlignment;
  final bool _upEnsureVisible;
  final bool _downEnsureVisible;
  final bool _leftEnsureVisible;
  final bool _rightEnsureVisible;
  final bool _upEnsureVisibleScope;
  final bool _downEnsureVisibleScope;
  final bool _leftEnsureVisibleScope;
  final bool _rightEnsureVisibleScope;

  Widget wrapItem({
    required int index,
    required Widget child,
  }) {
    assert(index >= 0);
    assert(index < itemCount);

    return _wrapWithFocusExit(
      up: _targetFor(_up, _isTopEdge(index)),
      down: _targetFor(_down, _isBottomEdge(index)),
      left: _targetFor(_left, _isLeftEdge(index)),
      right: _targetFor(_right, _isRightEdge(index)),
      upFocusAlignment: _targetAlignmentFor(
        _upFocusAlignment,
        _isTopEdge(index),
      ),
      downFocusAlignment: _targetAlignmentFor(
        _downFocusAlignment,
        _isBottomEdge(index),
      ),
      leftFocusAlignment: _targetAlignmentFor(
        _leftFocusAlignment,
        _isLeftEdge(index),
      ),
      rightFocusAlignment: _targetAlignmentFor(
        _rightFocusAlignment,
        _isRightEdge(index),
      ),
      upEnsureVisible: _targetScopeFor(
        _upEnsureVisible,
        _isTopEdge(index),
      ),
      downEnsureVisible: _targetScopeFor(
        _downEnsureVisible,
        _isBottomEdge(index),
      ),
      leftEnsureVisible: _targetScopeFor(
        _leftEnsureVisible,
        _isLeftEdge(index),
      ),
      rightEnsureVisible: _targetScopeFor(
        _rightEnsureVisible,
        _isRightEdge(index),
      ),
      upEnsureVisibleScope: _targetScopeFor(
        _upEnsureVisibleScope,
        _isTopEdge(index),
      ),
      downEnsureVisibleScope: _targetScopeFor(
        _downEnsureVisibleScope,
        _isBottomEdge(index),
      ),
      leftEnsureVisibleScope: _targetScopeFor(
        _leftEnsureVisibleScope,
        _isLeftEdge(index),
      ),
      rightEnsureVisibleScope: _targetScopeFor(
        _rightEnsureVisibleScope,
        _isRightEdge(index),
      ),
      child: child,
    );
  }

  FocusScopeNode? _targetFor(FocusScopeNode? target, bool canExit) {
    return canExit ? target : null;
  }

  double? _targetAlignmentFor(double? alignment, bool canExit) {
    return canExit ? alignment : null;
  }

  bool _targetScopeFor(bool ensureVisibleScope, bool canExit) {
    return canExit && ensureVisibleScope;
  }

  bool _isTopEdge(int index) {
    return index < crossAxisCount;
  }

  bool _isBottomEdge(int index) {
    final lastRowStart = ((itemCount - 1) ~/ crossAxisCount) * crossAxisCount;
    return index >= lastRowStart;
  }

  bool _isLeftEdge(int index) {
    return index % crossAxisCount == 0;
  }

  bool _isRightEdge(int index) {
    return index % crossAxisCount == crossAxisCount - 1 ||
        index == itemCount - 1;
  }
}

class _TvGridFocusSection extends StatelessWidget {
  const _TvGridFocusSection({
    required this.itemCount,
    required this.crossAxisCount,
    required this.up,
    required this.down,
    required this.left,
    required this.right,
    required this.upFocusAlignment,
    required this.downFocusAlignment,
    required this.leftFocusAlignment,
    required this.rightFocusAlignment,
    required this.upEnsureVisible,
    required this.downEnsureVisible,
    required this.leftEnsureVisible,
    required this.rightEnsureVisible,
    required this.upEnsureVisibleScope,
    required this.downEnsureVisibleScope,
    required this.leftEnsureVisibleScope,
    required this.rightEnsureVisibleScope,
    required this.builder,
  });

  final int itemCount;
  final int crossAxisCount;
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
  final TvGridFocusSectionBuilder builder;

  @override
  Widget build(BuildContext context) {
    final focus = TvGridFocusController._(
      itemCount: itemCount,
      crossAxisCount: crossAxisCount,
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
    );

    return builder(context, focus);
  }
}
