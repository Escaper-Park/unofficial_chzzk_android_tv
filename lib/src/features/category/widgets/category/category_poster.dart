import 'package:flutter/material.dart';

import '../../../../common/constants/assets_path.dart';
import '../../../../common/widgets/optimized_image.dart';

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
      height: imageHeight,
      width: imageWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: posterImageUrl == null
            ? OptimizedAssetImage(
                imagePath: AssetsPath.categoryBaseThumbnail,
                imageWidth: imageWidth,
                imageHeight: imageHeight,
              )
            : OptimizedNetworkImage(
                imageUrl: posterImageUrl!,
                imageWidth: imageWidth,
                imageHeight: imageHeight,
                
              ),
      ),
    );
  }
}
