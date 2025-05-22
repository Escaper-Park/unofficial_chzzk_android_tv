import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../live/model/live_detail.dart';
import '../../live/repository/live_repository.dart';

part 'channel_live_controller.g.dart';

@riverpod

/// Get current selected channel's live if the streamer is broadcast.
class ChannelLiveController extends _$ChannelLiveController {
  late LiveRepository _repository;

  @override
  FutureOr<LiveDetail?> build({required String channelId}) async {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = LiveRepository(dio);

    return await _fetch();
  }

  Future<LiveDetail?> _fetch() async {
    final liveDetail = await _repository.getLiveDetail(channelId: channelId);

    return liveDetail;
  }
}
