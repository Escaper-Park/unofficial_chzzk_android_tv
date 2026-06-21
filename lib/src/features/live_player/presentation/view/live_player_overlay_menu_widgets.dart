import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/overlay_controls/overlay_controls.dart';
import 'live_player_controls_overlay_design.dart';

class LiveOverlayStandardMenu extends StatelessWidget {
  const LiveOverlayStandardMenu({
    super.key,
    required this.header,
    required this.anchorLink,
    required this.itemCount,
    required this.child,
    required this.onDismiss,
    this.horizontalOffset,
  });

  final String header;
  final LayerLink anchorLink;
  final int itemCount;
  final Widget child;
  final VoidCallback onDismiss;
  final double? horizontalOffset;

  @override
  Widget build(BuildContext context) {
    return TvModalPanel(
      type: TvModalPanelType.standard,
      header: header,
      anchorLink: anchorLink,
      anchorOffset: TvPlayerOverlayControlsDesign.standardMenuAnchorOffset(
        itemCount: itemCount,
        horizontalOffset: horizontalOffset,
      ),
      onDismiss: onDismiss,
      child: child,
    );
  }
}

class LiveOverlayOptionList extends StatelessWidget {
  const LiveOverlayOptionList({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: const BoxConstraints(
        maxHeight: LivePlayerControlsOverlayDesign.modalOptionListMaxHeight,
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

class LiveOverlayOptionItem extends HookWidget {
  const LiveOverlayOptionItem({
    super.key,
    required this.title,
    required this.selected,
    required this.onPressed,
    this.icon,
    this.autofocus = false,
    this.enabled = true,
    this.showRadio = true,
  });

  final String title;
  final IconData? icon;
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

class LiveOverlaySwitchItem extends HookWidget {
  const LiveOverlaySwitchItem({
    super.key,
    required this.title,
    required this.icon,
    required this.selected,
    required this.onPressed,
    this.autofocus = false,
  });

  final String title;
  final IconData icon;
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
