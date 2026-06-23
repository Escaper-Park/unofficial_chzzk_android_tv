import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/components/buttons/buttons.dart';
import 'tv_player_overlay_controls_design.dart';

class TvPlayerOverlayAction extends HookWidget {
  const TvPlayerOverlayAction({
    super.key,
    required this.label,
    required this.icon,
    required this.onPressed,
    this.anchorLink,
    this.iconButtonSize = TvIconButtonSize.medium,
    this.width = TvPlayerOverlayControlsDesign.actionItemWidth,
    this.height = TvPlayerOverlayControlsDesign.topRowHeight,
    this.focusNode,
    this.autofocus = false,
    this.selected = false,
    this.enabled = true,
  });

  final String label;
  final IconData icon;
  final VoidCallback onPressed;
  final LayerLink? anchorLink;
  final TvIconButtonSize iconButtonSize;
  final double width;
  final double height;
  final FocusNode? focusNode;
  final bool autofocus;
  final bool selected;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    useListenable(focusNode);

    final labelSlot = SizedBox(
      width: width,
      height: TvPlayerOverlayControlsDesign.actionLabelHeight,
      child: Center(
        child: Opacity(
          opacity: focusNode.hasFocus ? 1 : 0,
          child: OverflowBox(
            minWidth: 0,
            maxWidth: double.infinity,
            child: Text(
              label,
              softWrap: false,
              overflow: TextOverflow.visible,
              style: TvPlayerOverlayControlsDesign.actionLabelTextStyle(
                context,
              ),
            ),
          ),
        ),
      ),
    );
    final anchoredLabel = anchorLink == null
        ? labelSlot
        : CompositedTransformTarget(
            link: anchorLink!,
            child: labelSlot,
          );

    return SizedBox(
      width: width,
      height: height,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          anchoredLabel,
          const SizedBox(
            height: TvPlayerOverlayControlsDesign.actionLabelGap,
          ),
          TvButton.icon(
            icon: icon,
            iconButtonSize: iconButtonSize,
            focusNode: focusNode,
            autofocus: autofocus,
            selected: selected,
            enabled: enabled,
            animateFocus: false,
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }
}
