import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../live/model/live_detail.dart';
import 'live_player_controller.dart';

part 'live_playlist_controller.g.dart';

@Riverpod(keepAlive: true)
class LivePlaylistController extends _$LivePlaylistController {
  @override
  List<LiveDetail> build() {
    return [];
  }

  int getLiveCount() => state.length;

  bool checkIsContains({required LiveDetail liveDetail}) {
    final bool isContains = state.any(
      (live) => live.channel.channelId == liveDetail.channel.channelId,
    );

    return isContains;
  }

  void changeSourceByIndex({
    required int index,
    required LiveDetail liveDetail,
  }) {
    state = [
      for (int i = 0; i < state.length; i++)
        if (i == index) liveDetail else state[i],
    ];
  }

  // for multiview
  void addLive({required LiveDetail liveDetail}) {
    // check redundancy
    final isContains = checkIsContains(liveDetail: liveDetail);
    if (isContains) return;

    state = [...state, liveDetail];
  }

  // for multiview
  Future<void> removeLastIndexLive() async {
    final liveCount = getLiveCount();
    if (liveCount > 1) {
      await ref
          .read(livePlayerControllerProvider(index: liveCount - 1).notifier)
          .dispose();

      final newList = state.sublist(0, liveCount - 1);

      state = [...newList];
    }
  }

  void reset() {
    state = [];
  }

  Future<void> changeToSingleView() async {
    final liveCount = getLiveCount();

    if (liveCount > 1) {
      final currentActivatedAudioIndex =
          ref.read(currentActivatedAudioControllerProvider);

      final activatedLiveDetail = state[currentActivatedAudioIndex];

      if (currentActivatedAudioIndex >= 0 &&
          currentActivatedAudioIndex < state.length) {
        changeSourceByIndex(index: 0, liveDetail: activatedLiveDetail);
      }

      for (int i = 1; i < state.length; i++) {
        // final future =
        ref.read(livePlayerControllerProvider(index: i).notifier).dispose();
      }
    }

    ref.read(livePlayerControllerProvider(index: 0).notifier).changeSource();

    state = [state.first];
  }
}

@riverpod
class CurrentActivatedLiveController extends _$CurrentActivatedLiveController {
  @override
  int? build() {
    return null;
  }

  void reset() {
    state = null;
  }

  void setFocusedScreenIndex(int index) {
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
class CurrentActivatedAudioController
    extends _$CurrentActivatedAudioController {
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
