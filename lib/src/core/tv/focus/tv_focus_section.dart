import 'dart:async';

import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

import '../input/input.dart';

part 'tv_focus_exit.dart';
part 'tv_focus_request.dart';
part 'tv_grid_focus_controller.dart';

typedef TvGridFocusSectionBuilder =
    Widget Function(BuildContext context, TvGridFocusController focus);

class TvFocusSection extends StatelessWidget {
  const TvFocusSection({
    super.key,
    required this.node,
    required this.child,
  });

  TvFocusSection.list({
    super.key,
    required this.node,
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
  }) : child = _wrapWithFocusExit(
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

  TvFocusSection.grid({
    super.key,
    required this.node,
    required int itemCount,
    required int crossAxisCount,
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
    required TvGridFocusSectionBuilder builder,
  }) : assert(itemCount >= 0),
       assert(crossAxisCount > 0),
       child = _TvGridFocusSection(
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
         builder: builder,
       );

  final FocusScopeNode node;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FocusScope(
      node: node,
      child: child,
    );
  }
}
