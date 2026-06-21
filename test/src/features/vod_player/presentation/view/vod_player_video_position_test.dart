import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod_player/presentation/view/vod_player_video_position.dart';
import 'package:video_player/video_player.dart';

void main() {
  test('returns zero while video value is not initialized', () {
    expect(
      safeVodPlayerPositionSeconds(
        const VideoPlayerValue(
          duration: Duration(seconds: 30),
          position: Duration(seconds: 12),
        ),
      ),
      0,
    );
  });

  test('rounds initialized video position to nearest second', () {
    expect(
      safeVodPlayerPositionSeconds(
        const VideoPlayerValue(
          duration: Duration(seconds: 30),
          position: Duration(milliseconds: 1499),
          isInitialized: true,
        ),
      ),
      1,
    );
    expect(
      safeVodPlayerPositionSeconds(
        const VideoPlayerValue(
          duration: Duration(seconds: 30),
          position: Duration(milliseconds: 1500),
          isInitialized: true,
        ),
      ),
      2,
    );
  });

  test('clamps negative initialized position to zero', () {
    expect(
      safeVodPlayerPositionSeconds(
        const VideoPlayerValue(
          duration: Duration(seconds: 30),
          position: Duration(milliseconds: -1500),
          isInitialized: true,
        ),
      ),
      0,
    );
  });
}
