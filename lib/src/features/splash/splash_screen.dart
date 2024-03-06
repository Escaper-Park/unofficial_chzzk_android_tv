import 'package:flutter/material.dart';

import '../../common/constants/assets_path.dart';
import '../../common/widgets/base_scaffold.dart';
import '../../common/widgets/optimized_image.dart';
import '../../utils/router/app_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 1), () {
      if (context.mounted) {
        context.goNamed(AppRoute.home.routeName);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      body: Center(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(12.0),
          child: const OptimizedAssetImage(
            imagePath: AssetsPath.logoIcon,
            imageWidth: 100.0,
          ),
        ),
      ),
    );
  }
}
