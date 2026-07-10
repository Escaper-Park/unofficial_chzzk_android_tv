import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
    return _LiveOverlayRealtimeInfoView(
      snapshot: _LiveOverlayRealtimeInfoSnapshot.fromSlot(slot),
    );
  }
}

class LiveOverlayRealtimeInfoForSlot extends StatelessWidget {
  const LiveOverlayRealtimeInfoForSlot({
    super.key,
    required this.slotId,
  });

  final String slotId;

  @override
  Widget build(BuildContext context) {
    return BlocSelector<
      LivePlayerBloc,
      LivePlayerState,
      _LiveOverlayRealtimeInfoSnapshot?
    >(
      selector: (state) {
        final slot = state.slotById(slotId);
        return slot == null
            ? null
            : _LiveOverlayRealtimeInfoSnapshot.fromSlot(slot);
      },
      builder: (context, snapshot) {
        if (snapshot == null) {
          return const SizedBox.shrink();
        }

        return _LiveOverlayRealtimeInfoView(snapshot: snapshot);
      },
    );
  }
}

class _LiveOverlayRealtimeInfoView extends StatelessWidget {
  const _LiveOverlayRealtimeInfoView({
    required this.snapshot,
  });

  final _LiveOverlayRealtimeInfoSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    final openDate = snapshot.openDate;

    return LiveOverlayRealtimeInfoContent(
      tags: buildLiveTagBadges(
        categoryValue: snapshot.categoryValue,
        watchPartyTag: snapshot.watchPartyTag,
        watchPartyType: snapshot.watchPartyType,
        tags: snapshot.tags,
      ),
      viewerCountText: LivePlayerScreenUiMapper.viewerCountText(
        snapshot.concurrentUserCount,
      ),
      elapsed: openDate == null || openDate.isEmpty
          ? null
          : _LiveOverlayElapsedText(openDate: openDate),
    );
  }
}

@immutable
final class _LiveOverlayRealtimeInfoSnapshot {
  const _LiveOverlayRealtimeInfoSnapshot({
    required this.categoryValue,
    required this.watchPartyTag,
    required this.watchPartyType,
    required this.tags,
    required this.concurrentUserCount,
    required this.openDate,
  });

  factory _LiveOverlayRealtimeInfoSnapshot.fromSlot(
    LivePlayerSlotState slot,
  ) {
    return _LiveOverlayRealtimeInfoSnapshot(
      categoryValue: slot.categoryValue,
      watchPartyTag: slot.watchPartyTag,
      watchPartyType: slot.watchPartyType,
      tags: slot.tags,
      concurrentUserCount: slot.concurrentUserCount,
      openDate: slot.openDate,
    );
  }

  final String? categoryValue;
  final String? watchPartyTag;
  final String? watchPartyType;
  final List<String> tags;
  final int? concurrentUserCount;
  final String? openDate;

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        other is _LiveOverlayRealtimeInfoSnapshot &&
            other.categoryValue == categoryValue &&
            other.watchPartyTag == watchPartyTag &&
            other.watchPartyType == watchPartyType &&
            listEquals(other.tags, tags) &&
            other.concurrentUserCount == concurrentUserCount &&
            other.openDate == openDate;
  }

  @override
  int get hashCode => Object.hash(
    categoryValue,
    watchPartyTag,
    watchPartyType,
    Object.hashAll(tags),
    concurrentUserCount,
    openDate,
  );
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
