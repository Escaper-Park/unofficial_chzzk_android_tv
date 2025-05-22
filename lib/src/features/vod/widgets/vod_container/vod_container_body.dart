part of '../vod_container.dart';

class _VodContainerBody extends StatelessWidget {
  const _VodContainerBody({
    required this.vodThumbnail,
    required this.vodStatusBadge,
    required this.vodInfoCard,
  });

  final Widget vodThumbnail;
  final Widget vodStatusBadge;
  final Widget vodInfoCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // top side
        SizedBox(
          width: Dimensions.videoThumbnailWidth,
          height: Dimensions.videoThumbnailHeight,
          child: Stack(
            children: [
              vodThumbnail,
              vodStatusBadge,
            ],
          ),
        ),
        // bottom side
        Expanded(child: vodInfoCard),
      ],
    );
  }
}
