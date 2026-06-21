import '../domain/use_cases/check_vod_player_entry.dart';

abstract final class VodPlayerEntryString {
  static const dialogTitle = '시청 제한';
  static const confirm = '확인';
  static const resumeTitle = '이어 보시겠습니까?';
  static const resumeStartOver = '처음부터';
  static const resumeContinue = '이어보기';

  static String resumeBody(String position) {
    return '$position부터 이어볼까요?';
  }

  static String blockedContent(VodPlayerEntryBlockReason reason) {
    return switch (reason) {
      VodPlayerEntryBlockReason.abroad => '현재 접속 국가에서는 시청할 수 없는 영상입니다',
      VodPlayerEntryBlockReason.restricted ||
      VodPlayerEntryBlockReason.missingVideoId => '시청이 제한된 방송입니다',
      VodPlayerEntryBlockReason.adult =>
        '사용자 보호를 위해 연령 제한이 설정된 동영상입니다\n시청을 원하면 로그인 후 본인 인증을 완료해주세요',
      VodPlayerEntryBlockReason.membership =>
        '네이버플러스 멤버십 또는 치트키 유저만 시청할 수 있습니다',
    };
  }
}
