import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../ui/ui.dart';
import 'tv_keyboard_cubit.dart';
import 'tv_keyboard_design.dart';
import 'tv_keyboard_key.dart';
import 'tv_keyboard_layout.dart';
import 'tv_keyboard_state.dart';

class TvKeyboard extends StatelessWidget {
  const TvKeyboard({
    super.key,
    required this.cubit,
    this.initialFocusIndex,
  });

  final TvKeyboardCubit cubit;
  final int? initialFocusIndex;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TvKeyboardCubit, TvKeyboardState>(
      bloc: cubit,
      builder: (context, state) {
        final rows = tvKeyboardLayoutFor(state);
        var keyIndex = 0;

        return SizedBox.fromSize(
          size: TvKeyboardDesign.size,
          child: DecoratedBox(
            decoration: TvKeyboardDesign.containerDecoration(
              Theme.of(context).colorScheme,
            ),
            child: Padding(
              padding: TvKeyboardDesign.padding,
              child: Column(
                mainAxisSize: MainAxisSize.min,
                spacing: TvKeyboardDesign.rowGap,
                children: [
                  for (final row in rows)
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      spacing: TvKeyboardDesign.keyGap,
                      children: [
                        for (final keyboardKey in row)
                          _TvKeyboardKeyButton(
                            keyboardKey: keyboardKey,
                            selected: _isSelected(keyboardKey, state),
                            autofocus: keyIndex++ == initialFocusIndex,
                            onPressed: () => _handleKey(keyboardKey, state),
                          ),
                      ],
                    ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  bool _isSelected(TvKeyboardKey keyboardKey, TvKeyboardState state) {
    return switch (keyboardKey.function) {
      TvKeyboardFunctionKey.shift => state.isShifted,
      TvKeyboardFunctionKey.capsLock => state.isCapsLocked,
      _ => false,
    };
  }

  void _handleKey(TvKeyboardKey keyboardKey, TvKeyboardState state) {
    final value = keyboardKey.value;
    if (value != null) {
      cubit.inputCharacter(value);
      return;
    }

    switch (keyboardKey.function!) {
      case TvKeyboardFunctionKey.backspace:
        cubit.backspace();
      case TvKeyboardFunctionKey.capsLock:
        cubit.toggleCapsLock();
      case TvKeyboardFunctionKey.shift:
        cubit.toggleShift();
      case TvKeyboardFunctionKey.language:
        cubit.setInputMode(
          state.inputMode == TvKeyboardInputMode.korean
              ? TvKeyboardInputMode.english
              : TvKeyboardInputMode.korean,
        );
      case TvKeyboardFunctionKey.space:
        cubit.inputCharacter(' ');
      case TvKeyboardFunctionKey.enter:
        cubit.submit();
    }
  }
}

class _TvKeyboardKeyButton extends StatelessWidget {
  const _TvKeyboardKeyButton({
    required this.keyboardKey,
    required this.selected,
    required this.autofocus,
    required this.onPressed,
  });

  final TvKeyboardKey keyboardKey;
  final bool selected;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final design = TvKeyboardDesign.keyButtonDesign(
      Theme.of(context).colorScheme,
      keyboardKey.type,
    );
    final icon = keyboardKey.icon;

    if (icon != null) {
      return TvButton.icon(
        key: Key('tv-keyboard-key-${keyboardKey.id}'),
        icon: icon,
        onPressed: onPressed,
        design: design,
        autofocus: autofocus,
        selected: selected,
        guardActivations: false,
      );
    }

    return TvButton.label(
      key: Key('tv-keyboard-key-${keyboardKey.id}'),
      text: keyboardKey.value!,
      onPressed: onPressed,
      design: design,
      autofocus: autofocus,
      selected: selected,
      guardActivations: false,
    );
  }
}
