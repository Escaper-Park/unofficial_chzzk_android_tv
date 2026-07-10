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
    this.restrictionAssetPath,
    this.showAgeRestrictionOverlay = false,
    this.autofocus = false,
    this.focusNode,
    this.onFocusChanged,
    this.thumbnailStreamRetainer,
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
  final String? restrictionAssetPath;
  final bool showAgeRestrictionOverlay;
  final bool autofocus;
  final FocusNode? focusNode;
  final ValueChanged<bool>? onFocusChanged;
  final BucketedImageStreamRetainer? thumbnailStreamRetainer;

  @override
  Widget build(BuildContext context) {
    final ownedFocusNode = useFocusNode();
    final focusNode = this.focusNode ?? ownedFocusNode;
    final activationGuard = useMemoized(TvActivationGuard.new);

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
        clipBehavior: Clip.hardEdge,
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
              child: RepaintBoundary(
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
                  restrictionAssetPath: restrictionAssetPath,
                  showAgeRestrictionOverlay: showAgeRestrictionOverlay,
                  streamRetainer: thumbnailStreamRetainer,
                ),
              ),
            ),
            Positioned.fill(
              child: _TvPlayerBrowseCardFocusOutline(focusNode: focusNode),
            ),
          ],
        ),
      ),
    );
  }
}

class _TvPlayerBrowseCardFocusOutline extends StatelessWidget {
  const _TvPlayerBrowseCardFocusOutline({required this.focusNode});

  final FocusNode focusNode;

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: focusNode,
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
      builder: (context, child) {
        return focusNode.hasFocus ? child! : const SizedBox.expand();
      },
    );
  }
}
