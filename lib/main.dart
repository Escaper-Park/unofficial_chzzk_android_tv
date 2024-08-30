import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show LogicalKeyboardKey;

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './src/common/constants/styles.dart';
import './src/utils/router/app_router.dart';
import './src/utils/shared_preferences/shared_prefs.dart';
import './src/features/auth/controller/auth_controller.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  // Check memory leaks in images for debugging
  // debugInvertOversizedImages = true;

  // Get local database
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  PlatformDispatcher.instance.onError = (error, stack) {
    return true;
  };

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
      child: const ChzzkTV(),
    ),
  );
}

class ChzzkTV extends ConsumerWidget {
  const ChzzkTV({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    // Eager Initialization auth controller to use saved cookies.
    ref.watch(authControllerProvider);

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
