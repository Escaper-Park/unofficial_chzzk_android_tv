import '../../../core/utils/utils.dart';

abstract final class LivePlayerScreenUiMapper {
  static String? viewerCountText(int? count) {
    if (count == null) {
      return null;
    }

    return formatKoDecimal(count);
  }

  static String? elapsedText({
    required String? openDate,
    required DateTime now,
  }) {
    final startedAt = parseOpenDate(openDate);
    if (startedAt == null) {
      return null;
    }

    return formatElapsed(now.difference(startedAt));
  }

  static DateTime? parseOpenDate(String? value) {
    final trimmed = value?.trim();
    if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
      return null;
    }

    if (_explicitOffsetPattern.hasMatch(trimmed)) {
      return DateTime.tryParse(trimmed)?.toLocal();
    }

    final match = _dateTimeWithoutOffsetPattern.firstMatch(trimmed);
    if (match == null) {
      return DateTime.tryParse(trimmed)?.toLocal();
    }

    final kstDateTime = DateTime.utc(
      int.parse(match.group(1)!),
      int.parse(match.group(2)!),
      int.parse(match.group(3)!),
      int.parse(match.group(4)!),
      int.parse(match.group(5)!),
      int.parse(match.group(6)!),
    );

    return kstDateTime.subtract(_kstOffset).toLocal();
  }

  static String formatElapsed(Duration duration) {
    return formatFixedHourMinuteSecond(duration);
  }
}

const _kstOffset = Duration(hours: 9);

final _explicitOffsetPattern = RegExp(r'(?:[zZ]|[+-]\d{2}:?\d{2})$');
final _dateTimeWithoutOffsetPattern = RegExp(
  r'^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2}):(\d{2})(?:\.\d+)?$',
);
