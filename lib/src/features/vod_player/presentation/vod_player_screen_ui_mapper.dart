import '../../../core/utils/utils.dart';
import 'vod_player_screen_string.dart';

abstract final class VodPlayerScreenUiMapper {
  static String timeText(Duration duration) {
    return formatFixedHourMinuteSecond(duration);
  }

  static String positionDurationText({
    required Duration position,
    required Duration duration,
  }) {
    return VodPlayerScreenString.timeSummary(
      timeText(position),
      timeText(duration),
    );
  }

  static int playbackIntervalSeconds(int index) {
    return switch (index) {
      0 => 5,
      1 => 10,
      2 => 30,
      _ => 10,
    };
  }
}
