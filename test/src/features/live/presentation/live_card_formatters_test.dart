import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/live/presentation/view/shared/live_card_formatters.dart';

void main() {
  test('formats elapsed live duration as fixed hour-minute-second text', () {
    expect(formatLiveCardElapsed(Duration.zero), '00:00:00');
    expect(
      formatLiveCardElapsed(const Duration(minutes: 10, seconds: 5)),
      '00:10:05',
    );
    expect(
      formatLiveCardElapsed(
        const Duration(hours: 1, minutes: 2, seconds: 3),
      ),
      '01:02:03',
    );
  });

  test('parses openDate without offset as KST wall-clock time', () {
    expect(
      parseLiveCardOpenDate('2026-06-06 12:00:00')?.toUtc(),
      DateTime.utc(2026, 6, 6, 3),
    );
    expect(
      parseLiveCardOpenDate('2026-06-06T12:00:00+09:00')?.toUtc(),
      DateTime.utc(2026, 6, 6, 3),
    );
  });
}
