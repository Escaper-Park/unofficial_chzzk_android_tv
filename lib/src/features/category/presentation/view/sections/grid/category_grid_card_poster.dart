part of 'category_grid_card.dart';

class _CategoryPoster extends StatelessWidget {
  const _CategoryPoster({
    required this.imageUrl,
  });

  final String? imageUrl;

  @override
  Widget build(BuildContext context) {
    final url = chzzkImageUrlWithType(
      imageUrl,
      ChzzkImageVariant.categoryPoster,
    );

    return LayoutBuilder(
      builder: (context, constraints) {
        final width = constraints.maxWidth;
        final height = constraints.maxHeight;
        final fallback = OptimizedImage.asset(
          AppAssetPaths.categoryBaseThumbnail,
          width: width,
          height: height,
        );

        if (url == null) {
          return fallback;
        }

        return OptimizedImage.network(
          url,
          width: width,
          height: height,
          placeholder: fallback,
          errorFallback: fallback,
        );
      },
    );
  }
}
