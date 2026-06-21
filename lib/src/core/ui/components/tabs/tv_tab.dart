import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import 'tv_tab_design.dart';
import 'tv_tab_variant.dart';

part 'tv_tab_content.dart';
part 'tv_tab_underline.dart';

class TvTab extends HookWidget {
  const TvTab({
    super.key,
    required this.onPressed,
    this.label,
    this.icon,
    this.variant = TvTabVariant.primary,
    this.showLabel = true,
    this.showIcon = false,
    this.design,
    this.autofocus = false,
    this.selected = false,
    this.enabled = true,
  }) : assert(showLabel || showIcon),
       assert(!showLabel || label != null),
       assert(!showIcon || icon != null);

  final VoidCallback onPressed;
  final String? label;
  final IconData? icon;
  final TvTabVariant variant;
  final bool showLabel;
  final bool showIcon;
  final TvTabDesign? design;
  final bool autofocus;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final design =
        this.design ??
        TvTabDesign.resolve(
          variant: variant,
          showLabel: showLabel,
          showIcon: showIcon,
        );
    final focused = focusNode.hasFocus;
    final onPressed = enabled
        ? () => activationGuard.run(this.onPressed)
        : null;

    return AnimatedScale(
      scale: focused && enabled ? design.focusedScale : 1,
      duration: const Duration(milliseconds: 120),
      child: TextButton(
        autofocus: autofocus,
        focusNode: focusNode,
        onPressed: onPressed,
        style: design.style(
          colorScheme: colorScheme,
          selected: selected,
          defaultTextStyle: textTheme.titleSmall,
        ),
        child: _TvTabContent(
          design: design,
          colorScheme: colorScheme,
          label: label,
          icon: icon,
          showLabel: showLabel,
          showIcon: showIcon,
          focused: focused && enabled,
          selected: selected,
          enabled: enabled,
        ),
      ),
    );
  }
}

class TvTabRow extends StatelessWidget {
  const TvTabRow({
    super.key,
    required this.tabs,
  });

  final List<Widget> tabs;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: 0,
      children: tabs,
    );
  }
}
