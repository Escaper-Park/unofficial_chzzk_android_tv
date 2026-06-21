import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/tv/focus/focus.dart';

class PlayerContentLayout extends StatelessWidget {
  const PlayerContentLayout({
    super.key,
    required this.player,
    required this.controllerNode,
    this.controllerFocusNode,
    this.controllerAutofocus = true,
    this.onSelect,
    this.onUp,
    this.onDown,
    this.onLeft,
    this.onRight,
    this.controlsOverlay,
    this.foreground,
  });

  final Widget player;
  final FocusScopeNode controllerNode;
  final FocusNode? controllerFocusNode;
  final bool controllerAutofocus;
  final VoidCallback? onSelect;
  final VoidCallback? onUp;
  final VoidCallback? onDown;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;
  final Widget? controlsOverlay;
  final Widget? foreground;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        ExcludeFocus(child: player),
        TvFocusSection(
          node: controllerNode,
          child: PlayerInputController(
            focusNode: controllerFocusNode,
            autofocus: controllerAutofocus,
            onSelect: onSelect,
            onUp: onUp,
            onDown: onDown,
            onLeft: onLeft,
            onRight: onRight,
          ),
        ),
        ?controlsOverlay,
        ?foreground,
      ],
    );
  }
}

class PlayerInputController extends StatelessWidget {
  const PlayerInputController({
    super.key,
    this.focusNode,
    this.autofocus = false,
    this.enabled = true,
    this.onSelect,
    this.onUp,
    this.onDown,
    this.onLeft,
    this.onRight,
  });

  final FocusNode? focusNode;
  final bool autofocus;
  final bool enabled;
  final VoidCallback? onSelect;
  final VoidCallback? onUp;
  final VoidCallback? onDown;
  final VoidCallback? onLeft;
  final VoidCallback? onRight;

  @override
  Widget build(BuildContext context) {
    return Focus(
      focusNode: focusNode,
      autofocus: autofocus,
      canRequestFocus: enabled,
      onKeyEvent: _onKeyEvent,
      child: const SizedBox.expand(),
    );
  }

  KeyEventResult _onKeyEvent(FocusNode node, KeyEvent event) {
    if (!enabled || event is! KeyDownEvent && event is! KeyRepeatEvent) {
      return KeyEventResult.ignored;
    }

    final callback = _callbackFor(event.logicalKey);
    if (callback == null) {
      return KeyEventResult.ignored;
    }

    if (event is KeyDownEvent || !_isSelectKey(event.logicalKey)) {
      callback();
    }
    return KeyEventResult.handled;
  }

  VoidCallback? _callbackFor(LogicalKeyboardKey key) {
    if (_isSelectKey(key)) {
      return onSelect;
    }

    return switch (key) {
      LogicalKeyboardKey.arrowUp => onUp,
      LogicalKeyboardKey.arrowDown => onDown,
      LogicalKeyboardKey.arrowLeft => onLeft,
      LogicalKeyboardKey.arrowRight => onRight,
      _ => null,
    };
  }
}

bool _isSelectKey(LogicalKeyboardKey key) {
  return key == LogicalKeyboardKey.select ||
      key == LogicalKeyboardKey.enter ||
      key == LogicalKeyboardKey.numpadEnter;
}
