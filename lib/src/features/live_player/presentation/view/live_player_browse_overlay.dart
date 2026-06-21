import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../core/ui/ui.dart';
import '../../../live/domain/entities/live_feed.dart';
import '../../../player_shared/presentation/player_browse/player_browse.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_string.dart';
import 'live_player_browse_card.dart';
import 'live_player_browse_placeholder.dart';
import 'live_player_replacement_slot_modal.dart';

class LivePlayerBrowseOverlay extends HookWidget {
  const LivePlayerBrowseOverlay({
    super.key,
    required this.state,
    required this.browseNode,
    required this.onInteraction,
    required this.onSectionUp,
    required this.onSectionDown,
    required this.onLoadMore,
    required this.onFallbackPressed,
    required this.onLiveSelected,
    required this.onReplacementClosed,
    required this.onReplacementSlotSelected,
  });

  final LivePlayerState state;
  final FocusScopeNode browseNode;
  final VoidCallback onInteraction;
  final VoidCallback onSectionUp;
  final VoidCallback onSectionDown;
  final VoidCallback onLoadMore;
  final VoidCallback onFallbackPressed;
  final ValueChanged<Live> onLiveSelected;
  final VoidCallback onReplacementClosed;
  final ValueChanged<String> onReplacementSlotSelected;

  @override
  Widget build(BuildContext context) {
    final placeholderFocusNode = useFocusNode(
      debugLabel: 'live player browse placeholder',
    );
    final showCards =
        state.browseStatus == LivePlayerBrowseLoadStatus.success &&
        state.browseItems.isNotEmpty;
    final fallbackAction = state.browseFallbackAction;

    return Stack(
      fit: StackFit.expand,
      children: [
        TvPlayerBrowseOverlay(
          node: browseNode,
          title: LivePlayerScreenString.browseSectionTitle(
            state.browseSection,
          ),
          itemCount: showCards ? state.browseItems.length : 0,
          cardWidth: TvCardWidth.four,
          onInteraction: onInteraction,
          onUp: onSectionUp,
          onDown: onSectionDown,
          onFocusedTail: onLoadMore,
          hasMore: state.browseHasMore,
          isLoadingMore: state.browseLoadingMore,
          placeholder: LivePlayerBrowsePlaceholder(
            section: state.browseSection,
            status: state.browseStatus,
            fallbackAction: fallbackAction,
            onFallbackPressed: onFallbackPressed,
          ),
          placeholderFocusNode:
              fallbackAction == LivePlayerBrowseFallbackAction.none
              ? placeholderFocusNode
              : null,
          itemBuilder: (context, index) {
            final live = state.browseItems[index];
            return LivePlayerBrowseCard(
              live: live,
              autofocus: index == 0,
              onPressed: () => onLiveSelected(live),
            );
          },
        ),
        if (state.pendingReplacementLive != null)
          LivePlayerReplacementSlotModal(
            slots: state.slots,
            activeSlotId: state.activeSlotId,
            onDismiss: onReplacementClosed,
            onSlotSelected: onReplacementSlotSelected,
          ),
      ],
    );
  }
}
