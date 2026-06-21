import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';

class AppShellFocusScope extends InheritedWidget {
  const AppShellFocusScope({
    super.key,
    required this.navigationNode,
    required this.contentNode,
    required this.homeRefreshListenable,
    required super.child,
  });

  final FocusScopeNode navigationNode;
  final FocusScopeNode contentNode;
  final ValueListenable<int> homeRefreshListenable;

  static FocusScopeNode navigationOf(BuildContext context) {
    return _scopeOf(context).navigationNode;
  }

  static FocusScopeNode? maybeNavigationOf(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<AppShellFocusScope>()
        ?.navigationNode;
  }

  static FocusScopeNode contentOf(BuildContext context) {
    return _scopeOf(context).contentNode;
  }

  static ValueListenable<int>? maybeHomeRefreshListenableOf(
    BuildContext context,
  ) {
    return context
        .dependOnInheritedWidgetOfExactType<AppShellFocusScope>()
        ?.homeRefreshListenable;
  }

  @override
  bool updateShouldNotify(covariant AppShellFocusScope oldWidget) {
    return oldWidget.navigationNode != navigationNode ||
        oldWidget.contentNode != contentNode ||
        oldWidget.homeRefreshListenable != homeRefreshListenable;
  }

  static AppShellFocusScope _scopeOf(BuildContext context) {
    final scope = context
        .dependOnInheritedWidgetOfExactType<AppShellFocusScope>();
    if (scope == null) {
      throw FlutterError('AppShellFocusScope not found in context.');
    }

    return scope;
  }
}
