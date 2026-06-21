import 'package:flutter/material.dart';

import '../../../../core/ui/components/primitives/primitives.dart';
import '../../../../core/ui/composites/media_cards/media_cards.dart';
import 'tv_player_browse_overlay_design.dart';

class TvPlayerBrowseLiveCardInfo extends StatelessWidget {
  const TvPlayerBrowseLiveCardInfo({
    super.key,
    required this.title,
    required this.channelName,
    this.channelImageUrl,
    this.channelVerified = false,
  });

  final String title;
  final String channelName;
  final String? channelImageUrl;
  final bool channelVerified;

  @override
  Widget build(BuildContext context) {
    return _TvPlayerBrowseInfoBand(
      child: Row(
        children: [
          ProfileCircleAvatar(
            imageUrl: channelImageUrl,
            radius: TvPlayerBrowseOverlayDesign.infoAvatarRadius,
            openLive: true,
            liveBorderWidth: 1.5,
          ),
          const SizedBox(width: TvPlayerBrowseOverlayDesign.infoAvatarGap),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TvMediaChannelName(
                  channelName: _fallbackLabel(channelName),
                  verified: channelVerified,
                  style: TvPlayerBrowseOverlayDesign.channelTextStyle(context),
                ),
                const SizedBox(height: TvPlayerBrowseOverlayDesign.infoTextGap),
                Text(
                  title.replaceAll('\n', ' '),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TvPlayerBrowseOverlayDesign.titleTextStyle(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class TvPlayerBrowseVodCardInfo extends StatelessWidget {
  const TvPlayerBrowseVodCardInfo({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context) {
    return _TvPlayerBrowseInfoBand(
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          title.replaceAll('\n', ' '),
          maxLines: 2,
          overflow: TextOverflow.ellipsis,
          style: TvPlayerBrowseOverlayDesign.titleTextStyle(context),
        ),
      ),
    );
  }
}

class _TvPlayerBrowseInfoBand extends StatelessWidget {
  const _TvPlayerBrowseInfoBand({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: TvPlayerBrowseOverlayDesign.infoBandBackgroundColor,
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(TvPlayerBrowseOverlayDesign.cardRadius),
        ),
      ),
      child: SizedBox(
        height: TvPlayerBrowseOverlayDesign.infoBandHeight,
        child: Padding(
          padding: TvPlayerBrowseOverlayDesign.infoBandPadding,
          child: child,
        ),
      ),
    );
  }
}

String _fallbackLabel(String value) {
  final trimmed = value.trim();
  return trimmed.isEmpty ? '-' : trimmed;
}
