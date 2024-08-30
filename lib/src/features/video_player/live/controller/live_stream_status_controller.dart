import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../live/controller/live_controller.dart';
import '../../../live/model/live.dart';

part 'live_stream_status_controller.g.dart';

@riverpod
class LiveStreamStatusController extends _$LiveStreamStatusController {
  @override
  FutureOr<LiveStatus?> build({required String channelId}) async {
    return await ref
        .read(liveControllerProvider.notifier)
        .getLiveStatus(channelId: channelId);
  }
}
