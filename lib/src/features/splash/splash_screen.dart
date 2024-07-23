import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:unofficial_chzzk_android_tv/src/features/auth/controller/auth_controller.dart';

import '../../utils/router/app_router.dart';
import './widgets/splash_widgets.dart';

class SplashScreen extends ConsumerStatefulWidget {
  /// Use this splash page as a root to use PopScope on the other screen.
  const SplashScreen({super.key});

  @override
  ConsumerState<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends ConsumerState<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // Show the splash icon in a sec and go to home screen.
    Future.delayed(const Duration(seconds: 1), () {
      // Init auth controller to use saved cookies.
      ref.read(authControllerProvider);

      if (context.mounted) context.goNamed(AppRoute.home.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: SplashLogo(),
      ),
    );
  }
}
