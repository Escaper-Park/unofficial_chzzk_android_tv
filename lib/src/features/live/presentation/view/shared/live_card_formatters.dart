import '../../../../../core/utils/utils.dart';

const _kstOffset = Duration(hours: 9);

final _explicitOffsetPattern = RegExp(r'(?:[zZ]|[+-]\d{2}:?\d{2})$');
final _dateTimeWithoutOffsetPattern = RegExp(
  r'^(\d{4})-(\d{2})-(\d{2})[ T](\d{2}):(\d{2}):(\d{2})(?:\.\d+)?$',
);

String formatLiveCardElapsed(Duration duration) {
  return formatFixedHourMinuteSecond(duration);
}

String formatLiveCardGrouped(int value) {
  return formatKoDecimal(value);
}

DateTime? parseLiveCardOpenDate(String? value) {
  final trimmed = trimmedLiveCardTextOrNull(value);

  if (trimmed == null) {
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

String? trimmedLiveCardTextOrNull(String? value) {
  final trimmed = value?.trim();

  if (trimmed == null || trimmed.isEmpty || trimmed.toLowerCase() == 'null') {
    return null;
  }

  return trimmed;
}

bool hasLiveCardText(String? value) {
  return trimmedLiveCardTextOrNull(value) != null;
}
