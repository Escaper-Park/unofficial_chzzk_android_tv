import 'package:flutter/material.dart';

import '../core/ui/ui.dart';
import 'app_theme.dart';
import 'di/app_dependencies.dart';
import 'router/app_router.dart';

const _showDebugLayoutGuide = false;

class ChzzkTvApp extends StatelessWidget {
  const ChzzkTvApp({
    super.key,
    required this.dependencies,
  });

  final AppDependencies dependencies;

  @override
  Widget build(BuildContext context) {
    final theme = AppTheme.dark();

    return AppDependencyScope(
      dependencies: dependencies,
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: theme,
        builder: (context, child) {
          return ColoredBox(
            color: theme.scaffoldBackgroundColor,
            child: DebugLayout(
              enabled: _showDebugLayoutGuide,
              child: child ?? const SizedBox.shrink(),
            ),
          );
        },
        routerConfig: appRouter,
      ),
    );
  }
}
