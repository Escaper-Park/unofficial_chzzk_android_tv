import 'package:flutter/material.dart';
import 'package:unofficial_chzzk_android_tv/src/ui/common/optimized_image.dart';

import '../../../../constants/assets_path.dart';

class ChzzkLogo extends StatelessWidget {
  /// A responsive Chzzk logo.
  const ChzzkLogo({super.key, required this.parentHasFocus});

  final bool parentHasFocus;

  @override
  Widget build(BuildContext context) {
    return parentHasFocus ? _focusedLogo() : _unFocusedLogo();
  }

  Widget _focusedLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: _unFocusedLogo(),
        ),
        Expanded(
          child: Center(
            child: Image.asset(
              AssetsPath.logoText,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ],
    );
  }

  Widget _unFocusedLogo() {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10.0),
      child: const OptimizedAssetImage(
        imagePath: AssetsPath.logoIcon,
        imageWidth: 45.0,
      ),
    );
  }
}
