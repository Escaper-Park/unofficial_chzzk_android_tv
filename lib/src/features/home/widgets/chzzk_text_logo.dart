import 'package:flutter/material.dart';
import 'package:gif/gif.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/constants/dimensions.dart';
import '../../../common/widgets/optimized_image.dart';

class ChzzkTextLogo extends StatelessWidget {
  /// A gif text '치지직' logo.
  const ChzzkTextLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: Dimensions.homeChzzkTextLogoWidth,
      child: OptimizedGifImage(
        autostart: Autostart.once,
        imageWidth: Dimensions.homeChzzkTextLogoWidth,
        image: AssetImage(AssetsPath.logoHeader),
      ),
    );
  }
}
