import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../common/widgets/dpad/dpad_widgets.dart';
import '../../../../common/widgets/screen/pop_scope_screen.dart';

class StreamOverlayBase extends StatelessWidget {
  const StreamOverlayBase({
    super.key,
    required this.isOverlayHidden,
    required this.hideOverlay,
    required this.disposeController,
    required this.wakelockDisable,
    this.refreshHome,
    required this.overlayFocusNode,
    required this.controlsFSN,
    required this.dpadActionCallbacks,
    required this.controlWidget,
    required this.useKeyReapeatEvent,
    this.customOnKeyEvent,
  });

  final bool isOverlayHidden;
  final VoidCallback hideOverlay;
  final Future<void> Function() disposeController;
  final Future<void> Function() wakelockDisable;

  /// refresh home live list
  final VoidCallback? refreshHome;

  final FocusNode overlayFocusNode;
  final FocusScopeNode controlsFSN;
  final bool useKeyReapeatEvent;
  final DpadActionCallbacks dpadActionCallbacks;
  final Widget controlWidget;
  final void Function(KeyEvent event, DpadActionCallbacks dpadActionCallbacks)?
      customOnKeyEvent;

  @override
  Widget build(BuildContext context) {
    return PopScopeScreen(
      useScaffold: false,
      onPopInvoked: (onPopInvokedHandler) {
        onPopInvokedHandler.doubleBackExit(
          context: context,
          condition: isOverlayHidden,
          exitAction: () async {
            await disposeController();
            await wakelockDisable();

            refreshHome?.call();

            if (context.mounted) context.pop();
          },
          fallbackAction: hideOverlay,
        );
      },
      child: Stack(
        children: [
          DpadActionWidget(
            autofocus: true,
            focusNode: overlayFocusNode,
            useFocusedBorder: false,
            useKeyRepeatEvent: useKeyReapeatEvent,
            customOnKeyEvent: customOnKeyEvent,
            borderRadius: 0.0,
            dpadActionCallbacks: dpadActionCallbacks,
            child: const SizedBox(),
          ),
          FocusScope(
            node: controlsFSN,
            child: controlWidget,
          ),
        ],
      ),
    );
  }
}
