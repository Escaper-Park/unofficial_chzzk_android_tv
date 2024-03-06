import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import './src/utils/router/app_router.dart';
import './src/utils/shared_preferences/shared_prefs.dart';
import './src/common/constants/styles.dart';
import './src/utils/image_cache/image_cache_controller.dart';

void main() async {
  // Set global image cache.
  ImageCacheController();
  WidgetsFlutterBinding.ensureInitialized();

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }

  // Get Shared Prefences Data
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  GoRouter.optionURLReflectsImperativeAPIs = true;

  runApp(
    ProviderScope(
      overrides: [
        sharedPrefsProvider.overrideWithValue(sharedPrefs),
      ],
      child: const ChzzkTV(),
    ),
  );
}

class ChzzkTV extends ConsumerWidget {
  const ChzzkTV({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);

    return Shortcuts(
      shortcuts: <LogicalKeySet, Intent>{
        LogicalKeySet(LogicalKeyboardKey.select): const ActivateIntent(),
      },
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.darkThemeData,
        routerConfig: appRouter,
      ),
    );
  }
}
