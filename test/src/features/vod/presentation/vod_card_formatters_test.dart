import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/features/vod/presentation/view/shared/vod_card_formatters.dart';

void main() {
  test('formats VOD duration as fixed hour-minute-second text', () {
    expect(formatVodCardElapsed(Duration.zero), '00:00:00');
    expect(
      formatVodCardElapsed(const Duration(minutes: 2)),
      '00:02:00',
    );
    expect(
      formatVodCardElapsed(
        const Duration(hours: 1, minutes: 2, seconds: 3),
      ),
      '01:02:03',
    );
  });

  test('formats grouped read count and relative date separately', () {
    final now = DateTime(2026, 6, 20, 12);
    final publishDateAt = now
        .subtract(const Duration(days: 3))
        .millisecondsSinceEpoch;

    expect(formatVodCardGrouped(1234), '1,234');
    expect(formatVodCardPublishDate('2026-06-01 12:00:00'), '2026-06-01');
    expect(
      formatVodCardRelativeFromEpochMilliseconds(publishDateAt, now: now),
      '3일 전',
    );
  });

  test('formats watched live count in thousands and ten-thousands', () {
    expect(
      formatVodCardCompactTenThousandCount(9208, suffix: '회'),
      '9천회',
    );
    expect(
      formatVodCardCompactTenThousandCount(15000, suffix: '회'),
      '1.5만회',
    );
  });
}
