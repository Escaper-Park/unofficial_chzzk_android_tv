import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/components/controls/controls.dart';
import '../../../../core/ui/components/lists/lists.dart';
import '../../../../core/ui/components/modal_drawers/modal_drawers.dart';
import 'tv_player_overlay_controls_design.dart';

class TvPlayerOverlayStandardMenu extends StatelessWidget {
  const TvPlayerOverlayStandardMenu({
    super.key,
    required this.header,
    required this.anchorLink,
    required this.itemCount,
    required this.child,
    required this.onDismiss,
    this.horizontalOffset,
    this.extraHeight = 0,
  });

  final String header;
  final LayerLink anchorLink;
  final int itemCount;
  final Widget child;
  final VoidCallback onDismiss;
  final double? horizontalOffset;
  final double extraHeight;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: header,
      anchorLink: anchorLink,
      anchorOffset: TvPlayerOverlayControlsDesign.standardMenuAnchorOffset(
        itemCount: itemCount,
        horizontalOffset: horizontalOffset,
        extraHeight: extraHeight,
      ),
      onDismiss: onDismiss,
      child: child,
    );
  }
}

class TvPlayerOverlayOptionList extends StatelessWidget {
  const TvPlayerOverlayOptionList({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: TvPlayerOverlayControlsDesign.modalOptionListMaxHeight,
      ),
      child: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: children,
        ),
      ),
    );
  }
}

class TvPlayerOverlayOptionItem extends HookWidget {
  const TvPlayerOverlayOptionItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
    this.icon,
    this.leading,
    this.autofocus = false,
    this.enabled = true,
    this.showRadio = true,
  }) : assert(leading == null || icon == null);

  final String title;
  final IconData? icon;
  final Widget? leading;
  final bool selected;
  final VoidCallback onPressed;
  final bool autofocus;
  final bool enabled;
  final bool showRadio;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    return TvListItem(
      title: title,
      icon: icon,
      leading: leading,
      trailing: showRadio
          ? TvRadioButton(
              selected: selected,
              focused: focusNode.hasFocus,
            )
          : null,
      selected: selected,
      enabled: enabled,
      autofocus: autofocus,
      focusNode: focusNode,
      design: TvListItemDesign.dense(lineCount: 1),
      onPressed: onPressed,
    );
  }
}

class TvPlayerOverlaySwitchItem extends HookWidget {
  const TvPlayerOverlaySwitchItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
    this.icon,
    this.leading,
    this.autofocus = false,
  }) : assert(leading == null || icon == null);

  final String title;
  final IconData? icon;
  final Widget? leading;
  final bool selected;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final focusNode = useFocusNode();
    useListenable(focusNode);

    return TvListItem(
      title: title,
      icon: icon,
      leading: leading,
      trailing: TvSwitch(
        selected: selected,
        focused: focusNode.hasFocus,
      ),
      selected: selected,
      autofocus: autofocus,
      focusNode: focusNode,
      design: TvListItemDesign.dense(lineCount: 1),
      onPressed: onPressed,
    );
  }
}
