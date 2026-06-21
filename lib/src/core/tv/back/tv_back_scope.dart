import 'dart:async';

import 'package:flutter/widgets.dart';

class TvBackScope extends StatefulWidget {
  const TvBackScope({
    super.key,
    required this.controller,
    this.enabled = true,
    required this.child,
  });

  final TvBackController controller;
  final bool enabled;
  final Widget child;

  @override
  State<TvBackScope> createState() => _TvBackScopeState();
}

class _TvBackScopeState extends State<TvBackScope> {
  final Object _token = Object();

  @override
  Widget build(BuildContext context) {
    final parentScope = _TvBackScopeMarker.maybeOf(context);

    return _TvBackScopeMarker(
      token: _token,
      enabled: widget.enabled,
      parent: parentScope,
      child: PopScope<void>(
        canPop: !widget.enabled,
        onPopInvokedWithResult: (didPop, result) {
          if (widget.enabled && !didPop && _ownsFocusedBackScope()) {
            widget.controller.handleBack();
          }
        },
        child: widget.child,
      ),
    );
  }

  bool _ownsFocusedBackScope() {
    final primaryContext = FocusManager.instance.primaryFocus?.context;
    if (primaryContext == null) {
      return true;
    }

    final focusedScope = _TvBackScopeMarker.maybeOf(primaryContext);
    final focusedEnabledScope = focusedScope?._nearestEnabled;
    if (focusedEnabledScope == null) {
      return true;
    }

    return identical(focusedEnabledScope.token, _token);
  }
}

class _TvBackScopeMarker extends InheritedWidget {
  const _TvBackScopeMarker({
    required this.token,
    required this.enabled,
    required this.parent,
    required super.child,
  });

  final Object token;
  final bool enabled;
  final _TvBackScopeMarker? parent;

  _TvBackScopeMarker? get _nearestEnabled {
    if (enabled) {
      return this;
    }

    return parent?._nearestEnabled;
  }

  static _TvBackScopeMarker? maybeOf(BuildContext context) {
    return context
            .getElementForInheritedWidgetOfExactType<_TvBackScopeMarker>()
            ?.widget
        as _TvBackScopeMarker?;
  }

  @override
  bool updateShouldNotify(_TvBackScopeMarker oldWidget) {
    return token != oldWidget.token ||
        enabled != oldWidget.enabled ||
        parent != oldWidget.parent;
  }
}

final class TvBackController {
  const TvBackController({
    required this.onBack,
    this.onDispose,
  });

  const TvBackController.ignore() : onBack = _ignoreBack, onDispose = null;

  const TvBackController.pop({
    required VoidCallback onPop,
  }) : onBack = onPop,
       onDispose = null;

  const TvBackController.navigate({
    required VoidCallback onNavigate,
  }) : onBack = onNavigate,
       onDispose = null;

  factory TvBackController.focusOrPop({
    required FocusScopeNode focusNode,
    required VoidCallback onPop,
  }) {
    return TvBackController(
      onBack: () {
        if (focusNode.hasFocus) {
          onPop();
          return;
        }

        focusNode.requestFocus();
      },
      onDispose: null,
    );
  }

  factory TvBackController.doubleBackExit({
    required Duration window,
    required VoidCallback onFirstBack,
    required VoidCallback onExit,
  }) {
    assert(window > Duration.zero);

    Timer? timer;
    var armed = false;

    void reset() {
      timer?.cancel();
      timer = null;
      armed = false;
    }

    return TvBackController(
      onBack: () {
        if (armed) {
          reset();
          onExit();
          return;
        }

        armed = true;
        timer = Timer(window, reset);
        onFirstBack();
      },
      onDispose: reset,
    );
  }

  final VoidCallback onBack;
  final VoidCallback? onDispose;

  void handleBack() {
    onBack();
  }

  void dispose() {
    onDispose?.call();
  }
}

void _ignoreBack() {}
