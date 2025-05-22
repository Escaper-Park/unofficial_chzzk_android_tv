import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../live/controller/live_controller.dart';
import '../../live/model/live_status.dart';
import 'live_playlist_controller.dart';

part 'live_stream_status_controller.g.dart';

@riverpod
class LiveStreamStatusController extends _$LiveStreamStatusController {
  @override
  FutureOr<List<LiveStatus?>?> build() async {
    return await _fetch();
  }

  Future<List<LiveStatus?>?> _fetch() async {
    final liveDetails = ref.read(livePlaylistControllerProvider);

    final futures = liveDetails.map(
      (detail) {
        return ref
            .read(liveControllerProvider.notifier)
            .getLiveStatus(channelId: detail.channel.channelId);
      },
    );

    final List<LiveStatus?> statusList = await Future.wait(futures);

    return statusList;
  }
}
