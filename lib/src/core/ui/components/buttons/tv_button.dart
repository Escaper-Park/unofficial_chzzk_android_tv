import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import 'tv_button_design.dart';

enum TvButtonType {
  filled,
  outline,
}

enum TvIconButtonSize {
  small,
  medium,
  large,
}

class TvButton extends HookWidget {
  const TvButton.label({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = TvButtonType.filled,
    this.design,
    this.focusNode,
    this.autofocus = false,
    this.selected = false,
    this.enabled = true,
    this.guardActivations = true,
  }) : iconButtonSize = null;

  const TvButton.icon({
    super.key,
    required this.icon,
    required this.onPressed,
    this.type = TvButtonType.filled,
    this.iconButtonSize = TvIconButtonSize.medium,
    this.design,
    this.focusNode,
    this.autofocus = false,
    this.selected = false,
    this.enabled = true,
    this.guardActivations = true,
  }) : text = null;

  final String? text;
  final IconData? icon;
  final VoidCallback onPressed;
  final TvButtonType type;
  final TvIconButtonSize? iconButtonSize;
  final TvButtonDesign? design;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool selected;
  final bool enabled;
  final bool guardActivations;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final design =
        this.design ??
        TvButtonDesign.resolve(
          type: type,
          iconButtonSize: iconButtonSize,
        );
    final onPressed = enabled
        ? guardActivations
              ? () => activationGuard.run(this.onPressed)
              : this.onPressed
        : null;
    final focused = focusNode.hasFocus;
    final style = design.style(
      colorScheme: Theme.of(context).colorScheme,
      selected: selected,
      focused: focused,
    );

    return AnimatedScale(
      scale: focused && enabled ? design.focusedScale : 1,
      duration: TvButtonDesign.focusScaleDuration,
      child: text == null
          ? _buildIconButton(
              focusNode: focusNode,
              design: design,
              style: style,
              onPressed: onPressed,
            )
          : _buildLabelButton(
              focusNode: focusNode,
              design: design,
              style: style,
              onPressed: onPressed,
            ),
    );
  }

  Widget _buildLabelButton({
    required FocusNode focusNode,
    required TvButtonDesign design,
    required ButtonStyle style,
    required VoidCallback? onPressed,
  }) {
    final icon = this.icon == null ? null : Icon(this.icon);
    final label = Text(
      text!,
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
    );

    return switch (type) {
      TvButtonType.filled when icon == null => FilledButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        child: label,
      ),
      TvButtonType.filled => FilledButton.icon(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        icon: icon,
        label: label,
      ),
      TvButtonType.outline when icon == null => OutlinedButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        child: label,
      ),
      TvButtonType.outline => OutlinedButton.icon(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        icon: icon,
        label: label,
      ),
    };
  }

  Widget _buildIconButton({
    required FocusNode focusNode,
    required TvButtonDesign design,
    required ButtonStyle style,
    required VoidCallback? onPressed,
  }) {
    final icon = Icon(this.icon, size: design.iconSize);

    return switch (type) {
      TvButtonType.filled => IconButton.filled(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        icon: icon,
      ),
      TvButtonType.outline => IconButton.outlined(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: style,
        icon: icon,
      ),
    };
  }
}
