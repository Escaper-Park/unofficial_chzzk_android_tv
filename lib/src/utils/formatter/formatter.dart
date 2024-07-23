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
}

extension DurationX on Duration {
  String paddedDuration() => CustomFormatter.formatPaddedTimeFromDuration(this);
}

extension IntX on int? {
  String commaFormat() => CustomFormatter.formatNumToCommaString(this);
}
