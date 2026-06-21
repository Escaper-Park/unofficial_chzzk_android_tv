import 'package:flutter/widgets.dart';

import '../../core/tv/back/back.dart';
import 'app_shell_focus_scope.dart';

class AppShellContentBackScope extends StatefulWidget {
  const AppShellContentBackScope({
    super.key,
    required this.controller,
    required this.child,
  });

  final TvBackController controller;
  final Widget child;

  @override
  State<AppShellContentBackScope> createState() =>
      _AppShellContentBackScopeState();
}

class _AppShellContentBackScopeState extends State<AppShellContentBackScope> {
  FocusScopeNode? _navigationNode;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _setNavigationNode(AppShellFocusScope.maybeNavigationOf(context));
  }

  @override
  void dispose() {
    _setNavigationNode(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TvBackScope(
      controller: widget.controller,
      enabled: !(_navigationNode?.hasFocus ?? false),
      child: widget.child,
    );
  }

  void _setNavigationNode(FocusScopeNode? nextNode) {
    final currentNode = _navigationNode;
    if (identical(currentNode, nextNode)) {
      return;
    }

    currentNode?.removeListener(_handleNavigationFocusChanged);
    _navigationNode = nextNode;
    nextNode?.addListener(_handleNavigationFocusChanged);
  }

  void _handleNavigationFocusChanged() {
    if (mounted) {
      setState(() {});
    }
  }
}
