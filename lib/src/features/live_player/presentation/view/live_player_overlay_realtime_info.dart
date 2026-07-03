import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../../../live/presentation/view/shared/live_tag_badges.dart';
import '../../../player_shared/presentation/overlay_controls/tv_player_overlay_controls_design.dart';
import '../bloc/live_player_bloc.dart';
import '../live_player_screen_ui_mapper.dart';
import 'live_overlay_now_ticker.dart';
import 'live_player_overlay_realtime_info_content.dart';

class LiveOverlayRealtimeInfo extends StatelessWidget {
  const LiveOverlayRealtimeInfo({
    super.key,
    required this.slot,
  });

  final LivePlayerSlotState slot;

  @override
  Widget build(BuildContext context) {
    final openDate = slot.openDate;

    return LiveOverlayRealtimeInfoContent(
      tags: buildLiveTagBadges(
        categoryValue: slot.categoryValue,
        watchPartyTag: slot.watchPartyTag,
        watchPartyType: slot.watchPartyType,
        tags: slot.tags,
      ),
      viewerCountText: LivePlayerScreenUiMapper.viewerCountText(
        slot.concurrentUserCount,
      ),
      elapsed: openDate == null || openDate.isEmpty
          ? null
          : _LiveOverlayElapsedText(openDate: openDate),
    );
  }
}

class _LiveOverlayElapsedText extends HookWidget {
  const _LiveOverlayElapsedText({
    required this.openDate,
  });

  final String? openDate;

  @override
  Widget build(BuildContext context) {
    final now = useLiveOverlayNowTicker();

    return Text(
      LivePlayerScreenUiMapper.elapsedText(
            openDate: openDate,
            now: now,
          ) ??
          '',
      maxLines: 1,
      overflow: TextOverflow.ellipsis,
      textAlign: TextAlign.right,
      style: TvPlayerOverlayControlsDesign.infoTextStyle(context),
    );
  }
}
