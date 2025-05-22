import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';

import '../../../utils/popup/popup_utils.dart';
import '../../constants/enums.dart' show AppRoute;

class PopScopeScreen extends HookWidget {
  /// A [Scaffold] wrapped by [PopScope] to use [onPopInvoked]
  /// for sidebar and content screen navigation.
  const PopScopeScreen({
    super.key,
    required this.onPopInvoked,
    required this.child,
    this.useScaffold = true,
  });

  final void Function(OnPopInvokedHandler onPopInvokedHandler) onPopInvoked;
  final bool useScaffold;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    final onPopInvokedHandler = useMemoized(() => OnPopInvokedHandler());

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, _) {
        if (!didPop) {
          onPopInvoked(onPopInvokedHandler);
        }
      },
      child: useScaffold ? Scaffold(body: child) : child,
    );
  }
}

/// Handle pop events such as double back exit, sidebar focus, and simple navigation actions.
class OnPopInvokedHandler {
  DateTime? _lastPressedBackButtonAt;

  void pop(BuildContext context) {
    if (context.mounted) {
      context.pop();
    }
  }

  /// If the sidebar's [FocusScopeNode] has focus, change the screen,
  /// otherwise request focus.
  void sidebarFocusAndPop({
    /// Sidebar's [FocusScopeNode]
    required FocusScopeNode node,
    required VoidCallback popAction,
  }) {
    if (node.hasFocus) {
      popAction();
    } else {
      // request focus to sidebar.
      node.requestFocus();
    }
  }

  /// Change screens with optional actions.
  void navigate({
    required BuildContext context,
    required String currentLocation,
    required AppRoute appRoute,
    required VoidCallback? popAction,
  }) {
    popAction?.call();

    if (context.mounted && currentLocation != appRoute.routePath) {
      context.goNamed(appRoute.routeName);
    }
  }

  /// The first time you press the Back button, the [SnackBar] will show a message,
  /// and pressing the Back button again while the snackbar is displayed will exit it.
  void doubleBackExit({
    required BuildContext context,

    /// A condition for when you are ready to exit.
    required bool condition,
    required VoidCallback exitAction,

    /// If the condition is not met, do this.
    required VoidCallback fallbackAction,

    /// Snackbar display time in milliseconds.
    int snackBarDisplayDuration = 2000,
  }) {
    final DateTime currentTime = DateTime.now();

    // if the condition isn't met
    if (!condition) {
      fallbackAction();
      return;
    }

    if (_lastPressedBackButtonAt == null ||
        currentTime.difference(_lastPressedBackButtonAt!) >
            Duration(milliseconds: snackBarDisplayDuration)) {
      _lastPressedBackButtonAt = currentTime;

      // show snackbar
      if (context.mounted) {
        PopupUtils.showSnackBar(
          context: context,
          content: '뒤로 가기를 한 번 더 누르면 종료됩니다',
          displayDuration: snackBarDisplayDuration,
        );
      }
    } else {
      // while the Snackbar is displayed
      exitAction();
    }
  }
}
