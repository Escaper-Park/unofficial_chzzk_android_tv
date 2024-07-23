import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/optimized_image.dart';

class SplashLogo extends StatelessWidget {
  const SplashLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12.0),
      child: const OptimizedAssetImage(
        imagePath: AssetsPath.logoIcon,
        imageWidth: Dimensions.splashLogoSize,
      ),
    );
  }
}
