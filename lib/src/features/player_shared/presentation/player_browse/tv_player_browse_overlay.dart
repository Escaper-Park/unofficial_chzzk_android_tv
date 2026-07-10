import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/components/cards/cards.dart';
import '../../../../core/ui/composites/rails/rails.dart';
import 'tv_player_browse_message.dart';
import 'tv_player_browse_overlay_design.dart';
import 'tv_player_browse_string.dart';

part 'tv_player_browse_overlay_band.dart';
part 'tv_player_browse_overlay_header.dart';
part 'tv_player_browse_overlay_placeholder.dart';

typedef TvPlayerBrowseItemBuilder =
    Widget Function(BuildContext context, int index);

class TvPlayerBrowseOverlay extends StatelessWidget {
  const TvPlayerBrowseOverlay({
    super.key,
    required this.node,
    required this.title,
    required this.itemCount,
    required this.itemBuilder,
    this.cardWidth = TvCardWidth.four,
    this.up,
    this.down,
    this.controller,
    this.placeholder,
    this.placeholderFocusNode,
    this.onInteraction,
    this.onUp,
    this.onDown,
    this.onFocusedTail,
    this.hasMore = true,
    this.isLoadingMore = false,
    this.tailItemThreshold = 6,
  }) : assert(itemCount >= 0),
       assert(tailItemThreshold > 0);

  final FocusScopeNode node;
  final String title;
  final int itemCount;
  final TvPlayerBrowseItemBuilder itemBuilder;
  final TvCardWidth cardWidth;
  final FocusScopeNode? up;
  final FocusScopeNode? down;
  final ScrollController? controller;
  final Widget? placeholder;
  final FocusNode? placeholderFocusNode;
  final VoidCallback? onInteraction;
  final VoidCallback? onUp;
  final VoidCallback? onDown;
  final VoidCallback? onFocusedTail;
  final bool hasMore;
  final bool isLoadingMore;
  final int tailItemThreshold;

  @override
  Widget build(BuildContext context) {
    return Focus(
      canRequestFocus: false,
      skipTraversal: true,
      onKeyEvent: (_, event) {
        if (event is KeyDownEvent || event is KeyRepeatEvent) {
          onInteraction?.call();
        }

        if (event is! KeyDownEvent && event is! KeyRepeatEvent) {
          return KeyEventResult.ignored;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowUp && onUp != null) {
          if (event is KeyDownEvent) {
            onUp!();
          }
          return KeyEventResult.handled;
        }

        if (event.logicalKey == LogicalKeyboardKey.arrowDown &&
            onDown != null) {
          if (event is KeyDownEvent) {
            onDown!();
          }
          return KeyEventResult.handled;
        }

        return KeyEventResult.ignored;
      },
      child: _TvPlayerBrowseBand(
        node: node,
        title: title,
        itemCount: itemCount,
        itemBuilder: itemBuilder,
        cardWidth: cardWidth,
        up: up,
        down: down,
        controller: controller,
        placeholder: placeholder,
        placeholderFocusNode: placeholderFocusNode,
        onFocusedTail: onFocusedTail,
        hasMore: hasMore,
        isLoadingMore: isLoadingMore,
        tailItemThreshold: tailItemThreshold,
      ),
    );
  }
}
