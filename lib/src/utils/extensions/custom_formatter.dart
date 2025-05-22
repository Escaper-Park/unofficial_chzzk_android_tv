import 'package:intl/intl.dart';

abstract class CustomFormatter {
  const CustomFormatter._();

  /// Add commas to an int value every 3 digits.
  static String formatIntToCommaStr(int number) {
    final formatter = NumberFormat('#,###', 'en_US');

    return formatter.format(number);
  }

  /// Parse Dart DateTime from String DateTime of 'yyyy-MM-dd HH:mm:ss'.
  static DateTime parseDateTimeFromDateTimeStr(String dateTimeStr) =>
      DateFormat('yyyy-MM-dd HH:mm:ss').parse(dateTimeStr);

  /// Format Duration to String as '$hh:$mm:$ss'
  static String formatDurationToPaddedTimeStr(Duration duration) {
    final String hours = duration.inHours.toString().padLeft(2, '0');
    final String mins = (duration.inMinutes % 60).toString().padLeft(2, '0');
    final String secs = (duration.inSeconds % 60).toString().padLeft(2, '0');

    return '$hours:$mins:$secs';
  }

  /// Format int Timestamp to String as '$HH:$mm' for chat time.
  static String formatTimestampToTimeStr(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp);
    final formatter = DateFormat('HH:mm');

    return formatter.format(date);
  }

  /// Format int to String number with a unit.
  static String formatNumberToStringUnit(int number) {
    const List<MapEntry<int, String>> units = [
      MapEntry(10000, '만'),
      MapEntry(1000, '천'),
    ];

    for (final entry in units) {
      if (number >= entry.key) {
        final double result = number / entry.key;
        return '${result.toStringAsFixed(1)}${entry.value}회';
      }
    }

    return '$number회';
  }

  /// Format int playerMessageTime to String as '$HH:$mm:$ss'.
  static String formatPlayerMessageTimeToHms(int playerMessageTime) {
    final int totalSec = playerMessageTime ~/ 1000;

    final String hours = ((totalSec ~/ 60) ~/ 60).toString().padLeft(2, '0');
    final String mins = ((totalSec ~/ 60) % 60).toString().padLeft(2, '0');
    final String secs = (totalSec % 60).toString().padLeft(2, '0');

    return '$hours:$mins:$secs';
  }
}
