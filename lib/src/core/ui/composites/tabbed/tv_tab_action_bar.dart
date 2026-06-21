import 'package:flutter/material.dart';

import '../../components/buttons/buttons.dart';
import '../../components/tabs/tabs.dart';
import 'tv_tabbed_layout_design.dart';

class TvTabItem<T> {
  const TvTabItem({
    required this.value,
    required this.label,
    this.icon,
    this.showIcon = false,
    this.enabled = true,
  }) : assert(!showIcon || icon != null);

  final T value;
  final String label;
  final IconData? icon;
  final bool showIcon;
  final bool enabled;
}

class TvTabActionBar<T> extends StatelessWidget {
  const TvTabActionBar({
    super.key,
    required this.tabs,
    required this.selectedValue,
    required this.onTabSelected,
    this.actions = const [],
    this.tabVariant = TvTabVariant.secondary,
    this.height = TvTabbedLayoutDesign.tabHeight,
  });

  final List<TvTabItem<T>> tabs;
  final T selectedValue;
  final ValueChanged<T> onTabSelected;
  final List<Widget> actions;
  final TvTabVariant tabVariant;
  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TvTabRow(
            tabs: [
              for (final tab in tabs)
                TvTab(
                  label: tab.label,
                  icon: tab.icon,
                  variant: tabVariant,
                  showIcon: tab.showIcon,
                  selected: selectedValue == tab.value,
                  enabled: tab.enabled,
                  onPressed: () => onTabSelected(tab.value),
                ),
            ],
          ),
          const Spacer(),
          for (final (index, action) in actions.indexed) ...[
            if (index > 0)
              const SizedBox(width: TvTabbedLayoutDesign.actionGap),
            action,
          ],
        ],
      ),
    );
  }
}

class TvTabActionButton extends StatelessWidget {
  const TvTabActionButton({
    super.key,
    required this.text,
    required this.onPressed,
    this.icon,
    this.type = TvButtonType.outline,
    this.design,
    this.autofocus = false,
    this.selected = false,
    this.enabled = true,
  });

  final String text;
  final VoidCallback onPressed;
  final IconData? icon;
  final TvButtonType type;
  final TvButtonDesign? design;
  final bool autofocus;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TvButton.label(
      text: text,
      icon: icon,
      type: type,
      design: design ?? TvTabbedLayoutDesign.actionButtonDesign(),
      autofocus: autofocus,
      selected: selected,
      enabled: enabled,
      onPressed: onPressed,
    );
  }
}
