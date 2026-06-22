part of 'tv_player_browse_card.dart';

class _TvPlayerBrowseCardThumbnail extends StatelessWidget {
  const _TvPlayerBrowseCardThumbnail({
    required this.variant,
    required this.width,
    required this.title,
    required this.imageUrl,
    required this.channelName,
    required this.channelImageUrl,
    required this.channelVerified,
    required this.liveBadgeLabel,
    required this.vodPublishDateLabel,
    required this.vodDurationLabel,
    required this.restrictionAssetPath,
    required this.showAgeRestrictionOverlay,
  });

  final TvPlayerBrowseCardVariant variant;
  final TvCardWidth width;
  final String title;
  final String? imageUrl;
  final String? channelName;
  final String? channelImageUrl;
  final bool channelVerified;
  final String? liveBadgeLabel;
  final String? vodPublishDateLabel;
  final String? vodDurationLabel;
  final String? restrictionAssetPath;
  final bool showAgeRestrictionOverlay;

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        TvMediaThumbnail(
          imageUrl: imageUrl,
          fallbackIcon: variant == TvPlayerBrowseCardVariant.live
              ? Icons.live_tv_rounded
              : Icons.video_library_outlined,
          restrictionAssetPath: restrictionAssetPath,
          showAgeRestrictionOverlay: showAgeRestrictionOverlay,
        ),
        const DecoratedBox(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                Colors.transparent,
                TvPlayerBrowseOverlayDesign.cardScrimColor,
              ],
            ),
          ),
        ),
        Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: switch (variant) {
            TvPlayerBrowseCardVariant.live => TvPlayerBrowseLiveCardInfo(
              title: title,
              channelName: channelName ?? '',
              channelImageUrl: channelImageUrl,
              channelVerified: channelVerified,
            ),
            TvPlayerBrowseCardVariant.vod => TvPlayerBrowseVodCardInfo(
              title: title,
            ),
          },
        ),
        Positioned(
          top: TvPlayerBrowseOverlayDesign.topBadgeInset,
          left: TvPlayerBrowseOverlayDesign.topBadgeInset,
          child: switch (variant) {
            TvPlayerBrowseCardVariant.live => _TvPlayerBrowseLiveBadge(
              label: liveBadgeLabel,
              maxWidth: TvPlayerBrowseOverlayDesign.maxBadgeWidth(width),
            ),
            TvPlayerBrowseCardVariant.vod => _TvPlayerBrowseVodMetadataBadge(
              publishDateLabel: vodPublishDateLabel,
              durationLabel: vodDurationLabel,
              maxWidth: TvPlayerBrowseOverlayDesign.maxBadgeWidth(width),
            ),
          },
        ),
      ],
    );
  }
}
