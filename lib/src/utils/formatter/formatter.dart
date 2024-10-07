import 'package:intl/intl.dart';

class CustomFormatter {
  /// Add commas to an int value every tree digits.
  static String formatNumToCommaString(int? number) {
    final formatter = NumberFormat("#,###", 'en_US');

    return formatter.format(number);
  }

  /// Parse DateTime from string dateTime of 'yyyy-MM-dd HH:mm:ss'.
  static DateTime parseDateTimeFromString(String stringDateTime) {
    return DateFormat('yyyy-MM-dd HH:mm:ss').parse(stringDateTime);
  }

  /// format duration to string as '$hours:$mins:$seconds'
  static String formatPaddedTimeFromDuration(Duration duration) {
    final String hours = duration.inHours.toString().padLeft(2, '0');
    final String mins = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final String secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$mins:$secs';
  }

  /// Timestamp to HH:mm
  static String formatTimeStampToHoursAndMins(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    String formattedTime = DateFormat('HH:mm').format(date);

    return formattedTime;
  }

  /// playerMessageTime to HH:mm:ss
  static String formatPlayerMessageTimeToHms(int playerMessageTime) {
    int totalSec = playerMessageTime ~/ 1000;

    int secs = totalSec % 60;
    int mins = (totalSec ~/ 60) % 60;
    int hours = (totalSec ~/ 60) ~/ 60;

    String formattedTime =
        '${hours.toString().padLeft(2, '0')}:${mins.toString().padLeft(2, '0')}:${secs.toString().padLeft(2, '0')}';

    return formattedTime;
  }
}

extension DurationX on Duration {
  String paddedDuration() => CustomFormatter.formatPaddedTimeFromDuration(this);
}

extension IntX on int? {
  String commaFormat() => CustomFormatter.formatNumToCommaString(this);
  String timestampTohhmm() =>
      CustomFormatter.formatTimeStampToHoursAndMins(this!);
  String playerMsgTimeTohhmmss() =>
      CustomFormatter.formatPlayerMessageTimeToHms(this!);
}
