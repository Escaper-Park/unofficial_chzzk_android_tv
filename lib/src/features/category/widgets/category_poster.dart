import 'package:flutter/material.dart';

import '../../../common/constants/assets_path.dart';
import '../../../common/widgets/ui/ui_widgets.dart'
    show OptimizedAssetImage, OptimizedNetworkImage;

class CategoryPoster extends StatelessWidget {
  const CategoryPoster({
    super.key,
    required this.posterImageUrl,
    required this.posterWidth,
    required this.posterHeight,
  });

  final String? posterImageUrl;
  final double posterWidth;
  final double posterHeight;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: posterHeight,
      width: posterWidth,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(12.0),
        child: posterImageUrl == null
            ? OptimizedAssetImage(
                imageHeight: posterHeight,
                imageWidth: posterWidth,
                imagePath: AssetsPath.categoryBaseThumbnail,
              )
            : OptimizedNetworkImage(
                imageHeight: posterHeight,
                imageWidth: posterWidth,
                imageUrl: posterImageUrl!,
              ),
      ),
    );
  }
}
