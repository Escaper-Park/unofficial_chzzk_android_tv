import 'package:flutter/material.dart';

import '../../../assets/assets.dart';

enum TvScrimType {
  homeImmersive,
  dialog,
  modal,
  playerControls,
}

class TvScrim extends StatelessWidget {
  const TvScrim({
    super.key,
    required this.type,
  });

  static const homeImmersiveAsset = AppAssetPaths.radialScrim;

  final TvScrimType type;

  @override
  Widget build(BuildContext context) {
    if (type == TvScrimType.homeImmersive) {
      return Image.asset(homeImmersiveAsset, fit: BoxFit.fill);
    }

    return ColoredBox(color: colorFor(type));
  }

  static Color colorFor(TvScrimType type) {
    return switch (type) {
      TvScrimType.homeImmersive => Colors.transparent,
      TvScrimType.dialog || TvScrimType.modal => const Color(
        0xFF1A1C1E,
      ).withValues(alpha: 0.6),
      TvScrimType.playerControls => const Color(0xFF1A1C1E).withValues(
        alpha: 0.4,
      ),
    };
  }
}
