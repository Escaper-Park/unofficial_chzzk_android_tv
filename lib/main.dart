import 'package:flutter/material.dart';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'src/common/constants/styles.dart';
import 'src/features/auth/controller/auth_controller.dart';
import 'src/utils/router/app_router.dart';
import 'src/utils/shared_preferences/shared_prefs.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Get local database for settings
  final SharedPreferences sharedPrefs = await SharedPreferences.getInstance();

  // if (!kIsWeb && defaultTargetPlatform == TargetPlatform.android) {
  //   await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  // }

  runApp(
    ProviderScope(
      overrides: [sharedPrefsProvider.overrideWithValue(sharedPrefs)],
      child: const ChzzkTV(),
    ),
  );
}

class ChzzkTV extends ConsumerWidget with MainEvent {
  const ChzzkTV({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    eagerInitialize(ref);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: appRouter,
      theme: AppTheme.darkThemeData,
    );
  }
}

mixin class MainEvent {
  eagerInitialize(WidgetRef ref) => ref.watch(authControllerProvider);
}
