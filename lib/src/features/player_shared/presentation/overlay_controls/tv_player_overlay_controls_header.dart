part of 'tv_player_overlay_controls.dart';

class _TvPlayerOverlayHeader extends StatelessWidget {
  const _TvPlayerOverlayHeader({
    required this.channelName,
    required this.channelVerified,
    required this.title,
    required this.actions,
    required this.actionsSectionNode,
    required this.actionsSectionDown,
  });

  final String channelName;
  final bool channelVerified;
  final String title;
  final List<Widget> actions;
  final FocusScopeNode? actionsSectionNode;
  final FocusScopeNode? actionsSectionDown;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: TvPlayerOverlayControlsDesign.topRowHeight,
      child: Row(
        children: [
          _TvPlayerOverlayTitleBlock(
            channelName: channelName,
            channelVerified: channelVerified,
            title: title,
          ),
          const SizedBox(
            width: TvPlayerOverlayControlsDesign.headerActionsGap,
          ),
          _PlayerOverlaySection(
            node: actionsSectionNode,
            down: actionsSectionDown,
            child: _TvPlayerOverlayActions(actions: actions),
          ),
        ],
      ),
    );
  }
}

class _TvPlayerOverlayTitleBlock extends StatelessWidget {
  const _TvPlayerOverlayTitleBlock({
    required this.channelName,
    required this.channelVerified,
    required this.title,
  });

  final String channelName;
  final bool channelVerified;
  final String title;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TvPlayerOverlayControlsDesign.headerWidth,
      height: TvPlayerOverlayControlsDesign.topRowHeight,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: TvPlayerOverlayControlsDesign.channelNameHeight,
            child: Align(
              alignment: Alignment.centerLeft,
              child: TvMediaChannelName(
                channelName: channelName,
                verified: channelVerified,
                style: TvPlayerOverlayControlsDesign.channelNameTextStyle(
                  context,
                ),
              ),
            ),
          ),
          const SizedBox(height: TvPlayerOverlayControlsDesign.titleGap),
          SizedBox(
            height: TvPlayerOverlayControlsDesign.titleHeight,
            child: Text(
              title.replaceAll('\n', ' '),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: TvPlayerOverlayControlsDesign.titleTextStyle(context),
            ),
          ),
        ],
      ),
    );
  }
}

class _PlayerOverlaySection extends StatelessWidget {
  const _PlayerOverlaySection({
    required this.child,
    this.node,
    this.up,
    this.down,
  });

  final Widget child;
  final FocusScopeNode? node;
  final FocusScopeNode? up;
  final FocusScopeNode? down;

  @override
  Widget build(BuildContext context) {
    final node = this.node;
    if (node == null) {
      return child;
    }

    return TvFocusSection.list(
      node: node,
      up: up,
      down: down,
      child: child,
    );
  }
}

class _TvPlayerOverlayActions extends StatelessWidget {
  const _TvPlayerOverlayActions({
    required this.actions,
  });

  final List<Widget> actions;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: TvPlayerOverlayControlsDesign.actionsWidth,
      height: TvPlayerOverlayControlsDesign.topRowHeight,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Row(
          mainAxisSize: MainAxisSize.min,
          spacing: TvPlayerOverlayControlsDesign.actionGap,
          children: actions,
        ),
      ),
    );
  }
}
