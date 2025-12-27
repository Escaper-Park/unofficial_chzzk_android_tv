import 'package:flutter_test/flutter_test.dart';
import 'package:unofficial_chzzk_android_tv/src/utils/extensions/custom_formatter.dart';

void main() {
  group('CustomFormatter 테스트', () {
    test('formatIntToCommaStr - 숫자에 콤마 추가 테스트', () {
      expect(CustomFormatter.formatIntToCommaStr(1000), '1,000');
      expect(CustomFormatter.formatIntToCommaStr(1234567), '1,234,567');
      expect(CustomFormatter.formatIntToCommaStr(123), '123');
      expect(CustomFormatter.formatIntToCommaStr(0), '0');
    });

    test('parseDateTimeFromDateTimeStr - 날짜 문자열 파싱 테스트', () {
      const dateTimeStr = '2024-01-15 14:30:25';
      final parsedDate = CustomFormatter.parseDateTimeFromDateTimeStr(dateTimeStr);
      
      expect(parsedDate.year, 2024);
      expect(parsedDate.month, 1);
      expect(parsedDate.day, 15);
      expect(parsedDate.hour, 14);
      expect(parsedDate.minute, 30);
      expect(parsedDate.second, 25);
    });

    test('formatDurationToPaddedTimeStr - Duration을 시:분:초 형식으로 변환', () {
      expect(
        CustomFormatter.formatDurationToPaddedTimeStr(const Duration(hours: 1, minutes: 23, seconds: 45)),
        '01:23:45',
      );
      expect(
        CustomFormatter.formatDurationToPaddedTimeStr(const Duration(minutes: 5, seconds: 9)),
        '00:05:09',
      );
      expect(
        CustomFormatter.formatDurationToPaddedTimeStr(const Duration(seconds: 30)),
        '00:00:30',
      );
    });

    test('formatTimestampToTimeStr - 타임스탬프를 시:분 형식으로 변환', () {
      // 2024년 1월 1일 14:30:00 UTC
      final timestamp = DateTime(2024, 1, 1, 14, 30, 0).millisecondsSinceEpoch;
      final result = CustomFormatter.formatTimestampToTimeStr(timestamp);
      
      // 로컬 시간대에 따라 결과가 다를 수 있으므로 형식만 확인
      expect(result, matches(r'^\d{2}:\d{2}$'));
    });

    test('formatNumberToStringUnit - 숫자를 단위와 함께 문자열로 변환', () {
      expect(CustomFormatter.formatNumberToStringUnit(50000), '5.0만회');
      expect(CustomFormatter.formatNumberToStringUnit(12000), '1.2만회');
      expect(CustomFormatter.formatNumberToStringUnit(5000), '5.0천회');
      expect(CustomFormatter.formatNumberToStringUnit(1500), '1.5천회');
      expect(CustomFormatter.formatNumberToStringUnit(999), '999회');
      expect(CustomFormatter.formatNumberToStringUnit(0), '0회');
    });

    test('formatPlayerMessageTimeToHms - 플레이어 메시지 시간을 시:분:초 형식으로 변환', () {
      expect(
        CustomFormatter.formatPlayerMessageTimeToHms(3661000), // 1시간 1분 1초
        '01:01:01',
      );
      expect(
        CustomFormatter.formatPlayerMessageTimeToHms(125000), // 2분 5초
        '00:02:05',
      );
      expect(
        CustomFormatter.formatPlayerMessageTimeToHms(30000), // 30초
        '00:00:30',
      );
      expect(
        CustomFormatter.formatPlayerMessageTimeToHms(0),
        '00:00:00',
      );
    });
  });
} 