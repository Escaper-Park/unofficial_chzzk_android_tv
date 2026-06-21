import 'package:video_player/video_player.dart';

int safeVodPlayerPositionSeconds(VideoPlayerValue value) {
  if (!value.isInitialized) {
    return 0;
  }

  final seconds =
      (value.position.inMilliseconds / Duration.millisecondsPerSecond).round();
  return seconds < 0 ? 0 : seconds;
}
