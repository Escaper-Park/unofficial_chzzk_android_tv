import 'package:flutter/material.dart';

import '../../../tv/back/back.dart';
import '../lists/lists.dart';
import '../primitives/primitives.dart';
import 'tv_modal_panel_design.dart';

part 'tv_modal_panel_positioned.dart';
part 'tv_modal_panel_surface.dart';

class TvModalPanel extends StatelessWidget {
  const TvModalPanel({
    super.key,
    required this.type,
    required this.header,
    required this.child,
    this.headerContent,
    this.position = TvModalPanelPosition.right,
    this.showScrim = false,
    this.anchorLink,
    this.anchorOffset = Offset.zero,
    this.focusNode,
    this.openerFocusNode,
    this.onDismiss,
  });

  final TvModalPanelType type;
  final String header;
  final Widget child;
  final Widget? headerContent;
  final TvModalPanelPosition position;
  final bool showScrim;
  final LayerLink? anchorLink;
  final Offset anchorOffset;
  final FocusScopeNode? focusNode;
  final FocusNode? openerFocusNode;
  final VoidCallback? onDismiss;

  @override
  Widget build(BuildContext context) {
    final panel = FocusTraversalGroup(
      child: FocusScope(
        node: focusNode,
        child: TvListItemFocusScale(
          focusedScale: TvModalPanelDesign.itemFocusedScale,
          child: _TvModalPanelSurface(
            type: type,
            header: header,
            headerContent: headerContent,
            child: child,
          ),
        ),
      ),
    );
    final backWrapped = onDismiss == null
        ? panel
        : TvBackScope(
            controller: TvBackController.pop(onPop: _dismiss),
            child: panel,
          );
    final positioned = _TvModalPanelPositioned(
      type: type,
      position: position,
      anchorLink: anchorLink,
      anchorOffset: anchorOffset,
      child: backWrapped,
    );

    if (!showScrim) {
      return positioned;
    }

    return Stack(
      children: [
        const Positioned.fill(child: TvScrim(type: TvScrimType.modal)),
        positioned,
      ],
    );
  }

  void _dismiss() {
    onDismiss?.call();
    final openerFocusNode = this.openerFocusNode;
    if (openerFocusNode != null &&
        openerFocusNode.canRequestFocus &&
        openerFocusNode.context != null) {
      openerFocusNode.requestFocus();
    }
  }
}
