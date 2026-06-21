import 'package:flutter/widgets.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

import '../bloc/live_player_bloc.dart';
import '../live_player_screen_ui_mapper.dart';
import 'live_overlay_now_ticker.dart';
import 'live_player_overlay_realtime_info_content.dart';

class LiveOverlayRealtimeInfo extends HookWidget {
  const LiveOverlayRealtimeInfo({
    super.key,
    required this.slot,
  });

  final LivePlayerSlotState slot;

  @override
  Widget build(BuildContext context) {
    final now = useLiveOverlayNowTicker();

    return LiveOverlayRealtimeInfoContent(
      tags: slot.tags,
      viewerCountText: LivePlayerScreenUiMapper.viewerCountText(
        slot.concurrentUserCount,
      ),
      elapsedText: LivePlayerScreenUiMapper.elapsedText(
        openDate: slot.openDate,
        now: now,
      ),
    );
  }
}
