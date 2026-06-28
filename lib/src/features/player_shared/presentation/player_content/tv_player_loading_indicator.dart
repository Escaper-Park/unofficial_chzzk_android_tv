import 'package:flutter/material.dart';

import '../../../../core/assets/app_asset_paths.dart';
import '../../../../core/ui/components/primitives/primitives.dart';

abstract final class TvPlayerLoadingIndicatorDesign {
  static const size = 72.0;
}

class TvPlayerLoadingIndicator extends StatelessWidget {
  const TvPlayerLoadingIndicator({
    super.key,
    this.size = TvPlayerLoadingIndicatorDesign.size,
  });

  final double size;

  @override
  Widget build(BuildContext context) {
    return OptimizedImage.asset(
      AppAssetPaths.iconChzzkDark,
      width: size,
      height: size,
      fit: BoxFit.contain,
    );
  }
}
