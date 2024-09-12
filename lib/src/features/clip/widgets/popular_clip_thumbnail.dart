import 'package:flutter/material.dart';

import '../../../common/constants/styles.dart';
import '../model/clip.dart';
import 'clip_thumbnail.dart';

class PopularClipThumbnail extends StatelessWidget {
  const PopularClipThumbnail({
    super.key,
    required this.clip,
    required this.imageWidth,
    required this.imageHeight,
  });

  final NaverClip clip;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    // Add shaderMask to give gradient effect that makes it darker as it goes down.
    return ShaderMask(
      shaderCallback: (rect) {
        return const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            AppColors.blackColor,
            AppColors.blackColor,
            Colors.transparent,
          ],
        ).createShader(Rect.fromLTRB(0, 0, rect.width, rect.height));
      },
      blendMode: BlendMode.dstIn,
      child: ClipThumbnail(
        clip: clip,
        imageHeight: imageHeight,
        imageWidth: imageWidth,
      ),
    );
  }
}
