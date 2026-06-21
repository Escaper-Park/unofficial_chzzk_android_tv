import 'package:intl/intl.dart';

String formatFixedHourMinuteSecond(Duration duration) {
  final seconds = duration.inSeconds < 0 ? 0 : duration.inSeconds;
  final hours = seconds ~/ Duration.secondsPerHour;
  final minutes =
      (seconds % Duration.secondsPerHour) ~/ Duration.secondsPerMinute;
  final remainingSeconds = seconds % Duration.secondsPerMinute;
  final hourLabel = hours.toString().padLeft(2, '0');
  final minuteLabel = minutes.toString().padLeft(2, '0');
  final secondLabel = remainingSeconds.toString().padLeft(2, '0');

  return '$hourLabel:$minuteLabel:$secondLabel';
}

String formatKoDecimal(int value) {
  return _koDecimalFormat.format(value);
}

final _koDecimalFormat = NumberFormat.decimalPattern('ko_KR');
