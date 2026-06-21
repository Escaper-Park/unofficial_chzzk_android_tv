import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../../../../core/tv/input/input.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../domain/entities/search_results.dart';
import '../../../search_results_screen_design.dart';
import '../../../search_results_screen_string.dart';
import 'search_results_channel_card_formatters.dart';

class SearchResultsChannelCard extends HookWidget {
  const SearchResultsChannelCard({
    super.key,
    required this.item,
    required this.onPressed,
    this.autofocus = false,
  });

  final SearchChannelResult item;
  final VoidCallback onPressed;
  final bool autofocus;

  @override
  Widget build(BuildContext context) {
    final channel = item.channel!;
    final focusNode = useFocusNode();
    final activationGuard = useMemoized(TvActivationGuard.new);
    useListenable(focusNode);

    final focused = focusNode.hasFocus;
    final design = TvCardDesign.defaults(
      backgroundColor: TvMediaCardDesign.cardBackgroundColor,
      focusedScale: TvFocusedScale.standard,
      focusedElevation: TvCardElevation.level2,
    );

    void activate() {
      activationGuard.run(onPressed);
    }

    return AnimatedScale(
      scale: focused ? design.focusedScale : 1,
      duration: const Duration(milliseconds: 120),
      child: Card(
        margin: EdgeInsets.zero,
        color: design.backgroundColor,
        elevation: focused ? design.focusedElevation : 0,
        surfaceTintColor: Colors.transparent,
        shape: RoundedRectangleBorder(borderRadius: design.radius),
        clipBehavior: Clip.antiAlias,
        child: Stack(
          fit: StackFit.passthrough,
          children: [
            InkWell(
              autofocus: autofocus,
              focusNode: focusNode,
              customBorder: RoundedRectangleBorder(
                borderRadius: design.radius,
              ),
              overlayColor: const WidgetStatePropertyAll(Colors.transparent),
              splashFactory: NoSplash.splashFactory,
              onTap: activate,
              child: SizedBox(
                width: SearchResultsScreenDesign.channelCardWidth.value,
                height: SearchResultsScreenDesign.channelCardHeight,
                child: Padding(
                  padding: SearchResultsScreenDesign.channelCardPadding,
                  child: Row(
                    children: [
                      ProfileCircleAvatar(
                        imageUrl: channel.channelImageUrl,
                        radius:
                            SearchResultsScreenDesign.channelCardAvatarRadius,
                        openLive: channel.openLive,
                      ),
                      const SizedBox(
                        width: SearchResultsScreenDesign.channelCardContentGap,
                      ),
                      Expanded(
                        child: _SearchResultsChannelInfo(channel: channel),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            if (focused && design.focusOutlineWidth > 0)
              Positioned.fill(
                child: IgnorePointer(
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      borderRadius: design.radius,
                      border: Border.all(
                        color: design.focusOutlineColor,
                        width: design.focusOutlineWidth,
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

class _SearchResultsChannelInfo extends StatelessWidget {
  const _SearchResultsChannelInfo({
    required this.channel,
  });

  final SearchChannel channel;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final textTheme = Theme.of(context).textTheme;
    final channelName = channel.channelName.isEmpty
        ? SearchResultsScreenString.fallbackChannelName
        : channel.channelName;

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Flexible(
              child: Text(
                channelName,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: textTheme.titleSmall?.copyWith(
                  color: colorScheme.onSurface,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            if (channel.verifiedMark) ...[
              const SizedBox(
                width: SearchResultsScreenDesign.verifiedMarkGap,
              ),
              const TvMediaVerifiedMark(
                size: SearchResultsScreenDesign.verifiedMarkSize,
              ),
            ],
          ],
        ),
        const SizedBox(height: SearchResultsScreenDesign.channelCardMetaTopGap),
        Text(
          formatSearchResultFollowerCount(channel.followerCount),
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: textTheme.bodySmall?.copyWith(
            color: colorScheme.onSurface.withValues(alpha: 0.7),
          ),
        ),
      ],
    );
  }
}
