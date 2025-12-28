import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../live/model/live_detail.dart';
import '../../live/repository/live_repository_wrapper.dart';

part 'channel_live_controller.g.dart';

@riverpod

/// Get current selected channel's live if the streamer is broadcasting.
///
/// Uses Result pattern via [LiveRepositoryWrapper] for proper error handling.
class ChannelLiveController extends _$ChannelLiveController {
  @override
  FutureOr<LiveDetail?> build({required String channelId}) async {
    return await _fetch();
  }

  Future<LiveDetail?> _fetch() async {
    final wrapper = ref.read(liveRepositoryWrapperProvider);
    final result = await wrapper.getLiveDetail(channelId: channelId);

    return result.when(
      success: (liveDetail) => liveDetail,
      failure: (exception) {
        // Log errors for debugging
        assert(() {
          // ignore: avoid_print
          print(
            'ChannelLiveController._fetch error: ${exception.message}',
          );
          return true;
        }());

        // Return null to indicate no live stream
        // (could be offline, error, or restricted)
        return null;
      },
    );
  }
}
