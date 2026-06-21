import '../../../../../core/utils/utils.dart';
import '../../vod_card_string.dart';

String formatVodCardElapsed(Duration duration) {
  return formatFixedHourMinuteSecond(duration);
}

String formatVodCardRelativeFromEpochMilliseconds(
  int epochMilliseconds, {
  DateTime? now,
}) {
  final publishedAt = DateTime.fromMillisecondsSinceEpoch(epochMilliseconds);
  final rawHours = (now ?? DateTime.now()).difference(publishedAt).inHours;
  final hours = rawHours < 0 ? 0 : rawHours;

  if (hours >= Duration.hoursPerDay) {
    return VodCardString.daysAgo(hours ~/ Duration.hoursPerDay);
  }

  return VodCardString.hoursAgo(hours);
}

String formatVodCardGrouped(int value) {
  return formatKoDecimal(value);
}

String formatVodCardCompactTenThousandCount(
  int value, {
  String suffix = '',
}) {
  if (value >= 1000 && value < 10000) {
    return VodCardString.thousandCount('${value ~/ 1000}', suffix);
  }

  if (value < 10000) {
    return '$value$suffix';
  }

  final compactValue = value / 10000;
  final compactLabel = compactValue == compactValue.truncateToDouble()
      ? compactValue.toStringAsFixed(0)
      : compactValue.toStringAsFixed(1);

  return VodCardString.tenThousandCount(compactLabel, suffix);
}

String formatVodCardPublishDate(String rawPublishDate) {
  final value = rawPublishDate.trim();

  if (value.isEmpty) {
    return VodCardString.unknownPublishDate;
  }

  return value.split(' ').first;
}

String? trimmedVodCardTextOrNull(String? value) {
  final trimmed = value?.trim();

  if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
    return null;
  }

  return trimmed;
}

bool hasVodCardText(String? value) {
  return trimmedVodCardTextOrNull(value) != null;
}
