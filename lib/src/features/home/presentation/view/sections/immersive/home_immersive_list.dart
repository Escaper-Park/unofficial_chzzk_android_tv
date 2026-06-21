import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../../../../core/design/design.dart';
import '../../../../../../core/tv/input/input.dart';
import '../../../../../../core/ui/components/buttons/buttons.dart';
import '../../../../../../core/ui/components/primitives/primitives.dart';
import '../../../../../../core/ui/composites/media_cards/tv_media_channel_name.dart';
import 'home_immersive_list_design.dart';

part 'home_immersive_list_content.dart';
part 'home_immersive_list_stack.dart';
part 'home_immersive_list_metadata.dart';
part 'home_immersive_list_background.dart';
part 'home_immersive_progress_action.dart';

class HomeImmersiveItem {
  const HomeImmersiveItem({
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.actionLabel,
    this.channelVerified = false,
    this.badges = const [],
    this.contentTags = const [],
  });

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String actionLabel;
  final bool channelVerified;
  final List<String> badges;
  final List<String> contentTags;
}

class HomeImmersiveList extends StatefulWidget {
  const HomeImmersiveList({
    super.key,
    required this.items,
    required this.activeIndex,
    required this.onActiveIndexChanged,
    required this.onActionPressed,
    this.actionAutofocus = false,
    this.actionFocusNode,
    this.actionProgress,
    this.previewPlaying = false,
    this.showBackground = true,
  });

  final List<HomeImmersiveItem> items;
  final int activeIndex;
  final ValueChanged<int> onActiveIndexChanged;
  final VoidCallback onActionPressed;
  final bool actionAutofocus;
  final FocusNode? actionFocusNode;
  final double? actionProgress;
  final bool previewPlaying;
  final bool showBackground;

  @override
  State<HomeImmersiveList> createState() => _HomeImmersiveListState();
}

class _HomeImmersiveListState extends State<HomeImmersiveList> {
  var _metadataTransitionDirection = 1;

  @override
  void didUpdateWidget(HomeImmersiveList oldWidget) {
    super.didUpdateWidget(oldWidget);

    final oldIndex = _effectiveIndex(
      items: oldWidget.items,
      activeIndex: oldWidget.activeIndex,
    );
    final newIndex = _effectiveIndex(
      items: widget.items,
      activeIndex: widget.activeIndex,
    );

    if (oldIndex == newIndex) {
      return;
    }

    _metadataTransitionDirection = _indexChangeDirection(
      oldIndex: oldIndex,
      newIndex: newIndex,
      itemCount: widget.items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.items.isEmpty) {
      return const SizedBox.shrink();
    }

    final effectiveIndex = _effectiveIndex(
      items: widget.items,
      activeIndex: widget.activeIndex,
    );
    final item = widget.items[effectiveIndex];

    return CallbackShortcuts(
      bindings: {
        const SingleActivator(LogicalKeyboardKey.arrowLeft): () {
          _move(delta: -1);
        },
        const SingleActivator(LogicalKeyboardKey.arrowRight): () {
          _move(delta: 1);
        },
      },
      child: _HomeImmersiveListStack(
        item: item,
        itemIndex: effectiveIndex,
        itemCount: widget.items.length,
        metadataTransitionDirection: _metadataTransitionDirection,
        onActionPressed: widget.onActionPressed,
        actionAutofocus: widget.actionAutofocus,
        actionFocusNode: widget.actionFocusNode,
        actionProgress: widget.actionProgress,
        previewPlaying: widget.previewPlaying,
        showBackground: widget.showBackground,
      ),
    );
  }

  void _move({required int delta}) {
    if (widget.items.length > 1) {
      setState(() {
        _metadataTransitionDirection = delta.sign;
      });
    }

    widget.onActiveIndexChanged(
      HomeImmersiveListDesign.wrappedIndex(
        currentIndex: widget.activeIndex,
        delta: delta,
        itemCount: widget.items.length,
      ),
    );
  }

  int _effectiveIndex({
    required List<HomeImmersiveItem> items,
    required int activeIndex,
  }) {
    if (items.isEmpty) {
      return 0;
    }

    return activeIndex.clamp(0, items.length - 1);
  }

  int _indexChangeDirection({
    required int oldIndex,
    required int newIndex,
    required int itemCount,
  }) {
    if (itemCount <= 1) {
      return _metadataTransitionDirection;
    }

    final forwardDistance = (newIndex - oldIndex) % itemCount;
    final backwardDistance = (oldIndex - newIndex) % itemCount;

    if (forwardDistance == 0) {
      return _metadataTransitionDirection;
    }

    return forwardDistance <= backwardDistance ? 1 : -1;
  }
}
