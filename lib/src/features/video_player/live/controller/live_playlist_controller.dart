import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../live/model/live.dart';
import '../../../live/model/live_stream.dart';

part 'live_playlist_controller.g.dart';

@Riverpod(keepAlive: true)
class LivePlaylistController extends _$LivePlaylistController {
  @override
  List<LiveStream> build() {
    return [];
  }

  void addLive({required LiveStream liveStream}) {
    // Check redundancy
    final bool isContains = state.any((data) =>
        data.liveDetail.channel.channelId ==
        liveStream.liveDetail.channel.channelId);

    if (isContains) {
      return;
    } else {
      state = [...state, liveStream];
    }
  }

  void removeLive(LiveDetail liveDetail) {
    final newlist = state
        .where(
          (item) =>
              item.liveDetail.channel.channelId != liveDetail.channel.channelId,
        )
        .toList();

    state = [...newlist];
  }

  void reset() {
    state = [];
  }

  void changeToSingleView() {
    state = [state.first];
  }

  int getLiveCount() => state.length;
}

/// To controll screen size
@riverpod
class CurrentSelectedLiveStream extends _$CurrentSelectedLiveStream {
  @override
  int? build() {
    return null;
  }
}
