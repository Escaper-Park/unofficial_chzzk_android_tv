part of '../clip_container.dart';

class _ClipThumbnail extends StatelessWidget {
  const _ClipThumbnail({
    required this.clip,
    required this.thumbnailWidth,
    required this.thumbnailHeight,
  });

  final NaverClip clip;
  final double thumbnailWidth;
  final double thumbnailHeight;

  @override
  Widget build(BuildContext context) {
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
      child: Thumbnail(
        thumbnailUrl: clip.thumbnailImageUrl,
        thumbnailWidth: thumbnailWidth,
        thumbnailHeight: thumbnailHeight,
        abroad: clip.blindType == "ABROAD",
        adult: clip.adult,
        fit: BoxFit.fitWidth,
      ),
    );
  }
}
