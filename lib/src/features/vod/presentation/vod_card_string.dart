abstract final class VodCardString {
  static const fallbackChannelName = '동영상';
  static const upload = '업로드';
  static const replay = '다시보기';
  static const viewCountUnit = '회';
  static const unknownPublishDate = '-';
  static const thousandUnit = '천';
  static const tenThousandUnit = '만';

  static String watchedLive(String count) {
    return '$count 시청한 라이브';
  }

  static String daysAgo(int value) {
    return '$value일 전';
  }

  static String hoursAgo(int value) {
    return '$value시간 전';
  }

  static String thousandCount(String value, String suffix) {
    return '$value$thousandUnit$suffix';
  }

  static String tenThousandCount(String value, String suffix) {
    return '$value$tenThousandUnit$suffix';
  }
}
