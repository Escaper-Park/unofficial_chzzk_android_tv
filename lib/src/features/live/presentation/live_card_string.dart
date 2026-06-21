abstract final class LiveCardString {
  static const live = 'LIVE';
  static const watchParty = '같이보기';
  static const watchPartyPlus = '같이보기+';

  static String watchingCount(String count) {
    return '$count명 시청 중';
  }
}
