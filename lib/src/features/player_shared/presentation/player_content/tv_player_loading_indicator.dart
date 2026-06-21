import 'package:flutter/material.dart';

import '../../../../core/assets/app_asset_paths.dart';
import '../../../../core/ui/components/primitives/primitives.dart';

abstract final class TvPlayerLoadingIndicatorDesign {
  static const size = 72.0;
}

class TvPlayerLoadingIndicator extends StatelessWidget {
  const TvPlayerLoadingIndicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const OptimizedImage.asset(
      AppAssetPaths.iconChzzkDark,
      width: TvPlayerLoadingIndicatorDesign.size,
      height: TvPlayerLoadingIndicatorDesign.size,
      fit: BoxFit.contain,
    );
  }
}
