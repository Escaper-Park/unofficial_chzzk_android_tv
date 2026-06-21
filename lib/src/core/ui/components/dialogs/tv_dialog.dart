import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../tv/input/input.dart';
import '../buttons/buttons.dart';
import '../primitives/primitives.dart';
import 'tv_dialog_design.dart';

part 'tv_dialog_action.dart';
part 'tv_dialog_background.dart';
part 'tv_dialog_full_screen_layout.dart';
part 'tv_dialog_route_back_dismiss.dart';
part 'tv_dialog_standard_layout.dart';

enum TvDialogResult {
  primary,
  secondary,
}

Future<TvDialogResult?> showTvDialog({
  required BuildContext context,
  required TvDialogType type,
  required String title,
  required String content,
  required String primaryLabel,
  String? secondaryLabel,
  TvDialogBackgroundType backgroundType = TvDialogBackgroundType.standard,
  IconData? icon,
}) {
  return showDialog<TvDialogResult>(
    context: context,
    useRootNavigator: true,
    barrierDismissible: false,
    barrierColor: Colors.transparent,
    useSafeArea: false,
    traversalEdgeBehavior: TraversalEdgeBehavior.closedLoop,
    builder: (dialogContext) {
      return _TvDialogRouteBackDismiss(
        dialogContext: dialogContext,
        child: TvDialog(
          type: type,
          title: title,
          content: content,
          primaryLabel: primaryLabel,
          onPrimaryPressed: () {
            Navigator.of(
              dialogContext,
              rootNavigator: true,
            ).pop(TvDialogResult.primary);
          },
          secondaryLabel: secondaryLabel,
          onSecondaryPressed: type == TvDialogType.alert
              ? () {
                  Navigator.of(
                    dialogContext,
                    rootNavigator: true,
                  ).pop(TvDialogResult.secondary);
                }
              : null,
          backgroundType: backgroundType,
          icon: icon,
        ),
      );
    },
  );
}

class TvDialog extends StatelessWidget {
  const TvDialog({
    super.key,
    required this.type,
    required this.title,
    required this.content,
    required this.primaryLabel,
    required this.onPrimaryPressed,
    this.secondaryLabel,
    this.onSecondaryPressed,
    this.backgroundType = TvDialogBackgroundType.standard,
    this.icon,
    this.showScrim = true,
  }) : assert(
         type == TvDialogType.confirm ||
             (secondaryLabel != null && onSecondaryPressed != null),
       );

  final TvDialogType type;
  final String title;
  final String content;
  final String primaryLabel;
  final VoidCallback onPrimaryPressed;
  final String? secondaryLabel;
  final VoidCallback? onSecondaryPressed;
  final TvDialogBackgroundType backgroundType;
  final IconData? icon;
  final bool showScrim;

  @override
  Widget build(BuildContext context) {
    final dialog = switch (backgroundType) {
      TvDialogBackgroundType.standard => _TvStandardDialog(dialog: this),
      TvDialogBackgroundType.fullScreen => _TvFullScreenDialog(dialog: this),
    };

    if (!showScrim) {
      return dialog;
    }

    return Stack(
      children: [
        Positioned.fill(child: _TvDialogBackground(dialog: this)),
        Center(child: dialog),
      ],
    );
  }
}
