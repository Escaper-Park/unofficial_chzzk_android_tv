import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import 'tv_list_item_design.dart';

part 'tv_list_item_content.dart';
part 'tv_list_item_focusable.dart';

typedef TvListItemTitleBuilder =
    Widget Function(BuildContext context, TextStyle? style);

class TvListItem extends StatelessWidget {
  const TvListItem({
    super.key,
    required this.title,
    required this.onPressed,
    this.titleBuilder,
    this.subtitle,
    this.overline,
    this.leading,
    this.icon,
    this.action,
    this.trailing,
    this.focusNode,
    this.selected = false,
    this.enabled = true,
    this.autofocus = false,
    this.design,
  }) : assert(leading == null || icon == null);

  final String title;
  final VoidCallback onPressed;
  final TvListItemTitleBuilder? titleBuilder;
  final String? subtitle;
  final String? overline;
  final Widget? leading;
  final IconData? icon;
  final String? action;
  final Widget? trailing;
  final FocusNode? focusNode;
  final bool selected;
  final bool enabled;
  final bool autofocus;
  final TvListItemDesign? design;

  @override
  Widget build(BuildContext context) {
    final design = _resolveDesign(
      context,
      this.design ?? TvListItemDesign.regular(lineCount: _lineCount),
    );

    return _FocusableTvListItem(
      title: title,
      titleBuilder: titleBuilder,
      subtitle: subtitle,
      overline: overline,
      leading: leading,
      icon: icon,
      action: action,
      trailing: trailing,
      focusNode: focusNode,
      selected: selected,
      enabled: enabled,
      autofocus: autofocus,
      design: design,
      onPressed: onPressed,
    );
  }

  int get _lineCount {
    return 1 + (subtitle == null ? 0 : 1) + (overline == null ? 0 : 1);
  }
}

class TvDenseListItem extends StatelessWidget {
  const TvDenseListItem({
    super.key,
    required this.title,
    required this.onPressed,
    this.subtitle,
    this.overline,
    this.icon,
    this.action,
    this.trailingIcon,
    this.focusNode,
    this.selected = false,
    this.enabled = true,
    this.autofocus = false,
    this.design,
  });

  final String title;
  final VoidCallback onPressed;
  final String? subtitle;
  final String? overline;
  final IconData? icon;
  final String? action;
  final IconData? trailingIcon;
  final FocusNode? focusNode;
  final bool selected;
  final bool enabled;
  final bool autofocus;
  final TvListItemDesign? design;

  @override
  Widget build(BuildContext context) {
    final trailingIcon = this.trailingIcon;
    final design = _resolveDesign(
      context,
      this.design ?? TvListItemDesign.dense(lineCount: _lineCount),
    );

    return _FocusableTvListItem(
      title: title,
      titleBuilder: null,
      subtitle: subtitle,
      overline: overline,
      leading: null,
      icon: icon,
      action: action,
      trailing: trailingIcon == null ? null : Icon(trailingIcon),
      focusNode: focusNode,
      selected: selected,
      enabled: enabled,
      autofocus: autofocus,
      design: design,
      onPressed: onPressed,
    );
  }

  int get _lineCount {
    return 1 + (subtitle == null ? 0 : 1) + (overline == null ? 0 : 1);
  }
}

class TvListItemFocusScale extends InheritedWidget {
  const TvListItemFocusScale({
    super.key,
    required this.focusedScale,
    required super.child,
  });

  final double focusedScale;

  static double? maybeOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<TvListItemFocusScale>()
        ?.focusedScale;
  }

  @override
  bool updateShouldNotify(TvListItemFocusScale oldWidget) {
    return focusedScale != oldWidget.focusedScale;
  }
}

TvListItemDesign _resolveDesign(
  BuildContext context,
  TvListItemDesign design,
) {
  final focusedScale = TvListItemFocusScale.maybeOf(context);
  return focusedScale == null
      ? design
      : design.copyWith(focusedScale: focusedScale);
}
