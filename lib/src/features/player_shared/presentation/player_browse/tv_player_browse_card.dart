import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/design/design.dart';
import '../../../../core/tv/input/input.dart';
import '../../../../core/ui/components/cards/cards.dart';
import '../../../../core/ui/components/primitives/primitives.dart';
import '../../../../core/ui/composites/media_cards/media_cards.dart';
import 'tv_player_browse_card_info.dart';
import 'tv_player_browse_overlay_design.dart';

part 'tv_player_browse_card_badges.dart';
part 'tv_player_browse_card_thumbnail.dart';

enum TvPlayerBrowseCardVariant {
  live,
  vod,
}

class TvPlayerBrowseCard extends HookWidget {
  const TvPlayerBrowseCard({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onPressed,
    this.variant = TvPlayerBrowseCardVariant.live,
    this.width = TvCardWidth.four,
    this.channelName,
    this.channelImageUrl,
    this.channelVerified = false,
    this.liveBadgeLabel,
    this.vodPublishDateLabel,
    this.vodDurationLabel,
    this.progress,
    this.restrictionAssetPath,
    this.showAgeRestrictionOverlay = false,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChanged,
  });

  final String title;
  final String? imageUrl;
  final VoidCallback onPressed;
  final TvPlayerBrowseCardVariant variant;
  final TvCardWidth width;
  final String? channelName;
  final String? channelImageUrl;
  final bool channelVerified;
  final String? liveBadgeLabel;
  final String? vodPublishDateLabel;
  final String? vodDurationLabel;
  final double? progress;
  final String? restrictionAssetPath;
  final bool showAgeRestrictionOverlay;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChanged;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final focused = focusNode.hasFocus;
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(
        TvPlayerBrowseOverlayDesign.cardRadius,
      ),
    );

    return SizedBox(
      width: width.value,
      height: TvPlayerBrowseOverlayDesign.cardHeight(width),
      child: Card(
        margin: EdgeInsets.zero,
        color: TvPlayerBrowseOverlayDesign.cardBackgroundColor,
        elevation: 0,
        shadowColor: Colors.transparent,
        surfaceTintColor: Colors.transparent,
        shape: shape,
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.expand,
          children: [
            InkWell(
              autofocus: autofocus,
              focusNode: focusNode,
              onFocusChange: onFocusChanged,
              onTap: () => activationGuard.run(onPressed),
              customBorder: shape,
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              child: _TvPlayerBrowseCardThumbnail(
                variant: variant,
                width: width,
                title: title,
                imageUrl: imageUrl,
                channelName: channelName,
                channelImageUrl: channelImageUrl,
                channelVerified: channelVerified,
                liveBadgeLabel: liveBadgeLabel,
                vodPublishDateLabel: vodPublishDateLabel,
                vodDurationLabel: vodDurationLabel,
                progress: progress,
                restrictionAssetPath: restrictionAssetPath,
                showAgeRestrictionOverlay: showAgeRestrictionOverlay,
              ),
            ),
            if (focused)
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(
                        TvPlayerBrowseOverlayDesign.cardRadius,
                      ),
                      border: Border.all(
                        color: AppColorTokens.brandColor,
                        width: TvPlayerBrowseOverlayDesign.cardOutlineWidth,
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
