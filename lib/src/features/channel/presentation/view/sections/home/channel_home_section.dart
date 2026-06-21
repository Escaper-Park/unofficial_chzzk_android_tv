import 'package:flutter/material.dart';

import '../../../../../../core/tv/focus/focus.dart';
import '../../../../../../core/ui/ui.dart';
import '../../../../../live/domain/entities/live_feed.dart';
import '../../../../../vod/domain/entities/vod_feed.dart';
import '../../../../../vod/presentation/view/shared/vod_card.dart';
import '../../../bloc/channel_bloc.dart';
import '../../../channel_screen_design.dart';
import '../../../channel_screen_string.dart';
import '../../../channel_screen_ui_mapper.dart';
import 'channel_live_card.dart';

part 'channel_home_section_rails.dart';
part 'channel_home_section_state.dart';

class ChannelHomeSection extends StatelessWidget {
  const ChannelHomeSection({
    super.key,
    required this.state,
    required this.stateNode,
    required this.liveNode,
    required this.latestVodNode,
    required this.tabsNode,
    required this.onRetry,
    required this.onLivePressed,
    required this.onVodPressed,
  });

  final ChannelState state;
  final FocusScopeNode stateNode;
  final FocusScopeNode liveNode;
  final FocusScopeNode latestVodNode;
  final FocusScopeNode tabsNode;
  final VoidCallback onRetry;
  final ValueChanged<Live> onLivePressed;
  final ValueChanged<Vod> onVodPressed;

  @override
  Widget build(BuildContext context) {
    if (state.homeStatus != ChannelLoadStatus.ready || !state.hasHomeContent) {
      return _ChannelHomeStateView(
        status: state.homeStatus,
        node: stateNode,
        tabsNode: tabsNode,
        onRetry: onRetry,
      );
    }

    final live = state.live;
    final latestVods = state.latestVods;

    return SingleChildScrollView(
      padding: const EdgeInsets.only(
        top: ChannelScreenDesign.gridFocusPaintPadding,
        bottom: ChannelScreenDesign.contentBottomGap,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (live != null)
            _ChannelLiveRail(
              node: liveNode,
              up: tabsNode,
              down: latestVods.isEmpty ? null : latestVodNode,
              item: live,
              autofocus: true,
              onPressed: onLivePressed,
            ),
          if (live != null && latestVods.isNotEmpty)
            const SizedBox(height: ChannelScreenDesign.sectionGap),
          if (latestVods.isNotEmpty)
            _ChannelVodRail(
              node: latestVodNode,
              up: live == null ? tabsNode : liveNode,
              upFocusAlignment: live == null
                  ? null
                  : ChannelScreenDesign.liveFocusAlignment,
              upEnsureVisible: live != null,
              items: latestVods,
              autofocus: live == null,
              onPressed: onVodPressed,
            ),
        ],
      ),
    );
  }
}
