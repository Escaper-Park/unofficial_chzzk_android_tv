import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/widgets/optimized_image.dart';

class CategoryPoster extends StatelessWidget {
  const CategoryPoster({
    super.key,
    required this.posterImageUrl,
    required this.imageWidth,
    required this.imageHeight,
  });

  final String? posterImageUrl;
  final double imageWidth;
  final double imageHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: imageWidth,
      height: imageHeight,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: _image(),
      ),
    );
  }

  Widget _image() {
    return posterImageUrl == null
        ? OptimizedAssetImage(
            imagePath: AssetsPath.categoryBaseThumbnail,
            imageWidth: imageWidth,
          )
        : OptimizedNetworkImage(
            imageUrl: posterImageUrl!,
            imageWidth: imageWidth,
          );
  }
}
