import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/optimized_image.dart';

class ResponsiveChzzkLogo extends StatelessWidget {
  const ResponsiveChzzkLogo({super.key, required this.parentHasFocus});

  final bool parentHasFocus;

  @override
  Widget build(BuildContext context) {
    return parentHasFocus ? _iconAndTextLogo() : _iconLogo();
  }

  Widget _iconAndTextLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        _iconLogo(),
        const Expanded(
          child: Center(
            child: OptimizedAssetImage(
              imagePath: AssetsPath.logoText,
              imageWidth: Dimensions.logoIconWidth * 2,
            ),
          ),
        )
      ],
    );
  }

  Widget _iconLogo() {
    return Align(
      alignment: Alignment.centerLeft,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: const OptimizedAssetImage(
          imagePath: AssetsPath.logoIcon,
          imageWidth: Dimensions.logoIconWidth,
        ),
      ),
    );
  }
}
