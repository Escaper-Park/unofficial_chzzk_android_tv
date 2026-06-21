part of 'tv_player_browse_card.dart';

class _TvPlayerBrowseLiveBadge extends StatelessWidget {
  const _TvPlayerBrowseLiveBadge({
    required this.label,
    required this.maxWidth,
  });

  final String? label;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    final effectiveLabel = _trimmedOrNull(label);
    if (effectiveLabel == null) {
      return const SizedBox.shrink();
    }

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: TvPlayerBrowseOverlayDesign.liveBadgeBackgroundColor,
          borderRadius: BorderRadius.circular(
            TvPlayerBrowseOverlayDesign.topBadgeRadius,
          ),
        ),
        child: Padding(
          padding: TvPlayerBrowseOverlayDesign.topBadgePadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox.square(
                dimension: TvPlayerBrowseOverlayDesign.topBadgeDotSize,
                child: DecoratedBox(
                  decoration: BoxDecoration(
                    color: AppColorTokens.liveIndicatorColor,
                    shape: BoxShape.circle,
                  ),
                ),
              ),
              const SizedBox(width: TvPlayerBrowseOverlayDesign.topBadgeGap),
              Flexible(
                child: Text(
                  effectiveLabel,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TvPlayerBrowseOverlayDesign.badgeTextStyle(context),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TvPlayerBrowseVodMetadataBadge extends StatelessWidget {
  const _TvPlayerBrowseVodMetadataBadge({
    required this.publishDateLabel,
    required this.durationLabel,
    required this.maxWidth,
  });

  final String? publishDateLabel;
  final String? durationLabel;
  final double maxWidth;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: maxWidth),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: TvPlayerBrowseOverlayDesign.badgeBackgroundColor,
          borderRadius: BorderRadius.circular(
            TvPlayerBrowseOverlayDesign.topBadgeRadius,
          ),
          border: Border.all(
            color: TvPlayerBrowseOverlayDesign.badgeBorderColor,
          ),
        ),
        child: Padding(
          padding: TvPlayerBrowseOverlayDesign.topBadgePadding,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Flexible(
                child: _TvPlayerBrowseVodMetadataItem(
                  icon: Icons.calendar_month_rounded,
                  label: _fallbackLabel(publishDateLabel),
                ),
              ),
              const SizedBox(width: TvPlayerBrowseOverlayDesign.topBadgeGap),
              Text(
                _vodMetadataSeparator,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TvPlayerBrowseOverlayDesign.badgeTextStyle(context),
              ),
              const SizedBox(width: TvPlayerBrowseOverlayDesign.topBadgeGap),
              Flexible(
                child: _TvPlayerBrowseVodMetadataItem(
                  icon: Icons.schedule_rounded,
                  label: _fallbackLabel(durationLabel),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TvPlayerBrowseVodMetadataItem extends StatelessWidget {
  const _TvPlayerBrowseVodMetadataItem({
    required this.icon,
    required this.label,
  });

  final IconData icon;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          icon,
          size: TvPlayerBrowseOverlayDesign.topBadgeIconSize,
          color: TvPlayerBrowseOverlayDesign.badgeForegroundColor,
        ),
        const SizedBox(width: TvPlayerBrowseOverlayDesign.topBadgeIconTextGap),
        Flexible(
          child: Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: TvPlayerBrowseOverlayDesign.badgeTextStyle(context),
          ),
        ),
      ],
    );
  }
}

String _fallbackLabel(String? value) {
  return _trimmedOrNull(value) ?? '-';
}

String? _trimmedOrNull(String? value) {
  final trimmed = value?.trim();
  return trimmed == null || trimmed.isEmpty ? null : trimmed;
}

const _vodMetadataSeparator = '•';
