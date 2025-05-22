part of '../live_container.dart';

class _LiveContainerBody extends StatelessWidget {
  const _LiveContainerBody({
    required this.openDate,
    required this.liveThumbnail,
    required this.liveStatusBadge,
    required this.liveUptimeBadge,
    required this.liveInfoCard,
  });

  final String? openDate;

  final Widget liveThumbnail;
  final Widget liveStatusBadge;
  final Widget liveUptimeBadge;
  final Widget liveInfoCard;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Top side
        SizedBox(
          width: Dimensions.videoThumbnailWidth,
          height: Dimensions.videoThumbnailHeight,
          child: Stack(
            children: [
              liveThumbnail,
              liveStatusBadge,
              if (openDate != null) liveUptimeBadge,
            ],
          ),
        ),
        // Bottom side
        Expanded(child: liveInfoCard),
      ],
    );
  }
}
