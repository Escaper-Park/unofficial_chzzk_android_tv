import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/core/utils/utils.dart';

void main() {
  test('formats durations as fixed hour-minute-second text', () {
    expect(formatFixedHourMinuteSecond(Duration.zero), '00:00:00');
    expect(
      formatFixedHourMinuteSecond(
        const Duration(hours: 1, minutes: 2, seconds: 3),
      ),
      '01:02:03',
    );
    expect(
      formatFixedHourMinuteSecond(const Duration(seconds: -1)),
      '00:00:00',
    );
  });

  test('formats Korean decimal numbers', () {
    expect(formatKoDecimal(0), '0');
    expect(formatKoDecimal(1234), '1,234');
    expect(formatKoDecimal(1234567), '1,234,567');
  });
}
