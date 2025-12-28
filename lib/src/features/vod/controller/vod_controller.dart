import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../auth/controller/auth_controller.dart';
import '../../vod_stream/controller/vod_playlist_controller.dart';
import '../model/vod.dart';
import '../repository/vod_repository_wrapper.dart';

part 'vod_controller.g.dart';

// vod and vod path

@riverpod
class VodController extends _$VodController {
  late VodRepositoryWrapper _repository;

  @override
  void build() {
    _repository = ref.watch(vodRepositoryWrapperProvider);
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
    final result = await _repository.getVodDetail(videoNo: videoNo);
    return result.when(
      success: (vod) => vod,
      failure: (_) => null,
    );
  }

  Future<VodPlay?> _getVodPlay({required int videoNo}) async {
    final Vod? vod = await _getVodDetail(videoNo: videoNo);

    if (vod == null) return null;

    // classic - VOD without liveRewindPlaybackJson needs playback URL fetch
    if (vod.liveRewindPlaybackJson == null) {
      // videoId and inKey are required for classic VOD playback
      if (vod.videoId == null || vod.inKey == null) return null;

      final cookies = ref.read(authControllerProvider.notifier).getCookie();

      final result = await _repository.getVodPlaybackUrl(
        videoId: vod.videoId!,
        inKey: vod.inKey!,
        cookies: cookies,
      );

      return result.when(
        success: (m3uAddress) => (vod, m3uAddress),
        failure: (_) => null,
      );
    }
    // new (maybe the streamer used the time machine function)
    else {
      return (vod, vod.liveRewindPlaybackJson!.media.first.path);
    }
  }
}
