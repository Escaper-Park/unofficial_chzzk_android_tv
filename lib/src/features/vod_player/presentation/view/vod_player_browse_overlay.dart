import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../player_shared/presentation/player_browse/player_browse.dart';
import '../../../vod/domain/entities/vod_feed.dart';
import '../../../vod/presentation/view/shared/vod_card_formatters.dart';
import '../bloc/vod_player_bloc.dart';
import '../vod_player_screen_string.dart';

class VodPlayerBrowseOverlay extends HookWidget {
  const VodPlayerBrowseOverlay({
    super.key,
    required this.state,
    required this.browseNode,
    required this.onInteraction,
    required this.onLoadMore,
    required this.onFallbackPressed,
    required this.onVodSelected,
  });

  final VodPlayerState state;
  final FocusScopeNode browseNode;
  final VoidCallback onInteraction;
  final VoidCallback onLoadMore;
  final VoidCallback onFallbackPressed;
  final ValueChanged<Vod> onVodSelected;

  @override
  Widget build(BuildContext context) {
    final placeholderFocusNode = useFocusNode(
      debugLabel: 'vod player browse placeholder',
    );
    final showCards =
        state.browseStatus == VodPlayerBrowseLoadStatus.success &&
        state.browseItems.isNotEmpty;
    final fallbackAction = state.browseFallbackAction;

    return TvPlayerBrowseOverlay(
      node: browseNode,
      title: VodPlayerScreenString.browseTitle,
      itemCount: showCards ? state.browseItems.length : 0,
      cardWidth: TvCardWidth.four,
      onInteraction: onInteraction,
      onFocusedTail: onLoadMore,
      hasMore: state.browseHasMore,
      isLoadingMore: state.browseLoadingMore,
      placeholder: _VodPlayerBrowsePlaceholder(
        status: state.browseStatus,
        fallbackAction: fallbackAction,
        onFallbackPressed: onFallbackPressed,
      ),
      placeholderFocusNode: fallbackAction == VodPlayerBrowseFallbackAction.none
          ? placeholderFocusNode
          : null,
      itemBuilder: (context, index) {
        final vod = state.browseItems[index];
        return _VodPlayerBrowseCard(
          vod: vod,
          autofocus: index == 0,
          onPressed: () => onVodSelected(vod),
        );
      },
    );
  }
}

class _VodPlayerBrowseCard extends StatelessWidget {
  const _VodPlayerBrowseCard({
    required this.vod,
    required this.autofocus,
    required this.onPressed,
  });

  final Vod vod;
  final bool autofocus;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    final thumbnailUrl = trimmedVodCardTextOrNull(vod.thumbnailImageUrl);

    return TvPlayerBrowseCard(
      key: ValueKey('vod-player-browse-${vod.videoNo}'),
      variant: TvPlayerBrowseCardVariant.vod,
      title: vod.title,
      imageUrl: thumbnailUrl,
      vodPublishDateLabel: formatVodCardPublishDate(vod.publishDate),
      vodDurationLabel: formatVodCardElapsed(
        Duration(seconds: vod.duration),
      ),
      restrictionAssetPath: _restrictionAssetPath(vod, thumbnailUrl),
      showAgeRestrictionOverlay: vod.adult,
      autofocus: autofocus,
      onPressed: onPressed,
    );
  }
}

class _VodPlayerBrowsePlaceholder extends StatelessWidget {
  const _VodPlayerBrowsePlaceholder({
    required this.status,
    required this.fallbackAction,
    required this.onFallbackPressed,
  });

  final VodPlayerBrowseLoadStatus status;
  final VodPlayerBrowseFallbackAction fallbackAction;
  final VoidCallback onFallbackPressed;

  @override
  Widget build(BuildContext context) {
    final actionLabel = VodPlayerScreenString.browseFallbackActionLabel(
      fallbackAction,
    );
    if (actionLabel == null) {
      return TvPlayerBrowseMessage(
        label: VodPlayerScreenString.browseFallbackMessage(status),
      );
    }

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            VodPlayerScreenString.browseFallbackMessage(status),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: AppColorTokens.neutral100,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 10),
          TvButton.label(
            text: actionLabel,
            icon: Icons.close,
            autofocus: true,
            onPressed: onFallbackPressed,
          ),
        ],
      ),
    );
  }
}

String? _restrictionAssetPath(Vod vod, String? thumbnailUrl) {
  if (vod.blindType == _blindTypeAbroad) {
    return TvMediaCardDesign.abroadRestrictionAsset;
  }

  if (vod.adult && thumbnailUrl == null) {
    return TvMediaCardDesign.ageRestrictionAsset;
  }

  return null;
}

const _blindTypeAbroad = 'ABROAD';
