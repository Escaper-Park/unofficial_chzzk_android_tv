part of 'home_immersive_background.dart';

class _HomeImmersiveBackgroundStack extends StatelessWidget {
  const _HomeImmersiveBackgroundStack({
    required this.thumbnailProvider,
    required this.adultOverlayProvider,
    required this.showThumbnail,
    required this.showAdultOverlay,
  });

  final ImageProvider<Object>? thumbnailProvider;
  final ImageProvider<Object>? adultOverlayProvider;
  final bool showThumbnail;
  final bool showAdultOverlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        if (showThumbnail && thumbnailProvider != null)
          Image(
            image: thumbnailProvider!,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        if (showAdultOverlay && adultOverlayProvider != null)
          Image(
            image: adultOverlayProvider!,
            fit: BoxFit.cover,
            filterQuality: FilterQuality.low,
          ),
        const TvScrim(type: TvScrimType.homeImmersive),
      ],
    );
  }
}
