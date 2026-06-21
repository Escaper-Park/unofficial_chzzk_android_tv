part of 'channel_home_section.dart';

class _ChannelLiveRail extends StatelessWidget {
  const _ChannelLiveRail({
    required this.node,
    required this.up,
    required this.down,
    required this.item,
    required this.autofocus,
    required this.onPressed,
  });

  final FocusScopeNode node;
  final FocusScopeNode up;
  final FocusScopeNode? down;
  final Live item;
  final bool autofocus;
  final ValueChanged<Live> onPressed;

  @override
  Widget build(BuildContext context) {
    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      downEnsureVisibleScope: down != null,
      child: _ChannelRailFrame(
        title: ChannelScreenString.liveNow,
        child: SizedBox(
          height: ChannelScreenDesign.liveRailHeight,
          child: Padding(
            padding: TvRailDesign.padding,
            child: Align(
              alignment: Alignment.centerLeft,
              child: SizedBox(
                width: ChannelScreenDesign.liveRailItemExtent,
                child: ChannelLiveCard(
                  item: item,
                  autofocus: autofocus,
                  onPressed: () => onPressed(item),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class _ChannelVodRail extends StatelessWidget {
  const _ChannelVodRail({
    required this.node,
    required this.up,
    required this.upFocusAlignment,
    required this.upEnsureVisible,
    required this.items,
    required this.autofocus,
    required this.onPressed,
  });

  final FocusScopeNode node;
  final FocusScopeNode up;
  final double? upFocusAlignment;
  final bool upEnsureVisible;
  final List<Vod> items;
  final bool autofocus;
  final ValueChanged<Vod> onPressed;

  @override
  Widget build(BuildContext context) {
    return _ChannelRailFrame(
      title: ChannelScreenString.latestVods,
      child: SizedBox(
        height: ChannelScreenDesign.mediaRailHeight,
        child: TvRail(
          node: node,
          up: up,
          upFocusAlignment: upFocusAlignment,
          upEnsureVisible: upEnsureVisible,
          upEnsureVisibleScope: upEnsureVisible,
          itemCount: items.length,
          itemExtent: ChannelScreenDesign.mediaRailItemExtent,
          hasMore: false,
          itemBuilder: (context, index) {
            final item = items[index];
            return VodCard(
              item: item,
              watchProgressSeconds: item.watchTimeline,
              autofocus: autofocus && index == 0,
              onPressed: () => onPressed(item),
            );
          },
        ),
      ),
    );
  }
}

class _ChannelRailFrame extends StatelessWidget {
  const _ChannelRailFrame({
    required this.title,
    required this.child,
  });

  final String title;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: ChannelScreenDesign.contentHorizontalPadding,
          ),
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: ChannelScreenDesign.sectionTitleStyle(context),
          ),
        ),
        const SizedBox(height: ChannelScreenDesign.sectionTitleBottomGap),
        child,
      ],
    );
  }
}
