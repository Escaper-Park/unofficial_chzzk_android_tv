import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/dio/dio_client.dart';
import '../../live_stream/controller/live_mode_controller.dart';
import '../../live_stream/controller/live_playlist_controller.dart';
import '../model/live_detail.dart';
import '../model/live_status.dart';
import '../repository/live_repository.dart';

part 'live_controller.g.dart';

@riverpod
class LiveController extends _$LiveController {
  late LiveRepository _liveRepository;
  late LiveStatusRepository _statusRepository;

  @override
  void build() {
    final Dio dio = ref.watch(dioClientProvider);
    _liveRepository = LiveRepository(dio);
    _statusRepository = LiveStatusRepository(dio);

    return;
  }

  Future<void> addLiveToPlaylist({required LiveDetail liveDetail}) async {
    ref.read(livePlaylistControllerProvider.notifier).reset();
    ref.read(liveModeControllerProvider.notifier).reset();

    // add playlist
    ref
        .read(livePlaylistControllerProvider.notifier)
        .addLive(liveDetail: liveDetail);
  }

  /// Get live detail to play a live stream.
  Future<LiveDetail?> getLiveDetail({required String channelId}) async {
    return await _liveRepository.getLiveDetail(channelId: channelId);
  }

  /// Get [LiveStatus] while watching a live stream.
  Future<LiveStatus?> getLiveStatus({required String channelId}) async {
    return await _statusRepository.getLiveStatus(
      channelId: channelId,
      includePlayerRecommendContent: false,
    );
  }
}
