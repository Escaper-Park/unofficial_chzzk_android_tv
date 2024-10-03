import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../vod/model/vod.dart';

part 'vod_playlist_controller.g.dart';

/// Vod and vodPath
typedef VodPlay = (Vod, String);

@Riverpod(keepAlive: true)
class VodPlaylistController extends _$VodPlaylistController {
  @override
  (Vod, String)? build() {
    return null;
  }

  bool checkIsSameVod({required int videoNo}) {
    return state?.$1.videoNo == videoNo;
  }

  void setVod({required VodPlay vodPlay}) {
    if (!checkIsSameVod(videoNo: vodPlay.$1.videoNo)) state = vodPlay;
  }

  void reset() {
    state = null;
  }
}
