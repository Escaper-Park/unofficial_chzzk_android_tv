import 'package:flutter/material.dart';

import '../../../../core/tv/focus/focus.dart';
import '../../../../core/ui/composites/media_cards/media_cards.dart';
import 'tv_player_overlay_controls_design.dart';

export 'tv_player_overlay_action.dart';

part 'tv_player_overlay_controls_header.dart';

class TvPlayerOverlayControls extends StatelessWidget {
  const TvPlayerOverlayControls({
    super.key,
    required this.channelName,
    required this.title,
    required this.actions,
    required this.playbackInfo,
    this.channelVerified = false,
    this.actionsSectionNode,
    this.actionsSectionDown,
    this.playbackInfoSectionNode,
    this.playbackInfoSectionUp,
  });

  final String channelName;
  final bool channelVerified;
  final String title;
  final List<Widget> actions;
  final Widget playbackInfo;
  final FocusScopeNode? actionsSectionNode;
  final FocusScopeNode? actionsSectionDown;
  final FocusScopeNode? playbackInfoSectionNode;
  final FocusScopeNode? playbackInfoSectionUp;

  @override
  Widget build(BuildContext context) {
    return TvPlayerOverlayFrame(
      child: Column(
        children: [
          _TvPlayerOverlayHeader(
            channelName: channelName,
            channelVerified: channelVerified,
            title: title,
            actions: actions,
            actionsSectionNode: actionsSectionNode,
            actionsSectionDown: actionsSectionDown,
          ),
          const SizedBox(
            height: TvPlayerOverlayControlsDesign.rowGap,
          ),
          SizedBox(
            height: TvPlayerOverlayControlsDesign.bottomRowHeight,
            child: _PlayerOverlaySection(
              node: playbackInfoSectionNode,
              up: playbackInfoSectionUp,
              child: playbackInfo,
            ),
          ),
        ],
      ),
    );
  }
}

class TvPlayerOverlayFrame extends StatelessWidget {
  const TvPlayerOverlayFrame({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        width: double.infinity,
        height: TvPlayerOverlayControlsDesign.bandHeight,
        child: ColoredBox(
          color: TvPlayerOverlayControlsDesign.backgroundColor,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              vertical: TvPlayerOverlayControlsDesign.verticalMargin,
            ),
            child: Center(
              child: SizedBox(
                width: TvPlayerOverlayControlsDesign.containerWidth,
                height: TvPlayerOverlayControlsDesign.containerHeight,
                child: child,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
