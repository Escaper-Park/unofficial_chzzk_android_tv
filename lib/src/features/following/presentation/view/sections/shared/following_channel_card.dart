import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/tv/input/input.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/following_feed.dart';
import '../../../following_screen_design.dart';
import 'following_count_formatter.dart';

part 'following_channel_card_content.dart';
part 'following_channel_card_frame.dart';

class FollowingChannelCard extends HookWidget {
  const FollowingChannelCard({
    super.key,
    required this.item,
    required this.focusNode,
    required this.anchorLink,
    required this.onPressed,
    this.autofocus = false,
  });

  final FollowingChannel item;
  final FocusNode focusNode;
  final LayerLink anchorLink;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final focused = focusNode.hasFocus;
    final design = FollowingScreenDesign.channelCardDesign();

    void activate() {
      activationGuard.run(onPressed);
    }

    return CompositedTransformTarget(
      link: anchorLink,
      child: CallbackShortcuts(
        bindings: {
          const SingleActivator(LogicalKeyboardKey.select): activate,
          const SingleActivator(LogicalKeyboardKey.enter): activate,
          const SingleActivator(LogicalKeyboardKey.numpadEnter): activate,
        },
        child: AnimatedScale(
          scale: focused ? design.focusedScale : 1,
          duration: const Duration(milliseconds: 120),
          child: _FollowingChannelCardFrame(
            focused: focused,
            design: design,
            child: Focus(
              autofocus: autofocus,
              focusNode: focusNode,
              child: Semantics(
                button: true,
                onTap: activate,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: activate,
                  child: SizedBox(
                    width: TvCardWidth.six.value,
                    height: FollowingScreenDesign.channelCardHeight,
                    child: Stack(
                      children: [
                        Positioned.fill(child: _FollowingChannelCardBody(item)),
                        if (item.openLive) _LiveCountBadge(item: item),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
