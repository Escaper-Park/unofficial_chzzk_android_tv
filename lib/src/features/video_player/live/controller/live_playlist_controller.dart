import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../live/model/live.dart';
import '../widgets/util/wakelock_monitor_controller.dart';
import 'live_player_controller.dart';

part 'live_playlist_controller.g.dart';

@Riverpod(keepAlive: true)
class LivePlaylistController extends _$LivePlaylistController {
  @override
  List<LiveDetail> build() {
    return [];
  }

  bool checkIsContains({required LiveDetail liveDetail}) {
    final bool isContains =
        state.any((e) => e.channel.channelId == liveDetail.channel.channelId);

    return isContains;
  }

  void changeSource({
    required int index,
    required LiveDetail liveDetail,
  }) {
    // change wakelock state
    ref
        .read(wakelockMonitorControllerProvider.notifier)
        .setWakelockEnable(index);

    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) liveDetail else state[i]
    ];
  }

  void addLive({required LiveDetail liveDetail}) {
    // check redundancy for multiview
    final isContains = checkIsContains(liveDetail: liveDetail);
    if (isContains) return;

    // add wakelock state
    ref.read(wakelockMonitorControllerProvider.notifier).addState();

    state = [...state, liveDetail];
  }

  void removeLast() {
    final liveCount = getLiveCount();
    if (liveCount > 1) {
      ref
          .read(
              singleLivePlayerControllerProvider(index: liveCount - 1).notifier)
          .dispose();

      final newList = state.sublist(0, liveCount - 1);

      // remove last wakelock state
      ref.read(wakelockMonitorControllerProvider.notifier).removeLast();

      state = [...newList];
    }
  }

  void reset() {
    state = [];
  }

  void changeToSingleView() {
    final currentActivatedSourceIndex =
        ref.read(currentActivatedAudioSourceIndexProvider);
    final activetedLiveDetail = state[currentActivatedSourceIndex];

    for (int i = 0; i < state.length; i++) {
      // current activated source to main
      if (i == currentActivatedSourceIndex) {
        changeSource(index: 0, liveDetail: activetedLiveDetail);
      }
      // dispose others
      ref.read(singleLivePlayerControllerProvider(index: i).notifier).dispose();
    }

    ref
        .read(singleLivePlayerControllerProvider(index: 0).notifier)
        .changeSource();

    state = [state.first];
  }

  int getLiveCount() => state.length;
}

@riverpod
class CurrentActivatedLiveIndex extends _$CurrentActivatedLiveIndex {
  @override
  int? build() {
    return null;
  }

  void reset() {
    state = null;
  }

  void setFocusScreenIndex(int index) {
    // equal
    if (state == index) {
      state = null;
    }
    // focused
    else {
      state = index;
    }
  }
}

@riverpod
class CurrentActivatedAudioSourceIndex
    extends _$CurrentActivatedAudioSourceIndex {
  @override
  int build() {
    return 0;
  }

  void setAudioSource(int index) {
    state = index;
  }

  void reset() {
    state = 0;
  }
}
