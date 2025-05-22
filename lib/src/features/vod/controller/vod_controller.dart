import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../common/constants/api.dart';
import '../../../utils/dio/dio_client.dart';
import '../../auth/controller/auth_controller.dart';
import '../../vod_stream/controller/vod_playlist_controller.dart';
import '../model/vod.dart';
import '../repository/vod_repository.dart';

part 'vod_controller.g.dart';

// vod and vod path

@riverpod
class VodController extends _$VodController {
  late VodRepository _repository;

  @override
  void build() {
    final Dio dio = ref.watch(dioClientProvider);
    _repository = VodRepository(dio);
    return;
  }

  Future<bool> addVodToPlaylist({required int videoNo}) async {
    final vodPlay = await _getVodPlay(videoNo: videoNo);
    // reset vod playlist
    ref.read(vodPlaylistControllerProvider.notifier).reset();

    if (vodPlay == null) return false;

    // add video to playlist
    ref.read(vodPlaylistControllerProvider.notifier).setVod(vodPlay: vodPlay);

    return true;
  }

  Future<Vod?> _getVodDetail({required int videoNo}) async {
    return await _repository.getVodDetail(videoNo: videoNo);
  }

  Future<VodPlay?> _getVodPlay({required int videoNo}) async {
    final Vod? vod = await _getVodDetail(videoNo: videoNo);

    if (vod == null) return null;

    // Don't use repository for the unity of dio client.
    // This request doesn't use response.data['content'] so can't use dio interceptor.

    // classic
    if (vod.liveRewindPlaybackJson == null) {
      try {
        final cookies = ref.read(authControllerProvider.notifier).getCookie();
        final baseDio =
            ref.read(dioClientProvider.notifier).getBaseDio(cookies);

        final response = await baseDio.get(
          '${BaseUrl.vodPlayback}/${vod.videoId}',
          queryParameters: {
            'key': '${vod.inKey}',
            'sid': 2099,
            'devt': 'html5_pc',
            'st': 5,
            'lc': 'ko_KR',
            'cpl': 'ko_KR',
          },
        );

        final m3uAddress = response.data?['period'][0]['adaptationSet'][0]
            ['otherAttributes']['m3u'] as String;

        return (vod, m3uAddress);
      } catch (_) {
        return null;
      }
    }
    // new (maybe the streamer used the time machine function)
    else {
      return (vod, vod.liveRewindPlaybackJson!.media.first.path);
    }
  }
}
