import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import './src/common/constants/styles.dart';
import './src/utils/router/app_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  // Check memory leaks in images for debugging
  debugInvertOversizedImages = true;

  runApp(
    const ProviderScope(
      child: ChzzkTV(),
    ),
  );
}

class ChzzkTV extends ConsumerWidget {
  const ChzzkTV({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    // Add shortcuts for global activation of select button in a remote control.
    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const SelectIntent(),
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.basicThemeData,
        routerConfig: appRouter,
      ),
    );
  }
}
