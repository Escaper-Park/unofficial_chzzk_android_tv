part of 'home_immersive_list.dart';

class _HomeImmersiveMetadata extends StatelessWidget {
  const _HomeImmersiveMetadata({
    required this.item,
    required this.itemIndex,
    required this.transitionDirection,
  });

  final HomeImmersiveItem item;
  final int itemIndex;
  final int transitionDirection;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: HomeImmersiveListDesign.statusBadgeHeight,
          child: Row(
            mainAxisSize: MainAxisSize.min,
            spacing: HomeImmersiveListDesign.statusBadgeGap,
            children: [
              for (var index = 0; index < item.badges.length; index += 1)
                _HomeImmersiveStatusBadge(
                  text: item.badges[index],
                  index: index,
                ),
            ],
          ),
        ),
        const SizedBox(height: HomeImmersiveListDesign.badgeTitleGap),
        _HomeImmersiveTitleSwitcher(
          item: item,
          itemIndex: itemIndex,
          transitionDirection: transitionDirection,
        ),
      ],
    );
  }
}

class _HomeImmersiveTitleSwitcher extends StatelessWidget {
  const _HomeImmersiveTitleSwitcher({
    required this.item,
    required this.itemIndex,
    required this.transitionDirection,
  });

  final HomeImmersiveItem item;
  final int itemIndex;
  final int transitionDirection;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: HomeImmersiveListDesign.titleSubtitleHeight,
      child: _HomeImmersiveAnimatedSwitcher(
        transitionDirection: transitionDirection,
        child: _HomeImmersiveTitle(
          key: ValueKey(_titleSignature(itemIndex: itemIndex, item: item)),
          item: item,
        ),
      ),
    );
  }
}

class _HomeImmersiveTitle extends StatelessWidget {
  const _HomeImmersiveTitle({
    super.key,
    required this.item,
  });

  final HomeImmersiveItem item;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TvMediaChannelName(
          channelName: item.title,
          verified: item.channelVerified,
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
            color: colorScheme.onSurface,
          ),
        ),
        const SizedBox(height: HomeImmersiveListDesign.titleSubtitleGap),
        Flexible(
          child: Text(
            item.subtitle,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(
              color: colorScheme.onSurface.withValues(alpha: 0.8),
            ),
          ),
        ),
      ],
    );
  }
}

class _HomeImmersiveTags extends StatelessWidget {
  const _HomeImmersiveTags({
    required this.tags,
  });

  final List<String> tags;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      spacing: HomeImmersiveListDesign.contentTagGap,
      children: [
        for (final tag in tags)
          TvTag(
            text: tag,
            size: TvTagSize.large,
            borderRadius: HomeImmersiveListDesign.contentTagBorderRadius,
          ),
      ],
    );
  }
}

class _HomeImmersiveAnimatedSwitcher extends StatelessWidget {
  const _HomeImmersiveAnimatedSwitcher({
    required this.child,
    required this.transitionDirection,
  });

  final Widget child;
  final int transitionDirection;

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: AnimatedSwitcher(
        duration: HomeImmersiveListDesign.metadataAnimationDuration,
        switchInCurve: Curves.easeOutCubic,
        switchOutCurve: Curves.easeInCubic,
        layoutBuilder: (currentChild, previousChildren) {
          return Stack(
            alignment: AlignmentDirectional.topStart,
            children: [
              ...previousChildren,
              ?currentChild,
            ],
          );
        },
        transitionBuilder: (child, animation) {
          final position = Tween<Offset>(
            begin: Offset(
              HomeImmersiveListDesign.metadataAnimationSlideOffset *
                  transitionDirection,
              0,
            ),
            end: Offset.zero,
          ).animate(animation);

          return FadeTransition(
            opacity: animation,
            child: SlideTransition(position: position, child: child),
          );
        },
        child: child,
      ),
    );
  }
}

class _HomeImmersiveStatusBadge extends StatelessWidget {
  const _HomeImmersiveStatusBadge({
    required this.text,
    required this.index,
  });

  final String text;
  final int index;

  @override
  Widget build(BuildContext context) {
    return TvTag(
      text: text,
      size: TvTagSize.large,
      backgroundColor: index == 0
          ? HomeImmersiveListDesign.statusLiveBadgeBackgroundColor
          : HomeImmersiveListDesign.statusViewerBadgeBackgroundColor,
      textColor: HomeImmersiveListDesign.statusBadgeTextColor,
      borderRadius: HomeImmersiveListDesign.statusBadgeBorderRadius,
    );
  }
}

int _titleSignature({
  required int itemIndex,
  required HomeImmersiveItem item,
}) {
  return Object.hash(
    itemIndex,
    item.title,
    item.subtitle,
    item.channelVerified,
  );
}
